# typed: strong

module Sentdm
  module Models
    class SenderProfilesList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::SenderProfilesList, Sentdm::Internal::AnyHash)
        end

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # The sender_profiles on this page.
      sig { returns(T.nilable(T::Array[Sentdm::SenderProfile])) }
      attr_reader :sender_profiles

      sig do
        params(sender_profiles: T::Array[Sentdm::SenderProfile::OrHash]).void
      end
      attr_writer :sender_profiles

      # A paginated list of sender profiles.
      sig do
        params(
          pagination: Sentdm::PaginationMeta::OrHash,
          sender_profiles: T::Array[Sentdm::SenderProfile::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination metadata for list responses
        pagination: nil,
        # The sender_profiles on this page.
        sender_profiles: nil
      )
      end

      sig do
        override.returns(
          {
            pagination: Sentdm::PaginationMeta,
            sender_profiles: T::Array[Sentdm::SenderProfile]
          }
        )
      end
      def to_hash
      end
    end
  end
end
