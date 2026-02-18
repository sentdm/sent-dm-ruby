# frozen_string_literal: true

module SentDm
  module Models
    class PaginationMeta < SentDm::Internal::Type::BaseModel
      # @!attribute cursors
      #   Cursor-based pagination (optional)
      #
      #   @return [SentDm::Models::PaginationMeta::Cursors, nil]
      optional :cursors, -> { SentDm::PaginationMeta::Cursors }, nil?: true

      # @!attribute has_more
      #   Whether there are more pages after this one
      #
      #   @return [Boolean, nil]
      optional :has_more, SentDm::Internal::Type::Boolean

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
      #   @param cursors [SentDm::Models::PaginationMeta::Cursors, nil] Cursor-based pagination (optional)
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

      # @see SentDm::Models::PaginationMeta#cursors
      class Cursors < SentDm::Internal::Type::BaseModel
        # @!attribute after
        #   Cursor to fetch the next page
        #
        #   @return [String, nil]
        optional :after, String, nil?: true

        # @!attribute before
        #   Cursor to fetch the previous page
        #
        #   @return [String, nil]
        optional :before, String, nil?: true

        # @!method initialize(after: nil, before: nil)
        #   Cursor-based pagination (optional)
        #
        #   @param after [String, nil] Cursor to fetch the next page
        #
        #   @param before [String, nil] Cursor to fetch the previous page
      end
    end
  end
end
