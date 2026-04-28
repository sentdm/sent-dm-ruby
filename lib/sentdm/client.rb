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

    # Configure webhook endpoints for real-time event delivery
    # @return [Sentdm::Resources::Webhooks]
    attr_reader :webhooks

    # Invite, update, and manage organization users and roles
    # @return [Sentdm::Resources::Users]
    attr_reader :users

    # Manage message templates with variable substitution
    # @return [Sentdm::Resources::Templates]
    attr_reader :templates

    # Manage organization profiles
    # @return [Sentdm::Resources::Profiles]
    attr_reader :profiles

    # Manage and lookup phone numbers
    # @return [Sentdm::Resources::Numbers]
    attr_reader :numbers

    # Send and track SMS and WhatsApp messages
    # @return [Sentdm::Resources::Messages]
    attr_reader :messages

    # Create, update, and manage customer contact lists
    # @return [Sentdm::Resources::Contacts]
    attr_reader :contacts

    # Retrieve account details
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
      @me = Sentdm::Resources::Me.new(client: self)
    end
  end
end
