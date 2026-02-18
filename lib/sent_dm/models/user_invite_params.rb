# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Users#invite
    class UserInviteParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute email
      #   User email address (required)
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute name
      #   User full name (required)
      #
      #   @return [String, nil]
      optional :name, String

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
      optional :test_mode, SentDm::Internal::Type::Boolean

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(email: nil, name: nil, role: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::UserInviteParams} for more details.
      #
      #   @param email [String] User email address (required)
      #
      #   @param name [String] User full name (required)
      #
      #   @param role [String] User role: admin, billing, or developer (required)
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
