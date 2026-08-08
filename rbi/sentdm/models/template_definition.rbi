# typed: strong

module Sentdm
  module Models
    class TemplateDefinition < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateDefinition, Sentdm::Internal::AnyHash)
        end

      # Body section of a message template with channel-specific content
      sig { returns(Sentdm::TemplateBody) }
      attr_reader :body

      sig { params(body: Sentdm::TemplateBody::OrHash).void }
      attr_writer :body

      # Configuration for AUTHENTICATION category templates
      sig { returns(T.nilable(Sentdm::AuthenticationConfig)) }
      attr_reader :authentication_config

      sig do
        params(
          authentication_config: T.nilable(Sentdm::AuthenticationConfig::OrHash)
        ).void
      end
      attr_writer :authentication_config

      # Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      sig { returns(T.nilable(T::Array[Sentdm::TemplateButton])) }
      attr_accessor :buttons

      # The version of the template definition format
      sig { returns(T.nilable(String)) }
      attr_accessor :definition_version

      # Footer section of a message template
      sig { returns(T.nilable(Sentdm::TemplateFooter)) }
      attr_reader :footer

      sig { params(footer: T.nilable(Sentdm::TemplateFooter::OrHash)).void }
      attr_writer :footer

      # Header section of a message template
      sig { returns(T.nilable(Sentdm::TemplateHeader)) }
      attr_reader :header

      sig { params(header: T.nilable(Sentdm::TemplateHeader::OrHash)).void }
      attr_writer :header

      # Complete definition of a message template including header, body, footer, and
      # buttons
      sig do
        params(
          body: Sentdm::TemplateBody::OrHash,
          authentication_config:
            T.nilable(Sentdm::AuthenticationConfig::OrHash),
          buttons: T.nilable(T::Array[Sentdm::TemplateButton::OrHash]),
          definition_version: T.nilable(String),
          footer: T.nilable(Sentdm::TemplateFooter::OrHash),
          header: T.nilable(Sentdm::TemplateHeader::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Body section of a message template with channel-specific content
        body:,
        # Configuration for AUTHENTICATION category templates
        authentication_config: nil,
        # Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
        buttons: nil,
        # The version of the template definition format
        definition_version: nil,
        # Footer section of a message template
        footer: nil,
        # Header section of a message template
        header: nil
      )
      end

      sig do
        override.returns(
          {
            body: Sentdm::TemplateBody,
            authentication_config: T.nilable(Sentdm::AuthenticationConfig),
            buttons: T.nilable(T::Array[Sentdm::TemplateButton]),
            definition_version: T.nilable(String),
            footer: T.nilable(Sentdm::TemplateFooter),
            header: T.nilable(Sentdm::TemplateHeader)
          }
        )
      end
      def to_hash
      end
    end
  end
end
