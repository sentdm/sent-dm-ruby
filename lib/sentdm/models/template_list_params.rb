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
      #   Accepted and ignored. It used to filter on the welcome-playground marker inside
      #   a template's LOB details; that filter is gone and nothing reads this value, so
      #   sending it neither narrows nor widens the result. Retained only so a client
      #   still passing is_welcome_playground keeps binding instead of the request shape
      #   changing under it.
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
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateListParams} for more details.
      #
      #   @param page [Integer] Page number (1-indexed)
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param category [String, nil] Optional category filter: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @param is_welcome_playground [Boolean, nil] Accepted and ignored. It used to filter on the welcome-playground marker inside
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
