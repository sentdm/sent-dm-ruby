# frozen_string_literal: true

module SentDm
  class Client < SentDm::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [String]
    attr_reader :api_key

    # @return [String]
    attr_reader :sender_id

    # @return [SentDm::Resources::Templates]
    attr_reader :templates

    # @return [SentDm::Resources::Contacts]
    attr_reader :contacts

    # @return [SentDm::Resources::Messages]
    attr_reader :messages

    # @return [SentDm::Resources::NumberLookup]
    attr_reader :number_lookup

    # @return [SentDm::Resources::Organizations]
    attr_reader :organizations

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["SENT_DM_API_KEY"]`
    #
    # @param sender_id [String, nil] Defaults to `ENV["SENT_DM_SENDER_ID"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["SENT_DM_BASE_URL"]`
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
      sender_id: ENV["SENT_DM_SENDER_ID"],
      base_url: ENV["SENT_DM_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.sent.dm"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"SENT_DM_API_KEY\"")
      end
      if sender_id.nil?
        raise ArgumentError.new("sender_id is required, and can be set via environ: \"SENT_DM_SENDER_ID\"")
      end

      @api_key = api_key.to_s
      @sender_id = sender_id.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @templates = SentDm::Resources::Templates.new(client: self)
      @contacts = SentDm::Resources::Contacts.new(client: self)
      @messages = SentDm::Resources::Messages.new(client: self)
      @number_lookup = SentDm::Resources::NumberLookup.new(client: self)
      @organizations = SentDm::Resources::Organizations.new(client: self)
    end
  end
end
