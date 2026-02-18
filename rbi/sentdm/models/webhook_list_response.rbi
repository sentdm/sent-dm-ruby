# typed: strong

module Sentdm
  module Models
    class WebhookListResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::WebhookListResponse, Sentdm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(Sentdm::Models::WebhookListResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::WebhookListResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error details (null if successful)
      sig { returns(T.nilable(Sentdm::APIError)) }
      attr_reader :error

      sig { params(error: T.nilable(Sentdm::APIError::OrHash)).void }
      attr_writer :error

      # Metadata about the request and response
      sig { returns(T.nilable(Sentdm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: Sentdm::APIMeta::OrHash).void }
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(Sentdm::Models::WebhookListResponse::Data::OrHash),
          error: T.nilable(Sentdm::APIError::OrHash),
          meta: Sentdm::APIMeta::OrHash,
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
            data: T.nilable(Sentdm::Models::WebhookListResponse::Data),
            error: T.nilable(Sentdm::APIError),
            meta: Sentdm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::WebhookListResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # Pagination metadata for list responses
        sig { returns(T.nilable(Sentdm::PaginationMeta)) }
        attr_reader :pagination

        sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
        attr_writer :pagination

        sig { returns(T.nilable(T::Array[Sentdm::WebhookResponse])) }
        attr_reader :webhooks

        sig { params(webhooks: T::Array[Sentdm::WebhookResponse::OrHash]).void }
        attr_writer :webhooks

        # The response data (null if error)
        sig do
          params(
            pagination: Sentdm::PaginationMeta::OrHash,
            webhooks: T::Array[Sentdm::WebhookResponse::OrHash]
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
end
