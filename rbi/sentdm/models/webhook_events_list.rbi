# typed: strong

module Sentdm
  module Models
    class WebhookEventsList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookEventsList, Sentdm::Internal::AnyHash)
        end

      # The events on this page.
      sig { returns(T.nilable(T::Array[Sentdm::WebhookDelivery])) }
      attr_reader :events

      sig { params(events: T::Array[Sentdm::WebhookDelivery::OrHash]).void }
      attr_writer :events

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # A paginated list of webhook delivery records.
      sig do
        params(
          events: T::Array[Sentdm::WebhookDelivery::OrHash],
          pagination: Sentdm::PaginationMeta::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The events on this page.
        events: nil,
        # Pagination metadata for list responses
        pagination: nil
      )
      end

      sig do
        override.returns(
          {
            events: T::Array[Sentdm::WebhookDelivery],
            pagination: Sentdm::PaginationMeta
          }
        )
      end
      def to_hash
      end
    end
  end
end
