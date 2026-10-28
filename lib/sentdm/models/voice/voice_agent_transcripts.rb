# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentTranscripts < Sentdm::Internal::Type::BaseModel
        # @!attribute retention_days
        #
        #   @return [Integer, nil]
        optional :retention_days, Integer

        # @!attribute store
        #
        #   @return [Boolean, nil]
        optional :store, Sentdm::Internal::Type::Boolean

        # @!method initialize(retention_days: nil, store: nil)
        #   @param retention_days [Integer]
        #   @param store [Boolean]
      end
    end

    VoiceAgentTranscripts = Voice::VoiceAgentTranscripts
  end
end
