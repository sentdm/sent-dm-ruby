# frozen_string_literal: true

module Sentdm
  module Models
    module Calls
      # @see Sentdm::Resources::Calls::Participants#update
      class ParticipantUpdateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute participant_id
        #
        #   @return [String]
        required :participant_id, String

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

        # @!attribute muted
        #   true to mute the participant, false to unmute them
        #
        #   @return [Boolean, nil]
        optional :muted, Sentdm::Internal::Type::Boolean

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

        # @!method initialize(id:, participant_id:, api_key: nil, muted: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Calls::ParticipantUpdateParams} for more details.
        #
        #   @param id [String]
        #
        #   @param participant_id [String]
        #
        #   @param api_key [String] API key from the x-api-key header, or empty when the caller sent it as
        #
        #   @param muted [Boolean] true to mute the participant, false to unmute them
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
end
