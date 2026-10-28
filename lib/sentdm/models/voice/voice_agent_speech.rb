# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentSpeech < Sentdm::Internal::Type::BaseModel
        # @!attribute language
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute setting
        #
        #   @return [String, nil]
        optional :setting, String

        # @!attribute voice
        #
        #   @return [String, nil]
        optional :voice, String

        # @!method initialize(language: nil, setting: nil, voice: nil)
        #   @param language [String]
        #   @param setting [String]
        #   @param voice [String]
      end
    end

    VoiceAgentSpeech = Voice::VoiceAgentSpeech
  end
end
