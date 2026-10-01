# typed: strong

module Sentdm
  module Models
    class CallsList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::CallsList, Sentdm::Internal::AnyHash) }

      # The calls on this page, most recent first
      sig { returns(T.nilable(T::Array[Sentdm::Call])) }
      attr_reader :calls

      sig { params(calls: T::Array[Sentdm::Call::OrHash]).void }
      attr_writer :calls

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # Paginated list of calls
      sig do
        params(
          calls: T::Array[Sentdm::Call::OrHash],
          pagination: Sentdm::PaginationMeta::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The calls on this page, most recent first
        calls: nil,
        # Pagination metadata for list responses
        pagination: nil
      )
      end

      sig do
        override.returns(
          { calls: T::Array[Sentdm::Call], pagination: Sentdm::PaginationMeta }
        )
      end
      def to_hash
      end
    end
  end
end
