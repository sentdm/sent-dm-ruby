# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Profiles#complete
    class ProfileCompleteParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute web_hook_url
      #   Webhook URL to call when profile completion finishes (success or failure)
      #
      #   @return [String]
      required :web_hook_url, String, api_name: :webHookUrl

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, SentDm::Internal::Type::Boolean

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(web_hook_url:, test_mode: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::ProfileCompleteParams} for more details.
      #
      #   @param web_hook_url [String] Webhook URL to call when profile completion finishes (success or failure)
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
