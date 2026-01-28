# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#create
    class TemplateResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   The unique identifier of the template
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute category
      #   The template category (e.g., MARKETING, UTILITY, AUTHENTICATION)
      #
      #   @return [String, nil]
      optional :category, String

      # @!attribute created_at
      #   The date and time when the template was created
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute definition
      #   The complete template definition including header, body, footer, and buttons
      #
      #   @return [Sentdm::Models::TemplateDefinition, nil]
      optional :definition, -> { Sentdm::TemplateDefinition }

      # @!attribute display_name
      #   The display name of the template (auto-generated if not provided)
      #
      #   @return [String, nil]
      optional :display_name, String, api_name: :displayName

      # @!attribute is_published
      #   Indicates whether the template is published and available for use
      #
      #   @return [Boolean, nil]
      optional :is_published, Sentdm::Internal::Type::Boolean, api_name: :isPublished

      # @!attribute language
      #   The template language code (e.g., en_US, es_ES)
      #
      #   @return [String, nil]
      optional :language, String

      # @!attribute status
      #   The approval status of the template (e.g., APPROVED, PENDING, REJECTED, DRAFT)
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute updated_at
      #   The date and time when the template was last updated
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt, nil?: true

      # @!attribute whatsapp_template_id
      #   The WhatsApp Business API template ID from Meta
      #
      #   @return [String, nil]
      optional :whatsapp_template_id, String, api_name: :whatsappTemplateId

      # @!attribute whatsapp_template_name
      #   The WhatsApp template name as registered with Meta
      #
      #   @return [String, nil]
      optional :whatsapp_template_name, String, api_name: :whatsappTemplateName

      # @!method initialize(id: nil, category: nil, created_at: nil, definition: nil, display_name: nil, is_published: nil, language: nil, status: nil, updated_at: nil, whatsapp_template_id: nil, whatsapp_template_name: nil)
      #   Represents a message template with comprehensive metadata including definition
      #   structure
      #
      #   @param id [String] The unique identifier of the template
      #
      #   @param category [String] The template category (e.g., MARKETING, UTILITY, AUTHENTICATION)
      #
      #   @param created_at [Time] The date and time when the template was created
      #
      #   @param definition [Sentdm::Models::TemplateDefinition] The complete template definition including header, body, footer, and buttons
      #
      #   @param display_name [String] The display name of the template (auto-generated if not provided)
      #
      #   @param is_published [Boolean] Indicates whether the template is published and available for use
      #
      #   @param language [String] The template language code (e.g., en_US, es_ES)
      #
      #   @param status [String] The approval status of the template (e.g., APPROVED, PENDING, REJECTED, DRAFT)
      #
      #   @param updated_at [Time, nil] The date and time when the template was last updated
      #
      #   @param whatsapp_template_id [String] The WhatsApp Business API template ID from Meta
      #
      #   @param whatsapp_template_name [String] The WhatsApp template name as registered with Meta
    end
  end
end
