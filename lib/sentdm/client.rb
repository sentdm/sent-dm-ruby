# frozen_string_literal: true

module Sentdm
  class Client < Sentdm::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # Customer API key for authentication. Use `sk_live_*` keys for production and
    # `sk_test_*` keys for sandbox/testing. Pass via the `x-api-key` header.
    # @return [String]
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
    # @return [Sentdm::Resources::Webhooks]
    attr_reader :webhooks

    # The people who can sign in to your organization, and what each may do.
    #
    # Users are dashboard access and nothing else — they do not send, and removing one
    # does not affect traffic. An API key is not a user: it belongs to the
    # organization or to a sender profile, so revoking a person's access leaves your
    # integration running.
    # @return [Sentdm::Resources::Users]
    attr_reader :users

    # Reusable message bodies with named variables.
    #
    # A template is substituted at send time from the values you pass, so the copy
    # lives here rather than in your application. WhatsApp templates additionally need
    # Meta's approval before they can be sent, and a template's channel status reports
    # where that stands — an approved SMS template and an unapproved WhatsApp one are
    # the same template in two states.
    # @return [Sentdm::Resources::Templates]
    attr_reader :templates

    # **Deprecated — use Sender Profiles.**
    #
    # The original profile resource, kept because it has live callers. It still works,
    # and its replacement is `/v3/sender-profiles`, which takes the identity and the
    # campaign in one call instead of across three.
    #
    # New integrations should not start here.
    # @return [Sentdm::Resources::Profiles]
    attr_reader :profiles

    # What a phone number actually is, before you send to it.
    #
    # A lookup returns the number's country, line type and carrier, which is what
    # decides whether it is reachable on a channel and what it costs. Worth doing on
    # import rather than on send: a landline in a contact list is a message that can
    # never be delivered.
    # @return [Sentdm::Resources::Numbers]
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
    # @return [Sentdm::Resources::Messages]
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
    # @return [Sentdm::Resources::Contacts]
    attr_reader :contacts

    # Inbound and outbound messages, grouped by the person they are with.
    #
    # A conversation is the thread for one contact across every channel — a reply by
    # SMS and one by WhatsApp belong to the same conversation, because they are the
    # same person talking to you.
    #
    # Read-only. Sending is **Messages**; a reply arrives here and through your
    # webhooks.
    # @return [Sentdm::Resources::Conversations]
    attr_reader :conversations

    # Who the current key is.
    #
    # `GET /v3/me` answers with the account the key authenticates as, which is the
    # quickest way to tell a live key from a test one, an organization key from a
    # sender profile's, and to confirm `x-profile-id` resolved to the profile you
    # meant.
    # @return [Sentdm::Resources::Me]
    attr_reader :me

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      {"x-api-key" => @api_key}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Customer API key for authentication. Use `sk_live_*` keys for production and
    # `sk_test_*` keys for sandbox/testing. Pass via the `x-api-key` header. Defaults
    # to `ENV["SENT_DM_API_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["SENT_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["SENT_DM_API_KEY"],
      base_url: ENV["SENT_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.sent.dm"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"SENT_DM_API_KEY\"")
      end

      headers = {}
      custom_headers_env = ENV["SENT_CUSTOM_HEADERS"]
      unless custom_headers_env.nil?
        parsed = {}
        custom_headers_env.split("\n").each do |line|
          colon = line.index(":")
          unless colon.nil?
            parsed[line[0...colon].strip] = line[(colon + 1)..].strip
          end
        end
        headers = parsed.merge(headers)
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers
      )

      @webhooks = Sentdm::Resources::Webhooks.new(client: self)
      @users = Sentdm::Resources::Users.new(client: self)
      @templates = Sentdm::Resources::Templates.new(client: self)
      @profiles = Sentdm::Resources::Profiles.new(client: self)
      @numbers = Sentdm::Resources::Numbers.new(client: self)
      @messages = Sentdm::Resources::Messages.new(client: self)
      @contacts = Sentdm::Resources::Contacts.new(client: self)
      @conversations = Sentdm::Resources::Conversations.new(client: self)
      @me = Sentdm::Resources::Me.new(client: self)
    end
  end
end
