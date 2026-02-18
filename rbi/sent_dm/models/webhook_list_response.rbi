# typed: strong

module SentDm
  module Models
    class WebhookListResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::Models::WebhookListResponse, SentDm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(SentDm::Models::WebhookListResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(SentDm::Models::WebhookListResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error details (null if successful)
      sig { returns(T.nilable(SentDm::APIError)) }
      attr_reader :error

      sig { params(error: T.nilable(SentDm::APIError::OrHash)).void }
      attr_writer :error

      # Metadata about the request and response
      sig { returns(T.nilable(SentDm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: SentDm::APIMeta::OrHash).void }
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(SentDm::Models::WebhookListResponse::Data::OrHash),
          error: T.nilable(SentDm::APIError::OrHash),
          meta: SentDm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The response data (null if error)
        data: nil,
        # Error details (null if successful)
        error: nil,
        # Metadata about the request and response
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(SentDm::Models::WebhookListResponse::Data),
            error: T.nilable(SentDm::APIError),
            meta: SentDm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SentDm::Models::WebhookListResponse::Data,
              SentDm::Internal::AnyHash
            )
          end

        # Pagination metadata for list responses
        sig { returns(T.nilable(SentDm::PaginationMeta)) }
        attr_reader :pagination

        sig { params(pagination: SentDm::PaginationMeta::OrHash).void }
        attr_writer :pagination

        sig { returns(T.nilable(T::Array[SentDm::WebhookResponse])) }
        attr_reader :webhooks

        sig { params(webhooks: T::Array[SentDm::WebhookResponse::OrHash]).void }
        attr_writer :webhooks

        # The response data (null if error)
        sig do
          params(
            pagination: SentDm::PaginationMeta::OrHash,
            webhooks: T::Array[SentDm::WebhookResponse::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # Pagination metadata for list responses
          pagination: nil,
          webhooks: nil
        )
        end

        sig do
          override.returns(
            {
              pagination: SentDm::PaginationMeta,
              webhooks: T::Array[SentDm::WebhookResponse]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
