# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentTranscriptsSpec < Sentdm::Internal::Type::BaseModel
        # @!attribute retention_days
        #   How long a stored transcript is kept, 1 to 365 days. Default 30.
        #
        #   @return [Integer, nil]
        optional :retention_days, Integer, nil?: true

        # @!attribute store
        #   Whether Sent keeps the call's transcript. Default false. Stored now, applied
        #   when transcripts land.
        #
        #   @return [Boolean, nil]
        optional :store, Sentdm::Internal::Type::Boolean, nil?: true

        # @!method initialize(retention_days: nil, store: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::VoiceAgentTranscriptsSpec} for more details.
        #
        #   @param retention_days [Integer, nil] How long a stored transcript is kept, 1 to 365 days. Default 30.
        #
        #   @param store [Boolean, nil] Whether Sent keeps the call's transcript. Default false. Stored now, applied whe
      end
    end

    VoiceAgentTranscriptsSpec = Voice::VoiceAgentTranscriptsSpec
  end
end
