# frozen_string_literal: true

module Sentdm
  module Resources
    class Channels
      # The senders you send from, one per channel.
      #
      # **SMS is a list of markets**, each keyed by `(country, number_type)` — a
      # customer can hold `us/10dlc` and `gb/alphanumeric` at once, so a market is
      # addressed by the pair rather than by country alone. **WhatsApp and RCS are
      # single**: a customer has one business account and one agent. **Voice is per
      # number**: each number you hold can carry phone calls on its own
      # (`POST /v3/channels/voice`), each with the callback URL Sent asks what to do
      # with its calls, one of them is the default line for calls placed from your app,
      # and voice tokens are minted with `POST /v3/voice/tokens`. Read your voice
      # numbers with `GET /v3/channels/voice` and change one with
      # `PATCH /v3/channels/voice/{number}`.
      #
      # ## Compliance lives on the market
      #
      # Adding a market records everything that market registers with, in its
      # `compliance` object. Only **US `TEN_DLC`** registers with a regime — The
      # Campaign Registry — and it is the only market whose compliance carries `brand`
      # and `campaign`. Everywhere else compliance is documents, and many markets ask
      # for none at all.
      #
      # `GET` and `PATCH` on a market return and accept the same shape, so what comes
      # back can be sent back: an omitted key is left alone, and a key reported in
      # `requirements` is the path into the body that clears it.
      #
      # Call `GET /v3/compliance/requirements` first — it answers what a market demands
      # before you hold it, with a body you can fill in and post.
      class Markets
        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::MarketRetrieveParams} for more details.
        #
        # Reads one market you send in — its sender, where that sender stands, and
        # everything its compliance holds.
        #
        # ## What `compliance` carries
        #
        # A market that registers with a compliance regime reports `brand` — the identity
        # the registration is filed against — and `campaign`, the programme filed against
        # it. Each carries `inherit`, saying whether it is yours or your organization's.
        #
        # `compliance.brand.vetting` is the brand's external vetting at The Campaign
        # Registry, read-only: `score` (0-100, the figure US carriers set 10DLC throughput
        # by), `status` (`PENDING`, `UNSCORE`, `ACTIVE`, `FAILED` or `EXPIRED`; carriers
        # read the score of an `ACTIVE` vet only), `vetted_at` and `expires_at`. It is
        # `null` while no vetting record is held for the brand, and `score` is `null` for
        # a vet that has none yet. A profile on your organization's brand reads your
        # organization's vetting.
        #
        # A market that registers with nobody has neither, so **both keys are absent**
        # rather than null: absent says this market does not ask, where null would say it
        # asks and you supplied nothing. It reports `documents` instead.
        #
        # `GET /v3/compliance/requirements` says what a market demands of any new
        # customer; this says what you gave it.
        #
        # ## Writing it back
        #
        # **`PATCH` this same path**, with the `compliance` object from this response:
        #
        # ```json
        # { "compliance": { "brand": { "tax_id": "12-3456789" } } }
        # ```
        #
        # Nothing else to learn — what comes back can be sent back, an omitted key is left
        # alone. There is no sub-resource for either half: both are singletons of the
        # market, so both are written here.
        #
        # `GET /v3/compliance/requirements` says what a market demands of anybody; this
        # says what you gave it.
        #
        # Send `x-profile-id` with an organization key to read one of your profiles'
        # markets.
        #
        # @overload retrieve(type, channel:, country:, x_profile_id: nil, request_options: {})
        #
        # @param type [String] Path param: Sender type: local, mobile, 10dlc (or ten_dlc), toll_free, short_cod
        #
        # @param channel [String] Path param: The channel: `sms`. Other channels are `501` until they have markets
        #
        # @param country [String] Path param: ISO 3166-1 alpha-2 country code, e.g. us
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfChannelMarket]
        #
        # @see Sentdm::Models::Channels::MarketRetrieveParams
        def retrieve(type, params)
          parsed, options = Sentdm::Channels::MarketRetrieveParams.dump_request(params)
          channel =
            parsed.delete(:channel) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          country =
            parsed.delete(:country) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v3/channels/%1$s/%2$s/%3$s", channel, country, type],
            headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Channels::APIResponseOfChannelMarket,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::MarketUpdateParams} for more details.
        #
        # Supplies the market's identity and documents, and answers with the market as
        # stored — the same shape `GET` on this path returns.
        #
        # | To change                               | Send                                                                                                     |
        # | --------------------------------------- | -------------------------------------------------------------------------------------------------------- |
        # | a `brand` value (US `TEN_DLC`)          | `compliance.brand`, as below                                                                             |
        # | a registration sent back for correction | `compliance.brand` — the identity is accepted even once filed, and the registration goes back for review |
        # | a document, in any market               | a multipart file named after the document's key                                                          |
        # | a campaign                              | `PATCH /v3/channels/sms/US/TEN_DLC/campaigns/{id}` — `compliance.campaign` here is `400`                 |
        # | the numbers                             | `POST /v3/channels/{channel}/{country}/{type}/numbers` — `numbers` here is `400`                         |
        #
        # ## Partial, at every level
        #
        # **An omitted key is left alone. An explicit `null` clears it.** Those are
        # different requests, so `{}` changes nothing and is refused rather than silently
        # accepted, and correcting one field does not blank the others.
        #
        # ```json
        # { "compliance": { "brand": { "contact_phone": "+12125550123" } } }
        # ```
        #
        # | Body                           | Effect                                                       |
        # | ------------------------------ | ------------------------------------------------------------ |
        # | `"brand": { … }`               | supplies or corrects the identity, and takes one of your own |
        # | `"brand": { "inherit": true }` | runs on your organization's, giving up your own              |
        # | `"brand": null`                | the same thing, said the short way                           |
        # | key omitted                    | left exactly as it is                                        |
        #
        # The brand read on this path, its `id` and `vetting` included, can be sent back
        # unchanged: both are read-only and ignored.
        #
        # ## Every other market
        #
        # Markets that register with no regime have no brand, so `compliance` is `400`
        # there. Their compliance is documents, sent here as multipart.
        #
        # ## Documents
        #
        # Send `multipart/form-data` with **each file named after the compliance key it
        # satisfies** — the key `GET /v3/channels/{channel}/{country}/compliance` lists. A
        # file that matches no document the market asks for is `400` naming the keys that
        # would, and a file the upload rules refuse (empty, too large, an unsupported
        # type) is `422`. `compliance` may ride in the same form as a text part holding
        # its JSON.
        #
        # ## What it will refuse
        #
        # **A filed identity is `409`.** Once the registration has gone to The Campaign
        # Registry they hold a copy, and a local change would diverge from it silently.
        # The exception is a registration sent back for correction: the identity is
        # accepted, and the registration goes back for review. Refiling it with The
        # Campaign Registry stays with Sent.
        #
        # Nothing is submitted to a regime here. Send `x-profile-id` with an organization
        # key to write one of your profiles' markets.
        #
        # @overload update(type, channel:, country:, compliance: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param type [String] Path param: Sender type, e.g. 10dlc (or ten_dlc), local or alphanumeric. Only 10
        #
        # @param channel [String] Path param: The channel: `sms`. Other channels are `501` until they have markets
        #
        # @param country [String] Path param: ISO 3166-1 alpha-2 country code, e.g. us
        #
        # @param compliance [Sentdm::Models::Channels::MarketCompliance] Body param: The compliance values a market registers with. `brand` and `campaign
        #
        # @param sandbox [Boolean] Body param
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfChannelMarket]
        #
        # @see Sentdm::Models::Channels::MarketUpdateParams
        def update(type, params)
          parsed, options = Sentdm::Channels::MarketUpdateParams.dump_request(params)
          channel =
            parsed.delete(:channel) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          country =
            parsed.delete(:country) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :patch,
            path: ["v3/channels/%1$s/%2$s/%3$s", channel, country, type],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Channels::APIResponseOfChannelMarket,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::MarketListParams} for more details.
        #
        # Every market you send SMS in, each with its sender, where that sender stands,
        # and what its compliance holds.
        #
        # The same entries `GET /v3/channels` reports under `sms`, and the same shape
        # `GET /v3/channels/sms/{country}/{type}` returns for one of them — so a list, a
        # member read and the all-channels read cannot describe a market differently.
        #
        # Send `x-profile-id` with an organization key to list one of your profiles'
        # markets.
        #
        # @overload list(channel, x_profile_id: nil, request_options: {})
        #
        # @param channel [String] The channel: `sms`. Other channels are `501` until they have markets
        #
        # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfListOfChannelMarket]
        #
        # @see Sentdm::Models::Channels::MarketListParams
        def list(channel, params = {})
          parsed, options = Sentdm::Channels::MarketListParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v3/channels/%1$s", channel],
            headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Channels::APIResponseOfListOfChannelMarket,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::MarketAddNumbersParams} for more details.
        #
        # Adds numbers to a market you hold. They are **added** to what it already asks
        # for, never replacing it — with one exception: a US `TEN_DLC` campaign opened
        # without `numbers` asks for one number in any area code by default, and while it
        # holds no number yet, the first numbers added replace that default. Once it holds
        # one, they are added beside it.
        #
        # ## Where they go
        #
        # - **SMS US `TEN_DLC`**: to **one campaign of your own**, named by `campaign_id`
        #   — the `id` of an entry in the market's `compliance.campaigns`
        #   (`GET /v3/channels/sms/US/TEN_DLC`). Required: left out it is `400` naming
        #   your campaigns in service. One you inherit from your organization is `400`:
        #   its numbers are the organization's. One out of service — expired, deactivated
        #   or released — is `409`. A campaign the carriers have not approved yet gets its
        #   numbers when they do; an approved one gets them now. With everything it asks
        #   for, a campaign holds at most 49 numbers, counting one for each sender profile
        #   inheriting it.
        # - **`LOCAL`**: to the market, claimed from inventory now; what inventory cannot
        #   cover stays pending. No `campaign_id`. A market holds at most 49 numbers.
        # - **Any other sender type** takes no numbers: `400`.
        #
        # ## What to send
        #
        # `numbers` — the list `POST /v3/channels/sms` takes, one entry per area code —
        # and, on US `TEN_DLC`, `campaign_id`, required.
        #
        # Until a number is assigned it reads as `PROVISIONING` in the market's `numbers`,
        # with the area code it was asked for. Returns **the market**, in the shape
        # `GET /v3/channels/sms/{country}/{type}` returns, with `202`.
        #
        # @overload add_numbers(type, channel:, country:, numbers:, idempotency_key:, campaign_id: nil, sandbox: nil, x_profile_id: nil, request_options: {})
        #
        # @param type [String] Path param: Sender type: `ten_dlc` (or `10dlc`) or `local`
        #
        # @param channel [String] Path param: The channel: `sms`. Other channels are `501` until their numbers are
        #
        # @param country [String] Path param: ISO 3166-1 alpha-2 country code, e.g. `US`
        #
        # @param numbers [Array<Sentdm::Models::Channels::SMSNumberRequest, nil>] Body param: The numbers, one entry per area code, e.g. [{"area_code": "415", "qu
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param campaign_id [String, nil] Body param: The campaign to add the numbers to, as campaigns[].id reports it. Re
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfChannelMarket]
        #
        # @see Sentdm::Models::Channels::MarketAddNumbersParams
        def add_numbers(type, params)
          parsed, options = Sentdm::Channels::MarketAddNumbersParams.dump_request(params)
          channel =
            parsed.delete(:channel) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          country =
            parsed.delete(:country) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: ["v3/channels/%1$s/%2$s/%3$s/numbers", channel, country, type],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Channels::APIResponseOfChannelMarket,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::MarketListNumbersParams} for more details.
        #
        # Every number you hold in one market (country and sender type): `ACTIVE` once it
        # can send, `PROVISIONING` while it is still to be assigned (it then has no
        # `sender_value` yet), `INACTIVE` once it could send and no longer can. US
        # `TEN_DLC` numbers name their `campaign_id`, and `?campaign_id=` keeps one
        # campaign's.
        #
        # A market you do not hold is `404`. Add numbers with `POST` on the same path.
        #
        # @overload list_numbers(type, channel:, country:, campaign_id: nil, x_profile_id: nil, request_options: {})
        #
        # @param type [String] Path param: Sender type: `ten_dlc` (or `10dlc`), `local`, `mobile`, `toll_free`,
        #
        # @param channel [String] Path param: The channel: `sms`. Other channels are `501` until their numbers are
        #
        # @param country [String] Path param: ISO 3166-1 country code, e.g. `US`
        #
        # @param campaign_id [String, nil] Query param: Only the numbers of this campaign (US TEN_DLC); all of the market's
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfMarketNumbers]
        #
        # @see Sentdm::Models::Channels::MarketListNumbersParams
        def list_numbers(type, params)
          query_params = [:campaign_id]
          parsed, options = Sentdm::Channels::MarketListNumbersParams.dump_request(params)
          query = Sentdm::Internal::Util.encode_query_params(parsed.slice(*query_params))
          channel =
            parsed.delete(:channel) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          country =
            parsed.delete(:country) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v3/channels/%1$s/%2$s/%3$s/numbers", channel, country, type],
            query: query,
            headers: parsed.except(*query_params).transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Channels::APIResponseOfMarketNumbers,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::MarketReplaceNumbersParams} for more details.
        #
        # Replaces the numbers a market you hold asks for — their area codes and counts —
        # with the list you send. To add to them instead, use `POST` on this path.
        #
        # ## Whose numbers
        #
        # - **SMS US `TEN_DLC`**: **one campaign of your own**, named by `campaign_id` —
        #   the `id` of an entry in the market's `compliance.campaigns`. Required. So a
        #   campaign sent back for correction can change its area codes without being
        #   recreated. One you inherit from your organization is `400`; one out of service
        #   is `409`. With everything it asks for, a campaign holds at most 49 numbers,
        #   counting one for each sender profile inheriting it.
        # - **`LOCAL`**: the market's own, claimed from inventory now; what inventory
        #   cannot cover stays pending. No `campaign_id`.
        # - **Any other sender type** takes no numbers: `400`.
        #
        # ## What to send
        #
        # `numbers` — the list `POST /v3/channels/sms` takes, one entry per area code, an
        # entry without `area_code` meaning any — and, on US `TEN_DLC`, `campaign_id`.
        #
        # **Numbers already assigned are kept.** Nothing is released here, so a list that
        # no longer covers a number already held is `400`, naming how many it leaves out.
        # Lowering a count nothing has filled yet is fine.
        #
        # Until a number is assigned it reads as `PROVISIONING` in the market's `numbers`,
        # with the area code it was asked for. Returns **the market**, in the shape
        # `GET /v3/channels/sms/{country}/{type}` returns.
        #
        # @overload replace_numbers(type, channel:, country:, numbers:, campaign_id: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param type [String] Path param: Sender type: `ten_dlc` (or `10dlc`) or `local`
        #
        # @param channel [String] Path param: The channel: `sms`. Other channels are `501` until their numbers are
        #
        # @param country [String] Path param: ISO 3166-1 alpha-2 country code, e.g. `US`
        #
        # @param numbers [Array<Sentdm::Models::Channels::SMSNumberRequest, nil>] Body param: The numbers, one entry per area code, e.g. [{"area_code": "415", "qu
        #
        # @param campaign_id [String, nil] Body param: The campaign to add the numbers to, as campaigns[].id reports it. Re
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfChannelMarket]
        #
        # @see Sentdm::Models::Channels::MarketReplaceNumbersParams
        def replace_numbers(type, params)
          parsed, options = Sentdm::Channels::MarketReplaceNumbersParams.dump_request(params)
          channel =
            parsed.delete(:channel) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          country =
            parsed.delete(:country) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :patch,
            path: ["v3/channels/%1$s/%2$s/%3$s/numbers", channel, country, type],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Channels::APIResponseOfChannelMarket,
            options: options
          )
        end

        # @api private
        #
        # @param client [Sentdm::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
