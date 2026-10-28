# typed: strong

module Sentdm
  module Models
    VoiceCatalogueVoice = Voice::VoiceCatalogueVoice

    module Voice
      class VoiceCatalogueVoice < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceCatalogueVoice, Sentdm::Internal::AnyHash)
          end

        # Whether this is the voice used when an agent names none.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :default

        sig { params(default: T::Boolean).void }
        attr_writer :default

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # The language the voice speaks.
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        # The value to send as speech.voice.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig do
          params(
            default: T::Boolean,
            description: String,
            language: String,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether this is the voice used when an agent names none.
          default: nil,
          description: nil,
          # The language the voice speaks.
          language: nil,
          # The value to send as speech.voice.
          name: nil
        )
        end

        sig do
          override.returns(
            {
              default: T::Boolean,
              description: String,
              language: String,
              name: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
