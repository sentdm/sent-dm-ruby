# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Templates#list
    class TemplateListParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute page
      #   The page number (zero-indexed). Default is 0.
      #
      #   @return [Integer]
      required :page, Integer

      # @!attribute page_size
      #   The number of items per page (1-1000). Default is 100.
      #
      #   @return [Integer]
      required :page_size, Integer

      # @!attribute category
      #   Optional filter by template category (e.g., MARKETING, UTILITY, AUTHENTICATION)
      #
      #   @return [String, nil]
      optional :category, String, nil?: true

      # @!attribute search
      #   Optional search term to filter templates by name or content
      #
      #   @return [String, nil]
      optional :search, String, nil?: true

      # @!attribute status
      #   Optional filter by template status (e.g., APPROVED, PENDING, REJECTED, DRAFT)
      #
      #   @return [String, nil]
      optional :status, String, nil?: true

      # @!method initialize(page:, page_size:, category: nil, search: nil, status: nil, request_options: {})
      #   @param page [Integer] The page number (zero-indexed). Default is 0.
      #
      #   @param page_size [Integer] The number of items per page (1-1000). Default is 100.
      #
      #   @param category [String, nil] Optional filter by template category (e.g., MARKETING, UTILITY, AUTHENTICATION)
      #
      #   @param search [String, nil] Optional search term to filter templates by name or content
      #
      #   @param status [String, nil] Optional filter by template status (e.g., APPROVED, PENDING, REJECTED, DRAFT)
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
