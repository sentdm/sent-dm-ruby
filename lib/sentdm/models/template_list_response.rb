# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#list
    class TemplateListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Sentdm::Models::TemplateResponseV2>, nil]
      optional :items, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateResponseV2] }

      # @!attribute page
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute page_size
      #
      #   @return [Integer, nil]
      optional :page_size, Integer, api_name: :pageSize

      # @!attribute total_count
      #
      #   @return [Integer, nil]
      optional :total_count, Integer, api_name: :totalCount

      # @!attribute total_pages
      #
      #   @return [Integer, nil]
      optional :total_pages, Integer, api_name: :totalPages

      # @!method initialize(items: nil, page: nil, page_size: nil, total_count: nil, total_pages: nil)
      #   @param items [Array<Sentdm::Models::TemplateResponseV2>]
      #   @param page [Integer]
      #   @param page_size [Integer]
      #   @param total_count [Integer]
      #   @param total_pages [Integer]
    end
  end
end
