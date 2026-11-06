# typed: strong

module Sentdm
  module Models
    class ContactsList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::ContactsList, Sentdm::Internal::AnyHash) }

      # The contacts on this page.
      sig { returns(T.nilable(T::Array[Sentdm::ContactResponse])) }
      attr_reader :contacts

      sig { params(contacts: T::Array[Sentdm::ContactResponse::OrHash]).void }
      attr_writer :contacts

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # A paginated list of contacts.
      sig do
        params(
          contacts: T::Array[Sentdm::ContactResponse::OrHash],
          pagination: Sentdm::PaginationMeta::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The contacts on this page.
        contacts: nil,
        # Pagination metadata for list responses
        pagination: nil
      )
      end

      sig do
        override.returns(
          {
            contacts: T::Array[Sentdm::ContactResponse],
            pagination: Sentdm::PaginationMeta
          }
        )
      end
      def to_hash
      end
    end
  end
end
