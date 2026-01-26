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
    attr_reader :admin_auth_scheme

    # @return [String]
    attr_reader :customer_auth_scheme

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

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      {**admin_authentication_scheme, **customer_authentication_scheme}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def admin_authentication_scheme
      {"x-api-key" => @admin_auth_scheme}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def customer_authentication_scheme
      {"x-sender-id" => @customer_auth_scheme}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param admin_auth_scheme [String, nil] Defaults to `ENV["SENT_DM_ADMIN_AUTH_SCHEME"]`
    #
    # @param customer_auth_scheme [String, nil] Defaults to `ENV["SENT_DM_CUSTOMER_AUTH_SCHEME"]`
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
      admin_auth_scheme: ENV["SENT_DM_ADMIN_AUTH_SCHEME"],
      customer_auth_scheme: ENV["SENT_DM_CUSTOMER_AUTH_SCHEME"],
      base_url: ENV["SENT_DM_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.sent.dm"

      if admin_auth_scheme.nil?
        raise ArgumentError.new("admin_auth_scheme is required, and can be set via environ: \"SENT_DM_ADMIN_AUTH_SCHEME\"")
      end
      if customer_auth_scheme.nil?
        raise ArgumentError.new("customer_auth_scheme is required, and can be set via environ: \"SENT_DM_CUSTOMER_AUTH_SCHEME\"")
      end

      @admin_auth_scheme = admin_auth_scheme.to_s
      @customer_auth_scheme = customer_auth_scheme.to_s

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
