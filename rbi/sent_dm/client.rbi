# typed: strong

module SentDm
  class Client < SentDm::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # Customer API key for authentication. Use `sk_live_*` keys for production and
    # `sk_test_*` keys for sandbox/testing. Pass via the `x-api-key` header.
    sig { returns(String) }
    attr_reader :api_key

    sig { returns(SentDm::Resources::Webhooks) }
    attr_reader :webhooks

    sig { returns(SentDm::Resources::Users) }
    attr_reader :users

    sig { returns(SentDm::Resources::Templates) }
    attr_reader :templates

    sig { returns(SentDm::Resources::Profiles) }
    attr_reader :profiles

    sig { returns(SentDm::Resources::Messages) }
    attr_reader :messages

    sig { returns(SentDm::Resources::Lookup) }
    attr_reader :lookup

    sig { returns(SentDm::Resources::Contacts) }
    attr_reader :contacts

    sig { returns(SentDm::Resources::Brands) }
    attr_reader :brands

    sig { returns(SentDm::Resources::Me) }
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
      # `"https://api.example.com/v2/"`. Defaults to `ENV["SENT_DM_BASE_URL"]`
      base_url: ENV["SENT_DM_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: SentDm::Client::DEFAULT_MAX_RETRIES,
      timeout: SentDm::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: SentDm::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: SentDm::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
