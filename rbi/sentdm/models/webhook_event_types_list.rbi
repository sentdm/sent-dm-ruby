# typed: strong

module Sentdm
  module Models
    class WebhookEventTypesList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookEventTypesList, Sentdm::Internal::AnyHash)
        end

      # The event_types on this page.
      sig { returns(T.nilable(T::Array[Sentdm::WebhookEventType])) }
      attr_reader :event_types

      sig do
        params(event_types: T::Array[Sentdm::WebhookEventType::OrHash]).void
      end
      attr_writer :event_types

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # The webhook event types a customer can subscribe to.
      sig do
        params(
          event_types: T::Array[Sentdm::WebhookEventType::OrHash],
          pagination: Sentdm::PaginationMeta::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The event_types on this page.
        event_types: nil,
        # Pagination metadata for list responses
        pagination: nil
      )
      end

      sig do
        override.returns(
          {
            event_types: T::Array[Sentdm::WebhookEventType],
            pagination: Sentdm::PaginationMeta
          }
        )
      end
      def to_hash
      end
    end
  end
end
