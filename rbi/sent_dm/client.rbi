# typed: strong

module SentDm
  class Client < SentDm::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(String) }
    attr_reader :api_key

    sig { returns(String) }
    attr_reader :sender_id

    sig { returns(SentDm::Resources::Templates) }
    attr_reader :templates

    sig { returns(SentDm::Resources::Contacts) }
    attr_reader :contacts

    sig { returns(SentDm::Resources::Messages) }
    attr_reader :messages

    sig { returns(SentDm::Resources::NumberLookup) }
    attr_reader :number_lookup

    sig { returns(SentDm::Resources::Organizations) }
    attr_reader :organizations

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
      # Defaults to `ENV["SENT_DM_API_KEY"]`
      api_key: ENV["SENT_DM_API_KEY"],
      # Defaults to `ENV["SENT_DM_SENDER_ID"]`
      sender_id: ENV["SENT_DM_SENDER_ID"],
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
