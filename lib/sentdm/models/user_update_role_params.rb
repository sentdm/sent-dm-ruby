# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Users#update_role
    class UserUpdateRoleParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute role
      #   User role: admin, billing, or developer (required)
      #
      #   @return [String, nil]
      optional :role, String

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, Sentdm::Internal::Type::Boolean

      # @!attribute body_user_id
      #   User ID from route parameter
      #
      #   @return [String, nil]
      optional :body_user_id, String, api_name: :user_id

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(role: nil, test_mode: nil, body_user_id: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::UserUpdateRoleParams} for more details.
      #
      #   @param role [String] User role: admin, billing, or developer (required)
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param body_user_id [String] User ID from route parameter
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
