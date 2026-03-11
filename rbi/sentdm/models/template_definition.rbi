# typed: strong

module Sentdm
  module Models
    class TemplateDefinition < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateDefinition, Sentdm::Internal::AnyHash)
        end

      # Required template body with content for different channels (multi-channel,
      # SMS-specific, or WhatsApp-specific)
      sig { returns(Sentdm::SentDmServicesCommonContractsPocOsTemplateBody) }
      attr_reader :body

      sig do
        params(
          body: Sentdm::SentDmServicesCommonContractsPocOsTemplateBody::OrHash
        ).void
      end
      attr_writer :body

      # Configuration specific to AUTHENTICATION category templates (optional)
      sig do
        returns(
          T.nilable(
            Sentdm::SentDmServicesCommonContractsPocOsAuthenticationConfig
          )
        )
      end
      attr_reader :authentication_config

      sig do
        params(
          authentication_config:
            T.nilable(
              Sentdm::SentDmServicesCommonContractsPocOsAuthenticationConfig::OrHash
            )
        ).void
      end
      attr_writer :authentication_config

      # Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      sig do
        returns(
          T.nilable(
            T::Array[Sentdm::SentDmServicesCommonContractsPocOsTemplateButton]
          )
        )
      end
      attr_accessor :buttons

      # The version of the template definition format
      sig { returns(T.nilable(String)) }
      attr_accessor :definition_version

      # Optional template footer with optional variables
      sig do
        returns(
          T.nilable(Sentdm::SentDmServicesCommonContractsPocOsTemplateFooter)
        )
      end
      attr_reader :footer

      sig do
        params(
          footer:
            T.nilable(
              Sentdm::SentDmServicesCommonContractsPocOsTemplateFooter::OrHash
            )
        ).void
      end
      attr_writer :footer

      # Optional template header with optional variables
      sig do
        returns(
          T.nilable(Sentdm::SentDmServicesCommonContractsPocOsTemplateHeader)
        )
      end
      attr_reader :header

      sig do
        params(
          header:
            T.nilable(
              Sentdm::SentDmServicesCommonContractsPocOsTemplateHeader::OrHash
            )
        ).void
      end
      attr_writer :header

      # Complete definition of a message template including header, body, footer, and
      # buttons
      sig do
        params(
          body: Sentdm::SentDmServicesCommonContractsPocOsTemplateBody::OrHash,
          authentication_config:
            T.nilable(
              Sentdm::SentDmServicesCommonContractsPocOsAuthenticationConfig::OrHash
            ),
          buttons:
            T.nilable(
              T::Array[
                Sentdm::SentDmServicesCommonContractsPocOsTemplateButton::OrHash
              ]
            ),
          definition_version: T.nilable(String),
          footer:
            T.nilable(
              Sentdm::SentDmServicesCommonContractsPocOsTemplateFooter::OrHash
            ),
          header:
            T.nilable(
              Sentdm::SentDmServicesCommonContractsPocOsTemplateHeader::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # Required template body with content for different channels (multi-channel,
        # SMS-specific, or WhatsApp-specific)
        body:,
        # Configuration specific to AUTHENTICATION category templates (optional)
        authentication_config: nil,
        # Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
        buttons: nil,
        # The version of the template definition format
        definition_version: nil,
        # Optional template footer with optional variables
        footer: nil,
        # Optional template header with optional variables
        header: nil
      )
      end

      sig do
        override.returns(
          {
            body: Sentdm::SentDmServicesCommonContractsPocOsTemplateBody,
            authentication_config:
              T.nilable(
                Sentdm::SentDmServicesCommonContractsPocOsAuthenticationConfig
              ),
            buttons:
              T.nilable(
                T::Array[
                  Sentdm::SentDmServicesCommonContractsPocOsTemplateButton
                ]
              ),
            definition_version: T.nilable(String),
            footer:
              T.nilable(
                Sentdm::SentDmServicesCommonContractsPocOsTemplateFooter
              ),
            header:
              T.nilable(
                Sentdm::SentDmServicesCommonContractsPocOsTemplateHeader
              )
          }
        )
      end
      def to_hash
      end
    end
  end
end
