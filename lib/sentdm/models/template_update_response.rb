# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#update
    class TemplateUpdateResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Template response for v3 API
      #
      #   @return [Sentdm::Models::TemplateUpdateResponse::Data, nil]
      optional :data, -> { Sentdm::Models::TemplateUpdateResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::TemplateUpdateResponse::Error, nil]
      optional :error, -> { Sentdm::Models::TemplateUpdateResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::TemplateUpdateResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::TemplateUpdateResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::TemplateUpdateResponse::Data, nil] Template response for v3 API
      #
      #   @param error [Sentdm::Models::TemplateUpdateResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::TemplateUpdateResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::TemplateUpdateResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
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
        optional :channels, Sentdm::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute created_at
        #   When the template was created
        #
        #   @return [Time, nil]
        optional :created_at, Time

        # @!attribute is_published
        #   Whether the template is published and active
        #
        #   @return [Boolean, nil]
        optional :is_published, Sentdm::Internal::Type::Boolean

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
        optional :variables, Sentdm::Internal::Type::ArrayOf[String], nil?: true

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

      # @see Sentdm::Models::TemplateUpdateResponse#error
      class Error < Sentdm::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @return [String, nil]
        optional :code, String

        # @!attribute details
        #   Additional validation error details (field-level errors)
        #
        #   @return [Hash{Symbol=>Array<String>}, nil]
        optional :details, Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]], nil?: true

        # @!attribute doc_url
        #   URL to documentation about this error
        #
        #   @return [String, nil]
        optional :doc_url, String, nil?: true

        # @!attribute message
        #   Human-readable error message
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(code: nil, details: nil, doc_url: nil, message: nil)
        #   Error information
        #
        #   @param code [String] Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @param details [Hash{Symbol=>Array<String>}, nil] Additional validation error details (field-level errors)
        #
        #   @param doc_url [String, nil] URL to documentation about this error
        #
        #   @param message [String] Human-readable error message
      end

      # @see Sentdm::Models::TemplateUpdateResponse#meta
      class Meta < Sentdm::Internal::Type::BaseModel
        # @!attribute request_id
        #   Unique identifier for this request (for tracing and support)
        #
        #   @return [String, nil]
        optional :request_id, String

        # @!attribute timestamp
        #   Server timestamp when the response was generated
        #
        #   @return [Time, nil]
        optional :timestamp, Time

        # @!attribute version
        #   API version used for this request
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(request_id: nil, timestamp: nil, version: nil)
        #   Request and response metadata
        #
        #   @param request_id [String] Unique identifier for this request (for tracing and support)
        #
        #   @param timestamp [Time] Server timestamp when the response was generated
        #
        #   @param version [String] API version used for this request
      end
    end
  end
end
