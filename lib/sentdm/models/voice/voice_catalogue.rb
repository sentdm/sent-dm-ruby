# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceCatalogue < Sentdm::Internal::Type::BaseModel
        # @!attribute languages
        #   BCP 47 tags accepted as speech.language.
        #
        #   @return [Array<String>, nil]
        optional :languages, Sentdm::Internal::Type::ArrayOf[String]

        # @!attribute voices
        #
        #   @return [Array<Sentdm::Models::Voice::VoiceCatalogueVoice>, nil]
        optional :voices, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::VoiceCatalogueVoice] }

        # @!method initialize(languages: nil, voices: nil)
        #   The voices and languages a text-session agent may name in its speech settings:
        #   what GET /v3/voice/voices and the admin GET /voice/voices answer, in one shape.
        #
        #   @param languages [Array<String>] BCP 47 tags accepted as speech.language.
        #
        #   @param voices [Array<Sentdm::Models::Voice::VoiceCatalogueVoice>]
      end
    end

    VoiceCatalogue = Voice::VoiceCatalogue
  end
end
