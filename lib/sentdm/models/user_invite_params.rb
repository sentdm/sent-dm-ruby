# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Users#invite
    class UserInviteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

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

      # @!method initialize(email: nil, name: nil, role: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::UserInviteParams} for more details.
      #
      #   @param email [String] User email address (required)
      #
      #   @param name [String] User full name (required)
      #
      #   @param role [String] User role: admin, billing, or developer (required)
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
