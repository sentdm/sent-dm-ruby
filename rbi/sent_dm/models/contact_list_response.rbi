# typed: strong

module SentDm
  module Models
    class ContactListResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::Models::ContactListResponse, SentDm::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Array[SentDm::ContactListItem])) }
      attr_reader :items

      sig { params(items: T::Array[SentDm::ContactListItem::OrHash]).void }
      attr_writer :items

      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      sig { returns(T.nilable(Integer)) }
      attr_reader :page_size

      sig { params(page_size: Integer).void }
      attr_writer :page_size

      sig { returns(T.nilable(Integer)) }
      attr_reader :total_count

      sig { params(total_count: Integer).void }
      attr_writer :total_count

      sig { returns(T.nilable(Integer)) }
      attr_reader :total_pages

      sig { params(total_pages: Integer).void }
      attr_writer :total_pages

      sig do
        params(
          items: T::Array[SentDm::ContactListItem::OrHash],
          page: Integer,
          page_size: Integer,
          total_count: Integer,
          total_pages: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        items: nil,
        page: nil,
        page_size: nil,
        total_count: nil,
        total_pages: nil
      )
      end

      sig do
        override.returns(
          {
            items: T::Array[SentDm::ContactListItem],
            page: Integer,
            page_size: Integer,
            total_count: Integer,
            total_pages: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
