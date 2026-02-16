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

    # Customer sender ID (UUID) identifying the customer account. Obtain this from
    # your account settings. Pass via the `x-sender-id` header.
    sig { returns(String) }
    attr_reader :sender_id

    sig { returns(Sentdm::Resources::Contacts) }
    attr_reader :contacts

    sig { returns(Sentdm::Resources::Messages) }
    attr_reader :messages

    sig { returns(Sentdm::Resources::Templates) }
    attr_reader :templates

    sig { returns(Sentdm::Resources::NumberLookup) }
    attr_reader :number_lookup

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def customer_api_key
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def customer_sender_id
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        sender_id: T.nilable(String),
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
      # Customer sender ID (UUID) identifying the customer account. Obtain this from
      # your account settings. Pass via the `x-sender-id` header. Defaults to
      # `ENV["SENT_DM_SENDER_ID"]`
      sender_id: ENV["SENT_DM_SENDER_ID"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["SENT_DM_BASE_URL"]`
      base_url: ENV["SENT_DM_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Sentdm::Client::DEFAULT_MAX_RETRIES,
      timeout: Sentdm::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Sentdm::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Sentdm::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
