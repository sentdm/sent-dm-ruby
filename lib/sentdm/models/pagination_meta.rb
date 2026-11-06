# frozen_string_literal: true

module Sentdm
  module Models
    class PaginationMeta < Sentdm::Internal::Type::BaseModel
      # @!attribute cursors
      #   @deprecated
      #
      #   Cursor-based pagination. Never populated — see Cursors.
      #
      #   @return [Sentdm::Models::PaginationCursors, nil]
      optional :cursors, -> { Sentdm::PaginationCursors }, nil?: true

      # @!attribute has_more
      #   Whether there are more pages after this one
      #
      #   @return [Boolean, nil]
      optional :has_more, Sentdm::Internal::Type::Boolean

      # @!attribute page
      #   Current page number (1-indexed)
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute page_size
      #   Number of items per page
      #
      #   @return [Integer, nil]
      optional :page_size, Integer

      # @!attribute total_count
      #   Total number of items across all pages
      #
      #   @return [Integer, nil]
      optional :total_count, Integer

      # @!attribute total_pages
      #   Total number of pages
      #
      #   @return [Integer, nil]
      optional :total_pages, Integer

      # @!method initialize(cursors: nil, has_more: nil, page: nil, page_size: nil, total_count: nil, total_pages: nil)
      #   Pagination metadata for list responses
      #
      #   @param cursors [Sentdm::Models::PaginationCursors, nil] Cursor-based pagination. Never populated — see Cursors.
      #
      #   @param has_more [Boolean] Whether there are more pages after this one
      #
      #   @param page [Integer] Current page number (1-indexed)
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param total_count [Integer] Total number of items across all pages
      #
      #   @param total_pages [Integer] Total number of pages
    end
  end
end
