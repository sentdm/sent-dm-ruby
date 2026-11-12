# typed: strong

module Sentdm
  class Client < Sentdm::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # Customer API key for authentication. Use `sk_live_*` keys for production and
    # `sk_test_*` keys for sandbox/testing. Pass via the `x-api-key` header.
    sig { returns(String) }
    attr_reader :api_key

    # Delivery reports and inbound messages, pushed to you.
    #
    # Subscribe an endpoint to the event types you care about —
    # `GET /v3/webhooks/event-types` lists them — and we POST each one as it happens,
    # retrying on failure. Polling `GET /v3/messages/{id}` works and does not scale.
    #
    # **Verify the signature.** Every delivery is signed with your endpoint's secret;
    # an unverified endpoint is one anybody can post to. `rotate-secret` replaces it,
    # `test` sends a specimen event, and `GET /v3/webhooks/{id}/events` shows what we
    # tried to deliver and what your endpoint answered — which is the first place to
    # look when something appears to be missing.
    sig { returns(Sentdm::Resources::Webhooks) }
    attr_reader :webhooks

    # The people who can sign in to your organization, and what each may do.
    #
    # Users are dashboard access and nothing else — they do not send, and removing one
    # does not affect traffic. An API key is not a user: it belongs to the
    # organization or to a sender profile, so revoking a person's access leaves your
    # integration running.
    sig { returns(Sentdm::Resources::Users) }
    attr_reader :users

    # Reusable message bodies with named variables.
    #
    # A template is substituted at send time from the values you pass, so the copy
    # lives here rather than in your application. WhatsApp templates additionally need
    # Meta's approval before they can be sent, and a template's channel status reports
    # where that stands — an approved SMS template and an unapproved WhatsApp one are
    # the same template in two states.
    sig { returns(Sentdm::Resources::Templates) }
    attr_reader :templates

    # **Deprecated — use Sender Profiles.**
    #
    # The original profile resource, kept because it has live callers. It still works,
    # and its replacement is `/v3/sender-profiles`, which takes the identity and the
    # campaign in one call instead of across three.
    #
    # New integrations should not start here.
    sig { returns(Sentdm::Resources::Profiles) }
    attr_reader :profiles

    # Your customers, each sending as itself.
    #
    # A sender profile is a tenant of yours: it has its own API key, its own balance,
    # and can have its own identity and senders — so your customers send under their
    # own brand and never see Sent. Depth is one; a profile cannot create profiles.
    #
    # **Everything is inherited unless the profile owns it.** `{ "name": "…" }` alone
    # gives you a usable profile immediately, running on your identity, your inbox and
    # your billing. Supply a capability's fields and the profile owns that one
    # instead.
    #
    # **A sender is the exception.** A brand and a campaign can be inherited; a number
    # cannot. A profile either has a sender of its own or reaches only the countries
    # Sent runs a shared route for, and the US is not one of them.
    #
    # To act for a profile on any other resource, send `x-profile-id` with your
    # organization key rather than looking for a parallel set of endpoints.
    sig { returns(Sentdm::Resources::SenderProfiles) }
    attr_reader :sender_profiles

    # What a phone number actually is, before you send to it.
    #
    # A lookup returns the number's country, line type and carrier, which is what
    # decides whether it is reachable on a channel and what it costs. Worth doing on
    # import rather than on send: a landline in a contact list is a message that can
    # never be delivered.
    sig { returns(Sentdm::Resources::Numbers) }
    attr_reader :numbers

    # Send a message and follow what happened to it.
    #
    # One endpoint sends on any channel: pass `channel: "sent"` and we pick between
    # SMS, WhatsApp and RCS per recipient using your routing rules, or name a channel
    # to pin it. A send is accepted asynchronously — `POST /v3/messages` returns an
    # id, and delivery is reported through `GET /v3/messages/{id}`, its activities, or
    # a webhook.
    #
    # **A message needs a sender.** What you can send, where, and at what cost is
    # decided by the markets under **Channels** — so a recipient in a country you hold
    # no sender for is refused here rather than queued.
    #
    # **A message can be resent on its id.** `POST /v3/messages/{id}/resend` puts a
    # finished message — typically one BLOCKED for insufficient balance — back through
    # the send pipeline. It is a new attempt, not a free retry: every policy runs
    # again, the message is billed again, and its status webhooks fire again. A
    # FILTERED message is never resendable.
    #
    # **A scheduled message can be called off.** `POST /v3/messages/{id}/cancel`
    # cancels a send you scheduled with `scheduled_at`, as long as it has not been
    # released yet. Cancelling is free, fires `message.cancelled`, and is final — a
    # cancelled message cannot be resent.
    sig { returns(Sentdm::Resources::Messages) }
    attr_reader :messages

    # The people you message, and their channel identities.
    #
    # A contact holds one identity per channel — a phone number, a WhatsApp number —
    # so routing can choose between them for the same person. Opt-out is recorded
    # against the contact and honoured on every send, whichever channel it came
    # through.
    #
    # `GET /v3/contacts/{id}/message-summary` is the per-contact view of what you have
    # sent and what happened to it.
    sig { returns(Sentdm::Resources::Contacts) }
    attr_reader :contacts

    # Inbound and outbound messages, grouped by the person they are with.
    #
    # A conversation is the thread for one contact across every channel — a reply by
    # SMS and one by WhatsApp belong to the same conversation, because they are the
    # same person talking to you.
    #
    # Read-only. Sending is **Messages**; a reply arrives here and through your
    # webhooks.
    sig { returns(Sentdm::Resources::Conversations) }
    attr_reader :conversations

    sig { returns(Sentdm::Resources::Voice) }
    attr_reader :voice

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
    sig { returns(Sentdm::Resources::Channels) }
    attr_reader :channels

    # What a market demands, before you have it.
    #
    # Requirements vary enormously and change without notice. US `TEN_DLC` registers a
    # brand and a campaign with The Campaign Registry and asks a substantial set of
    # questions; an alphanumeric sender pre-registers with documents in one country
    # and needs nothing in another.
    #
    # This is the authoritative answer for whichever market you ask about, and it is
    # generated from the same declaration that validates the calls themselves — so it
    # cannot drift from what is actually enforced. The response includes the request
    # body to send, with every key that market wants already present and blank.
    #
    # What you supplied, as opposed to what is asked of you, is reported on the market
    # under **Channels**.
    sig { returns(Sentdm::Resources::Compliance) }
    attr_reader :compliance

    # Who the current key is.
    #
    # `GET /v3/me` answers with the account the key authenticates as, which is the
    # quickest way to tell a live key from a test one, an organization key from a
    # sender profile's, and to confirm `x-profile-id` resolved to the profile you
    # meant.
    sig { returns(Sentdm::Resources::Me) }
    attr_reader :me

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Customer API key for authentication. Use `sk_live_*` keys for production and
      # `sk_test_*` keys for sandbox/testing. Pass via the `x-api-key` header. Defaults
      # to `ENV["SENT_DM_API_KEY"]`
      api_key: ENV["SENT_DM_API_KEY"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["SENT_BASE_URL"]`
      base_url: ENV["SENT_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Sentdm::Client::DEFAULT_MAX_RETRIES,
      timeout: Sentdm::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Sentdm::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Sentdm::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
