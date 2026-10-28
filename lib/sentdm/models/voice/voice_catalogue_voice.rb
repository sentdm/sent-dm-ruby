# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceCatalogueVoice < Sentdm::Internal::Type::BaseModel
        # @!attribute default
        #   Whether this is the voice used when an agent names none.
        #
        #   @return [Boolean, nil]
        optional :default, Sentdm::Internal::Type::Boolean

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute language
        #   The language the voice speaks.
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute name
        #   The value to send as speech.voice.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(default: nil, description: nil, language: nil, name: nil)
        #   @param default [Boolean] Whether this is the voice used when an agent names none.
        #
        #   @param description [String]
        #
        #   @param language [String] The language the voice speaks.
        #
        #   @param name [String] The value to send as speech.voice.
      end
    end

    VoiceCatalogueVoice = Voice::VoiceCatalogueVoice
  end
end
