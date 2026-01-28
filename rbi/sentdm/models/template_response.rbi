# typed: strong

module Sentdm
  module Models
    class TemplateResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateResponse, Sentdm::Internal::AnyHash)
        end

      # The unique identifier of the template
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # The template category (e.g., MARKETING, UTILITY, AUTHENTICATION)
      sig { returns(T.nilable(String)) }
      attr_reader :category

      sig { params(category: String).void }
      attr_writer :category

      # The date and time when the template was created
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # The complete template definition including header, body, footer, and buttons
      sig { returns(T.nilable(Sentdm::TemplateDefinition)) }
      attr_reader :definition

      sig { params(definition: Sentdm::TemplateDefinition::OrHash).void }
      attr_writer :definition

      # The display name of the template (auto-generated if not provided)
      sig { returns(T.nilable(String)) }
      attr_reader :display_name

      sig { params(display_name: String).void }
      attr_writer :display_name

      # Indicates whether the template is published and available for use
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_published

      sig { params(is_published: T::Boolean).void }
      attr_writer :is_published

      # The template language code (e.g., en_US, es_ES)
      sig { returns(T.nilable(String)) }
      attr_reader :language

      sig { params(language: String).void }
      attr_writer :language

      # The approval status of the template (e.g., APPROVED, PENDING, REJECTED, DRAFT)
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # The date and time when the template was last updated
      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      # The WhatsApp Business API template ID from Meta
      sig { returns(T.nilable(String)) }
      attr_reader :whatsapp_template_id

      sig { params(whatsapp_template_id: String).void }
      attr_writer :whatsapp_template_id

      # The WhatsApp template name as registered with Meta
      sig { returns(T.nilable(String)) }
      attr_reader :whatsapp_template_name

      sig { params(whatsapp_template_name: String).void }
      attr_writer :whatsapp_template_name

      # Represents a message template with comprehensive metadata including definition
      # structure
      sig do
        params(
          id: String,
          category: String,
          created_at: Time,
          definition: Sentdm::TemplateDefinition::OrHash,
          display_name: String,
          is_published: T::Boolean,
          language: String,
          status: String,
          updated_at: T.nilable(Time),
          whatsapp_template_id: String,
          whatsapp_template_name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The unique identifier of the template
        id: nil,
        # The template category (e.g., MARKETING, UTILITY, AUTHENTICATION)
        category: nil,
        # The date and time when the template was created
        created_at: nil,
        # The complete template definition including header, body, footer, and buttons
        definition: nil,
        # The display name of the template (auto-generated if not provided)
        display_name: nil,
        # Indicates whether the template is published and available for use
        is_published: nil,
        # The template language code (e.g., en_US, es_ES)
        language: nil,
        # The approval status of the template (e.g., APPROVED, PENDING, REJECTED, DRAFT)
        status: nil,
        # The date and time when the template was last updated
        updated_at: nil,
        # The WhatsApp Business API template ID from Meta
        whatsapp_template_id: nil,
        # The WhatsApp template name as registered with Meta
        whatsapp_template_name: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            category: String,
            created_at: Time,
            definition: Sentdm::TemplateDefinition,
            display_name: String,
            is_published: T::Boolean,
            language: String,
            status: String,
            updated_at: T.nilable(Time),
            whatsapp_template_id: String,
            whatsapp_template_name: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
