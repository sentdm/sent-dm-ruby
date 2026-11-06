# typed: strong

module Sentdm
  module Models
    class WebhooksList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::WebhooksList, Sentdm::Internal::AnyHash) }

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # The webhooks on this page.
      sig { returns(T.nilable(T::Array[Sentdm::WebhookResponse])) }
      attr_reader :webhooks

      sig { params(webhooks: T::Array[Sentdm::WebhookResponse::OrHash]).void }
      attr_writer :webhooks

      # A paginated list of webhooks.
      sig do
        params(
          pagination: Sentdm::PaginationMeta::OrHash,
          webhooks: T::Array[Sentdm::WebhookResponse::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination metadata for list responses
        pagination: nil,
        # The webhooks on this page.
        webhooks: nil
      )
      end

      sig do
        override.returns(
          {
            pagination: Sentdm::PaginationMeta,
            webhooks: T::Array[Sentdm::WebhookResponse]
          }
        )
      end
      def to_hash
      end
    end
  end
end
