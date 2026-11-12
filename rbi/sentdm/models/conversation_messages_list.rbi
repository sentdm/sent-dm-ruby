# typed: strong

module Sentdm
  module Models
    class ConversationMessagesList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ConversationMessagesList, Sentdm::Internal::AnyHash)
        end

      # The messages on this page.
      sig { returns(T.nilable(T::Array[Sentdm::Message])) }
      attr_reader :messages

      sig { params(messages: T::Array[Sentdm::Message::OrHash]).void }
      attr_writer :messages

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # A paginated list of messages — used by both conversation read endpoints.
      sig do
        params(
          messages: T::Array[Sentdm::Message::OrHash],
          pagination: Sentdm::PaginationMeta::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The messages on this page.
        messages: nil,
        # Pagination metadata for list responses
        pagination: nil
      )
      end

      sig do
        override.returns(
          {
            messages: T::Array[Sentdm::Message],
            pagination: Sentdm::PaginationMeta
          }
        )
      end
      def to_hash
      end
    end
  end
end
