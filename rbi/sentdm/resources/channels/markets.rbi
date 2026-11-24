# typed: strong

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
        sig do
          params(
            type: String,
            channel: String,
            country: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Channels::APIResponseOfChannelMarket)
        end
        def retrieve(
          # Path param: Sender type: local, mobile, 10dlc (or ten_dlc), toll_free,
          # short_code, alphanumeric. Matched ignoring case.
          type,
          # Path param: The channel: `sms`. Other channels are `501` until they have markets
          channel:,
          # Path param: ISO 3166-1 alpha-2 country code, e.g. us
          country:,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

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
        sig do
          params(
            type: String,
            channel: String,
            country: String,
            compliance: Sentdm::Channels::MarketCompliance::OrHash,
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Channels::APIResponseOfChannelMarket)
        end
        def update(
          # Path param: Sender type, e.g. 10dlc (or ten_dlc), local or alphanumeric. Only
          # 10dlc in us declares a brand.
          type,
          # Path param: The channel: `sms`. Other channels are `501` until they have markets
          channel:,
          # Path param: ISO 3166-1 alpha-2 country code, e.g. us
          country:,
          # Body param: The compliance values a market registers with. `brand` and
          # `campaign` apply to US `TEN_DLC`; other markets fill this map with the document
          # keys their own requirements name.
          compliance: nil,
          # Body param
          sandbox: nil,
          # Header param: Unique key to ensure idempotent request processing. Must be 1-255
          # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
          # hours per key per customer.
          idempotency_key: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # Every market you send SMS in, each with its sender, where that sender stands,
        # and what its compliance holds.
        #
        # The same entries `GET /v3/channels` reports under `sms`, and the same shape
        # `GET /v3/channels/sms/{country}/{type}` returns for one of them — so a list, a
        # member read and the all-channels read cannot describe a market differently.
        #
        # Send `x-profile-id` with an organization key to list one of your profiles'
        # markets.
        sig do
          params(
            channel: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Channels::APIResponseOfListOfChannelMarket)
        end
        def list(
          # The channel: `sms`. Other channels are `501` until they have markets
          channel,
          # Profile UUID to scope the request to a child profile. Only organization API keys
          # can use this header. The profile must belong to the calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

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
        sig do
          params(
            type: String,
            channel: String,
            country: String,
            numbers:
              T::Array[T.nilable(Sentdm::Channels::SMSNumberRequest::OrHash)],
            idempotency_key: String,
            campaign_id: T.nilable(String),
            sandbox: T::Boolean,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Channels::APIResponseOfChannelMarket)
        end
        def add_numbers(
          # Path param: Sender type: `ten_dlc` (or `10dlc`) or `local`
          type,
          # Path param: The channel: `sms`. Other channels are `501` until their numbers are
          # available
          channel:,
          # Path param: ISO 3166-1 alpha-2 country code, e.g. `US`
          country:,
          # Body param: The numbers, one entry per area code, e.g. [{"area_code": "415",
          # "quantity": 2}, {"quantity": 1}]. quantity defaults to 1, and an entry without
          # area_code means any area code. Required.
          #
          # POST adds them to what the market or campaign already asks for; PATCH replaces
          # that list with them, and has to cover every number already held, since none is
          # ever released.
          numbers:,
          # Header param: Unique key to ensure idempotent request processing. Must be 1-255
          # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
          # hours per key per customer.
          idempotency_key:,
          # Body param: The campaign to add the numbers to, as campaigns[].id reports it.
          # Required on SMS US TEN_DLC, where every number belongs to a campaign; refused on
          # a market without campaigns.
          campaign_id: nil,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # Every number you hold in one market (country and sender type): `ACTIVE` once it
        # can send, `PROVISIONING` while it is still to be assigned (it then has no
        # `sender_value` yet), `INACTIVE` once it could send and no longer can. US
        # `TEN_DLC` numbers name their `campaign_id`, and `?campaign_id=` keeps one
        # campaign's.
        #
        # A market you do not hold is `404`. Add numbers with `POST` on the same path.
        sig do
          params(
            type: String,
            channel: String,
            country: String,
            campaign_id: T.nilable(String),
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Channels::APIResponseOfMarketNumbers)
        end
        def list_numbers(
          # Path param: Sender type: `ten_dlc` (or `10dlc`), `local`, `mobile`, `toll_free`,
          # `short_code`, `alphanumeric`
          type,
          # Path param: The channel: `sms`. Other channels are `501` until their numbers are
          # available
          channel:,
          # Path param: ISO 3166-1 country code, e.g. `US`
          country:,
          # Query param: Only the numbers of this campaign (US TEN_DLC); all of the market's
          # when absent.
          campaign_id: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

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
        sig do
          params(
            type: String,
            channel: String,
            country: String,
            numbers:
              T::Array[T.nilable(Sentdm::Channels::SMSNumberRequest::OrHash)],
            campaign_id: T.nilable(String),
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Channels::APIResponseOfChannelMarket)
        end
        def replace_numbers(
          # Path param: Sender type: `ten_dlc` (or `10dlc`) or `local`
          type,
          # Path param: The channel: `sms`. Other channels are `501` until their numbers are
          # available
          channel:,
          # Path param: ISO 3166-1 alpha-2 country code, e.g. `US`
          country:,
          # Body param: The numbers, one entry per area code, e.g. [{"area_code": "415",
          # "quantity": 2}, {"quantity": 1}]. quantity defaults to 1, and an entry without
          # area_code means any area code. Required.
          #
          # POST adds them to what the market or campaign already asks for; PATCH replaces
          # that list with them, and has to cover every number already held, since none is
          # ever released.
          numbers:,
          # Body param: The campaign to add the numbers to, as campaigns[].id reports it.
          # Required on SMS US TEN_DLC, where every number belongs to a campaign; refused on
          # a market without campaigns.
          campaign_id: nil,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Header param: Unique key to ensure idempotent request processing. Must be 1-255
          # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
          # hours per key per customer.
          idempotency_key: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Sentdm::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
