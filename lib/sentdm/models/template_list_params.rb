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
      #   Number of items per page
      #
      #   @return [Integer]
      required :page_size, Integer

      # @!attribute category
      #   Optional category filter: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @return [String, nil]
      optional :category, String, nil?: true

      # @!attribute is_welcome_playground
      #   Optional filter by welcome playground flag
      #
      #   @return [Boolean, nil]
      optional :is_welcome_playground, Sentdm::Internal::Type::Boolean, nil?: true

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

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(page:, page_size:, category: nil, is_welcome_playground: nil, search: nil, status: nil, x_profile_id: nil, request_options: {})
      #   @param page [Integer] Page number (1-indexed)
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param category [String, nil] Optional category filter: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @param is_welcome_playground [Boolean, nil] Optional filter by welcome playground flag
      #
      #   @param search [String, nil] Optional search term for filtering templates
      #
      #   @param status [String, nil] Optional status filter: APPROVED, PENDING, REJECTED
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
