# typed: strong

module Sentdm
  module Models
    VoiceCatalogue = Voice::VoiceCatalogue

    module Voice
      class VoiceCatalogue < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceCatalogue, Sentdm::Internal::AnyHash)
          end

        # BCP 47 tags accepted as speech.language.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :languages

        sig { params(languages: T::Array[String]).void }
        attr_writer :languages

        sig { returns(T.nilable(T::Array[Sentdm::Voice::VoiceCatalogueVoice])) }
        attr_reader :voices

        sig do
          params(
            voices: T::Array[Sentdm::Voice::VoiceCatalogueVoice::OrHash]
          ).void
        end
        attr_writer :voices

        # The voices and languages a text-session agent may name in its speech settings:
        # what GET /v3/voice/voices and the admin GET /voice/voices answer, in one shape.
        sig do
          params(
            languages: T::Array[String],
            voices: T::Array[Sentdm::Voice::VoiceCatalogueVoice::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # BCP 47 tags accepted as speech.language.
          languages: nil,
          voices: nil
        )
        end

        sig do
          override.returns(
            {
              languages: T::Array[String],
              voices: T::Array[Sentdm::Voice::VoiceCatalogueVoice]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
