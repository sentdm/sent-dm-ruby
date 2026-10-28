# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentAudio < Sentdm::Internal::Type::BaseModel
        # @!attribute sample_rate
        #
        #   @return [Integer, nil]
        optional :sample_rate, Integer

        # @!method initialize(sample_rate: nil)
        #   @param sample_rate [Integer]
      end
    end

    VoiceAgentAudio = Voice::VoiceAgentAudio
  end
end
