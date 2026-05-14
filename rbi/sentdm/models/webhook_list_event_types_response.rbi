# typed: strong

module Sentdm
  module Models
    class WebhookListEventTypesResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::WebhookListEventTypesResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # The response data (null if error)
      sig do
        returns(T.nilable(Sentdm::Models::WebhookListEventTypesResponse::Data))
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(
              Sentdm::Models::WebhookListEventTypesResponse::Data::OrHash
            )
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::ErrorDetail)) }
      attr_reader :error

      sig { params(error: T.nilable(Sentdm::ErrorDetail::OrHash)).void }
      attr_writer :error

      # Request and response metadata
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
          data:
            T.nilable(
              Sentdm::Models::WebhookListEventTypesResponse::Data::OrHash
            ),
          error: T.nilable(Sentdm::ErrorDetail::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The response data (null if error)
        data: nil,
        # Error information
        error: nil,
        # Request and response metadata
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data:
              T.nilable(Sentdm::Models::WebhookListEventTypesResponse::Data),
            error: T.nilable(Sentdm::ErrorDetail),
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
              Sentdm::Models::WebhookListEventTypesResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[Sentdm::WebhookEventType])) }
        attr_reader :event_types

        sig do
          params(event_types: T::Array[Sentdm::WebhookEventType::OrHash]).void
        end
        attr_writer :event_types

        # The response data (null if error)
        sig do
          params(
            event_types: T::Array[Sentdm::WebhookEventType::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(event_types: nil)
        end

        sig do
          override.returns({ event_types: T::Array[Sentdm::WebhookEventType] })
        end
        def to_hash
        end
      end
    end
  end
end
