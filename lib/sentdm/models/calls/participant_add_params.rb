# frozen_string_literal: true

module Sentdm
  module Models
    module Calls
      # @see Sentdm::Resources::Calls::Participants#add
      class ParticipantAddParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute api_key
        #   API key from the x-api-key header, or empty when the caller sent it as
        #   Authorization: Bearer instead.
        #
        #   Optional on purpose. CustomerV3AuthenticationHandler accepts the key in either
        #   header, and [FromHeader] is required by default, so a Bearer-only request would
        #   authenticate and then be refused with a 400 for a header it never needed.
        #   Endpoints read the customer from the CustomerId claim, not from this value.
        #
        #   @return [String, nil]
        optional :api_key, String, api_name: :apiKey

        # @!attribute caller_id
        #   The number shown to a phone participant as the caller, in E.164 format. Must be
        #   one of your numbers. The call's owning number when omitted
        #
        #   @return [String, nil]
        optional :caller_id, String, nil?: true

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute to
        #   A participant to add to a call
        #
        #   @return [Sentdm::Models::Calls::CallParticipantTarget, nil]
        optional :to, -> { Sentdm::Calls::CallParticipantTarget }

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(id:, api_key: nil, caller_id: nil, sandbox: nil, to: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Calls::ParticipantAddParams} for more details.
        #
        #   @param id [String]
        #
        #   @param api_key [String] API key from the x-api-key header, or empty when the caller sent it as
        #
        #   @param caller_id [String, nil] The number shown to a phone participant as the caller, in E.164 format. Must be
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
        #
        #   @param to [Sentdm::Models::Calls::CallParticipantTarget] A participant to add to a call
        #
        #   @param idempotency_key [String]
        #
        #   @param x_profile_id [String]
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
