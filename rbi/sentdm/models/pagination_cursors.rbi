# typed: strong

module Sentdm
  module Models
    class PaginationCursors < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::PaginationCursors, Sentdm::Internal::AnyHash)
        end

      # Cursor to fetch the next page.
      sig { returns(T.nilable(String)) }
      attr_accessor :after

      # Cursor to fetch the previous page.
      sig { returns(T.nilable(String)) }
      attr_accessor :before

      # Cursor-based pagination. Never populated — see Cursors.
      sig do
        params(after: T.nilable(String), before: T.nilable(String)).returns(
          T.attached_class
        )
      end
      def self.new(
        # Cursor to fetch the next page.
        after: nil,
        # Cursor to fetch the previous page.
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
