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
