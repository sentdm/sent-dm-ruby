# frozen_string_literal: true

module SentDm
  module Models
    class Template < SentDm::Internal::Type::BaseModel
      # @!attribute id
      #   Unique template identifier
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute category
      #   Template category: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @return [String, nil]
      optional :category, String

      # @!attribute channels
      #   Supported channels: sms, whatsapp
      #
      #   @return [Array<String>, nil]
      optional :channels, SentDm::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute created_at
      #   When the template was created
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute is_published
      #   Whether the template is published and active
      #
      #   @return [Boolean, nil]
      optional :is_published, SentDm::Internal::Type::Boolean

      # @!attribute language
      #   Template language code (e.g., en_US)
      #
      #   @return [String, nil]
      optional :language, String

      # @!attribute name
      #   Template display name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute status
      #   Template status: APPROVED, PENDING, REJECTED
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute updated_at
      #   When the template was last updated
      #
      #   @return [Time, nil]
      optional :updated_at, Time, nil?: true

      # @!attribute variables
      #   Template variables for personalization
      #
      #   @return [Array<String>, nil]
      optional :variables, SentDm::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(id: nil, category: nil, channels: nil, created_at: nil, is_published: nil, language: nil, name: nil, status: nil, updated_at: nil, variables: nil)
      #   Template response for v3 API
      #
      #   @param id [String] Unique template identifier
      #
      #   @param category [String] Template category: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @param channels [Array<String>, nil] Supported channels: sms, whatsapp
      #
      #   @param created_at [Time] When the template was created
      #
      #   @param is_published [Boolean] Whether the template is published and active
      #
      #   @param language [String] Template language code (e.g., en_US)
      #
      #   @param name [String] Template display name
      #
      #   @param status [String] Template status: APPROVED, PENDING, REJECTED
      #
      #   @param updated_at [Time, nil] When the template was last updated
      #
      #   @param variables [Array<String>, nil] Template variables for personalization
    end
  end
end
