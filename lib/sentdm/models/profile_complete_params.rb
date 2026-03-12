# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#complete
    class ProfileCompleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute profile_id
      #
      #   @return [String]
      required :profile_id, String

      # @!attribute web_hook_url
      #   Webhook URL to call when profile completion finishes (success or failure)
      #
      #   @return [String]
      required :web_hook_url, String, api_name: :webHookUrl

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(profile_id:, web_hook_url:, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileCompleteParams} for more details.
      #
      #   @param profile_id [String]
      #
      #   @param web_hook_url [String] Webhook URL to call when profile completion finishes (success or failure)
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param idempotency_key [String]
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
