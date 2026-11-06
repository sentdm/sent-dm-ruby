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
      class Whatsapp
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
        sig do
          params(
            phone_number_id: T.nilable(String),
            sandbox: T::Boolean,
            waba_id: String,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Channels::APIResponseOfWhatsappChannel)
        end
        def create(
          # Body param: The Meta phone-number id of the number on WabaId, which assigns it
          # to this profile as the number it sends from. It is not checked against the
          # account here, so name the account's number; it is refused if another profile
          # already uses it.
          #
          # Optional: omit it to connect the account and settle the number later. Nothing
          # picks one on your behalf.
          phone_number_id: nil,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Body param: WhatsApp Business Account id — one of the accounts shared into your
          # organization. Required: the organization holds one per client, and nothing but
          # the caller says which is meant here.
          waba_id: nil,
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
