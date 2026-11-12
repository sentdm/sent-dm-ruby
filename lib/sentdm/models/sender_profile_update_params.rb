# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::SenderProfiles#update
    class SenderProfileUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute notifications
      #   Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
      #   ORGANIZATION_AND_SENDER_PROFILE. Cannot be cleared — a supplied value must be
      #   one of those.
      #
      #   @return [String, nil]
      optional :notifications, String, nil?: true

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute short_name
      #
      #   @return [String, nil]
      optional :short_name, String, nil?: true

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(id:, description: nil, name: nil, notifications: nil, sandbox: nil, short_name: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::SenderProfileUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param description [String, nil]
      #
      #   @param name [String]
      #
      #   @param notifications [String, nil] Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param short_name [String, nil]
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
