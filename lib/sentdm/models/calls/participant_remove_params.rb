# frozen_string_literal: true

module Sentdm
  module Models
    module Calls
      # @see Sentdm::Resources::Calls::Participants#remove
      class ParticipantRemoveParams < Sentdm::Models::MutationRequest
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

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(id:, participant_id:, x_profile_id: nil, request_options: {})
        #   @param id [String]
        #   @param participant_id [String]
        #   @param x_profile_id [String]
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
