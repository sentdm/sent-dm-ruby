# typed: strong

module Sentdm
  module Models
    class ProfilesList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::ProfilesList, Sentdm::Internal::AnyHash) }

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # The profiles on this page.
      sig { returns(T.nilable(T::Array[Sentdm::ProfileDetail])) }
      attr_reader :profiles

      sig { params(profiles: T::Array[Sentdm::ProfileDetail::OrHash]).void }
      attr_writer :profiles

      # The profiles in the organization.
      sig do
        params(
          pagination: Sentdm::PaginationMeta::OrHash,
          profiles: T::Array[Sentdm::ProfileDetail::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination metadata for list responses
        pagination: nil,
        # The profiles on this page.
        profiles: nil
      )
      end

      sig do
        override.returns(
          {
            pagination: Sentdm::PaginationMeta,
            profiles: T::Array[Sentdm::ProfileDetail]
          }
        )
      end
      def to_hash
      end
    end
  end
end
