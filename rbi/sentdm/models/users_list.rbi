# typed: strong

module Sentdm
  module Models
    class UsersList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::UsersList, Sentdm::Internal::AnyHash) }

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # The users on this page.
      sig { returns(T.nilable(T::Array[Sentdm::UserResponse])) }
      attr_reader :users

      sig { params(users: T::Array[Sentdm::UserResponse::OrHash]).void }
      attr_writer :users

      # The users in the organization.
      sig do
        params(
          pagination: Sentdm::PaginationMeta::OrHash,
          users: T::Array[Sentdm::UserResponse::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination metadata for list responses
        pagination: nil,
        # The users on this page.
        users: nil
      )
      end

      sig do
        override.returns(
          {
            pagination: Sentdm::PaginationMeta,
            users: T::Array[Sentdm::UserResponse]
          }
        )
      end
      def to_hash
      end
    end
  end
end
