# typed: strong

module SentDm
  module Models
    class PaginationMeta < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::PaginationMeta, SentDm::Internal::AnyHash)
        end

      # Cursor-based pagination (optional)
      sig { returns(T.nilable(SentDm::PaginationMeta::Cursors)) }
      attr_reader :cursors

      sig do
        params(cursors: T.nilable(SentDm::PaginationMeta::Cursors::OrHash)).void
      end
      attr_writer :cursors

      # Whether there are more pages after this one
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_more

      sig { params(has_more: T::Boolean).void }
      attr_writer :has_more

      # Current page number (1-indexed)
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Number of items per page
      sig { returns(T.nilable(Integer)) }
      attr_reader :page_size

      sig { params(page_size: Integer).void }
      attr_writer :page_size

      # Total number of items across all pages
      sig { returns(T.nilable(Integer)) }
      attr_reader :total_count

      sig { params(total_count: Integer).void }
      attr_writer :total_count

      # Total number of pages
      sig { returns(T.nilable(Integer)) }
      attr_reader :total_pages

      sig { params(total_pages: Integer).void }
      attr_writer :total_pages

      # Pagination metadata for list responses
      sig do
        params(
          cursors: T.nilable(SentDm::PaginationMeta::Cursors::OrHash),
          has_more: T::Boolean,
          page: Integer,
          page_size: Integer,
          total_count: Integer,
          total_pages: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor-based pagination (optional)
        cursors: nil,
        # Whether there are more pages after this one
        has_more: nil,
        # Current page number (1-indexed)
        page: nil,
        # Number of items per page
        page_size: nil,
        # Total number of items across all pages
        total_count: nil,
        # Total number of pages
        total_pages: nil
      )
      end

      sig do
        override.returns(
          {
            cursors: T.nilable(SentDm::PaginationMeta::Cursors),
            has_more: T::Boolean,
            page: Integer,
            page_size: Integer,
            total_count: Integer,
            total_pages: Integer
          }
        )
      end
      def to_hash
      end

      class Cursors < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SentDm::PaginationMeta::Cursors, SentDm::Internal::AnyHash)
          end

        # Cursor to fetch the next page
        sig { returns(T.nilable(String)) }
        attr_accessor :after

        # Cursor to fetch the previous page
        sig { returns(T.nilable(String)) }
        attr_accessor :before

        # Cursor-based pagination (optional)
        sig do
          params(after: T.nilable(String), before: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # Cursor to fetch the next page
          after: nil,
          # Cursor to fetch the previous page
          before: nil
        )
        end

        sig do
          override.returns(
            { after: T.nilable(String), before: T.nilable(String) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
