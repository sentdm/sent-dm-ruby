# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentSpeechSpec < Sentdm::Internal::Type::BaseModel
        # @!attribute language
        #   The language spoken and listened for, a BCP 47 tag from GET /v3/voice/voices.
        #   Default en-US.
        #
        #   @return [String, nil]
        optional :language, String, nil?: true

        # @!attribute setting
        #   standard, Sent's speech. Other settings are not available yet.
        #
        #   @return [String, nil]
        optional :setting, String, nil?: true

        # @!attribute voice
        #   A voice name from GET /v3/voice/voices. Default: the catalogue's default voice.
        #
        #   @return [String, nil]
        optional :voice, String, nil?: true

        # @!method initialize(language: nil, setting: nil, voice: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::VoiceAgentSpeechSpec} for more details.
        #
        #   @param language [String, nil] The language spoken and listened for, a BCP 47 tag from GET /v3/voice/voices. De
        #
        #   @param setting [String, nil] standard, Sent's speech. Other settings are not available yet.
        #
        #   @param voice [String, nil] A voice name from GET /v3/voice/voices. Default: the catalogue's default voice.
      end
    end

    VoiceAgentSpeechSpec = Voice::VoiceAgentSpeechSpec
  end
end
