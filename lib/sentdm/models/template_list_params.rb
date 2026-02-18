# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#list
    class TemplateListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute page
      #   Page number (1-indexed)
      #
      #   @return [Integer]
      required :page, Integer

      # @!attribute page_size
      #
      #   @return [Integer]
      required :page_size, Integer

      # @!attribute category
      #   Optional category filter: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @return [String, nil]
      optional :category, String, nil?: true

      # @!attribute search
      #   Optional search term for filtering templates
      #
      #   @return [String, nil]
      optional :search, String, nil?: true

      # @!attribute status
      #   Optional status filter: APPROVED, PENDING, REJECTED
      #
      #   @return [String, nil]
      optional :status, String, nil?: true

      # @!method initialize(page:, page_size:, category: nil, search: nil, status: nil, request_options: {})
      #   @param page [Integer] Page number (1-indexed)
      #
      #   @param page_size [Integer]
      #
      #   @param category [String, nil] Optional category filter: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @param search [String, nil] Optional search term for filtering templates
      #
      #   @param status [String, nil] Optional status filter: APPROVED, PENDING, REJECTED
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
