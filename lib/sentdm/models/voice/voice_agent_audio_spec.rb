# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentAudioSpec < Sentdm::Internal::Type::BaseModel
        # @!attribute sample_rate
        #   Samples per second of the audio exchanged: 8000, 16000 or 24000. Default 16000.
        #
        #   @return [Integer, nil]
        optional :sample_rate, Integer, nil?: true

        # @!method initialize(sample_rate: nil)
        #   @param sample_rate [Integer, nil] Samples per second of the audio exchanged: 8000, 16000 or 24000. Default 16000.
      end
    end

    VoiceAgentAudioSpec = Voice::VoiceAgentAudioSpec
  end
end
