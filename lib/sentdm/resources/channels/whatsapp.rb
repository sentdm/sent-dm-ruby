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
      class Whatsapp
        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::WhatsappCreateParams} for more details.
        #
        # Connects a WhatsApp Business Account shared with us through a Multi-Partner
        # Solution to the calling sender profile. Send `x-profile-id` for the profile the
        # account belongs to.
        #
        # **Two fields, because everything else is derived.** `waba_id` says which of your
        # organization's shared accounts this is — you hold one per client, and nothing
        # else can say which. `phone_number_id` names the account's number, which is what
        # assigns it to the profile as the number it sends from.
        #
        # The solution the account arrived through, the client business portfolio that
        # owns it, the access token and its expiry are all resolved from your
        # organization. They are not accepted here: the first two are Meta's answer about
        # provenance, and the token is minted per client business and rotates roughly
        # every sixty days, so a value you sent would be stale before it was useful.
        #
        # `phone_number_id` is optional. Omit it to connect the account now and settle the
        # number later — the channel reads as `ACTION_NEEDED` with `reason_code`
        # `CHANNEL_007`, and the profile's WhatsApp messages fail until a number is named.
        # They do not fall back to your organization's account. Call this endpoint again
        # with `phone_number_id` to name one.
        #
        # The same resolution runs behind `channels.whatsapp` on
        # `POST /v3/sender-profiles`, so connecting at create and connecting afterwards
        # fill the same fields.
        #
        # Returns **the account**, not every channel you have — adding one cannot change a
        # market or an RCS agent, and `GET /v3/channels` is the whole picture. Giving an
        # account up is not self-service: ask support, because deregistering a number
        # lands in your own Meta business.
        #
        # @overload create(phone_number_id: nil, sandbox: nil, waba_id: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param phone_number_id [String, nil] Body param: The Meta phone-number id of the number on WabaId, which assigns it t
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param waba_id [String] Body param: WhatsApp Business Account id — one of the accounts shared into your
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfWhatsappChannel]
        #
        # @see Sentdm::Models::Channels::WhatsappCreateParams
        def create(params = {})
          parsed, options = Sentdm::Channels::WhatsappCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: "v3/channels/whatsapp",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Channels::APIResponseOfWhatsappChannel,
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
