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
      class SMS
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
        # @return [Sentdm::Resources::Channels::SMS::TenDlc]
        attr_reader :ten_dlc

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::SMSCreateParams} for more details.
        #
        # Gives the customer a sender in one country — the first market it sends in, and
        # the fifth. Two addresses, one call: `POST /v3/channels/sms` with `country` and
        # `number_type` in the body, or `POST /v3/channels/sms/{country}/{type}` with the
        # market as the path (the path wins over the body).
        #
        # ## What to have in place first
        #
        # **Call `GET /v3/channels/sms/{country}/compliance` first.** It lists every
        # sender type the country offers and, for each, the compliance values and
        # documents to send, with their formats and options. You never have to track forty
        # countries' rules yourself.
        #
        # **A market that registers with a compliance regime needs an identity, and this
        # call takes one.** US `TEN_DLC` registers with The Campaign Registry and files
        # that registration against a business identity. Send it in `compliance.brand` and
        # it is recorded here, before the registration that attaches to it — so a customer
        # with no identity reaches a first 10DLC market in one call.
        #
        # `{ "inherit": true }` runs on your organization's instead. A market with neither
        # — none stored, none sent — is `400`, because accepting it would write a channel
        # that could never register and leave it provisioning for ever with nothing saying
        # why.
        #
        # **Everything the regime wants arrives in this request's `compliance`**, as two
        # declared objects: `brand` — the identity the registration is filed against — and
        # `campaign`, with the use case, the consent narrative, the volume, the sample
        # messages and the keywords. There is nothing to set up first. Nothing is
        # submitted here either: the rows are what a submission is later assembled from,
        # and filing is externally rejectable so it happens on its own path.
        #
        # **Your own brand has to be complete here.** It must carry every field the regime
        # asks of it, counting what you already hold — send the rest in this request. A
        # missing one is `400` naming each field, rather than a `202` for a market that
        # could never be filed. A brand you inherit is asked for nothing.
        #
        # **A campaign of your own is optional here.** Sent, it has to be complete in the
        # same way, and the `numbers` you ask for go on it. Omitted, no campaign is
        # written and `numbers` and `area_codes` are refused (`400`), because numbers
        # belong to a campaign: the market reads `ACTION_NEEDED` until you add one with
        # `POST /v3/channels/sms/US/TEN_DLC/campaigns`, then its numbers with
        # `POST /v3/channels/sms/US/TEN_DLC/numbers`.
        #
        # A market that registers with nobody — an alphanumeric sender in most countries —
        # needs neither, and may need documents instead.
        #
        # ## Sending it
        #
        # Takes the same fields `channels.sms` takes on `POST /v3/sender-profiles`,
        # because it is the same work, and both run one provisioning path. `compliance` is
        # top-level and answers for the market in this request, carrying `brand` and
        # `campaign` where the market registers.
        #
        # **Accepts multipart as well as JSON**, with each file named after the compliance
        # key it satisfies — a market that pre-registers its sender needs its documents at
        # the same moment it needs the sender. Every required document must be attached to
        # this request; a missing or invalid file is rejected before the market is added.
        #
        # **`area_codes` puts the sender somewhere specific**, in your order of
        # preference, for a `LOCAL` sender in any country or a US `TEN_DLC` sender — a
        # 10DLC number is an ordinary local long code bound to a registered campaign, so
        # both take the same codes out of the same inventory. It is honoured exactly: you
        # get a number in one of the codes you named or you get none, never one in a code
        # you left out.
        #
        # ## Several numbers
        #
        # **`numbers` lists the numbers you want, one entry per area code**, e.g.
        # `[{"area_code": "212", "quantity": 2}, {"quantity": 1}]` for two numbers in 212
        # and one in any area code. `quantity` defaults to 1, and an entry without
        # `area_code` means any area code. Omit `numbers` for one number. It is for
        # `LOCAL` and `TEN_DLC` only and cannot be combined with `area_codes`. A market
        # holds at most 49 numbers.
        #
        # US `TEN_DLC` numbers belong to the market's campaign and are assigned when the
        # campaign is approved, not at request time. Until then they read as
        # `PROVISIONING` in the response's `numbers`, each with the area code it was asked
        # for. A profile inheriting your organization's campaign cannot request `numbers`
        # (`400`).
        #
        # **This call opens a market once. A market you already hold is `409`**, with a
        # sender or still waiting for one, and nothing is added to it here: change its
        # compliance with `PATCH /v3/channels/sms/{country}/{type}`, add numbers (and
        # their area codes) with `POST /v3/channels/sms/{country}/{type}/numbers`, and on
        # US `TEN_DLC` add a campaign with `POST /v3/channels/sms/US/TEN_DLC/campaigns`.
        # The `409` names them. A market is a `(country, sender_type)` pair, so a **second
        # sender type in a country you already send in is fine** — `US TOLL_FREE`
        # alongside `US TEN_DLC` is the ordinary case. Two of the same type is not.
        #
        # One exception: while a market's sender type is still unassigned, adding any type
        # to that country is `409`, because the market you have may be about to become the
        # one you asked for.
        #
        # Returns **the market**, in the shape `GET` and `PATCH` on
        # `/v3/channels/sms/{country}/{type}` use — so what this answers can be read back
        # and written back without reshaping. Not every channel you have: adding a market
        # cannot change an RCS agent or a WhatsApp account, and `GET /v3/channels` is the
        # whole picture. `201` when the market is ready; `202` while a sender or a
        # registration is still outstanding.
        #
        # Send `x-profile-id` with an organization key to add a market to one of your
        # profiles.
        #
        # @overload create(number_type:, area_codes: nil, compliance: nil, numbers: nil, sandbox: nil, sender_value: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param number_type [Symbol, Sentdm::Models::Channels::SMSCreateParams::NumberType] Body param: Sender type. Decides the provisioning flow and what compliance is as
        #
        # @param area_codes [Array<String>, nil] Body param: The area codes to put this sender in, in your own order of preferenc
        #
        # @param compliance [Sentdm::Models::Channels::MarketCompliance] Body param: The compliance values a market registers with. `brand` and `campaign
        #
        # @param numbers [Array<Sentdm::Models::Channels::SMSNumberRequest>, nil] Body param: The numbers to assign, one entry per area code, e.g.
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param sender_value [String, nil] Body param: The sender's identity where the caller chooses it. Required when num
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfChannelMarket]
        #
        # @see Sentdm::Models::Channels::SMSCreateParams
        def create(params)
          parsed, options = Sentdm::Channels::SMSCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: "v3/channels/sms",
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
          @ten_dlc = Sentdm::Resources::Channels::SMS::TenDlc.new(client: client)
        end
      end
    end
  end
end
