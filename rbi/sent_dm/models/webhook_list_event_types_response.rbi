# typed: strong

module SentDm
  module Models
    class WebhookListEventTypesResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SentDm::Models::WebhookListEventTypesResponse,
            SentDm::Internal::AnyHash
          )
        end

      # The response data (null if error)
      sig do
        returns(T.nilable(SentDm::Models::WebhookListEventTypesResponse::Data))
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(
              SentDm::Models::WebhookListEventTypesResponse::Data::OrHash
            )
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
          data:
            T.nilable(
              SentDm::Models::WebhookListEventTypesResponse::Data::OrHash
            ),
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
            data:
              T.nilable(SentDm::Models::WebhookListEventTypesResponse::Data),
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
              SentDm::Models::WebhookListEventTypesResponse::Data,
              SentDm::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Array[
                SentDm::Models::WebhookListEventTypesResponse::Data::EventType
              ]
            )
          )
        end
        attr_reader :event_types

        sig do
          params(
            event_types:
              T::Array[
                SentDm::Models::WebhookListEventTypesResponse::Data::EventType::OrHash
              ]
          ).void
        end
        attr_writer :event_types

        # The response data (null if error)
        sig do
          params(
            event_types:
              T::Array[
                SentDm::Models::WebhookListEventTypesResponse::Data::EventType::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(event_types: nil)
        end

        sig do
          override.returns(
            {
              event_types:
                T::Array[
                  SentDm::Models::WebhookListEventTypesResponse::Data::EventType
                ]
            }
          )
        end
        def to_hash
        end

        class EventType < SentDm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SentDm::Models::WebhookListEventTypesResponse::Data::EventType,
                SentDm::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig { returns(T.nilable(String)) }
          attr_reader :display_name

          sig { params(display_name: String).void }
          attr_writer :display_name

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :is_active

          sig { params(is_active: T::Boolean).void }
          attr_writer :is_active

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig do
            params(
              description: T.nilable(String),
              display_name: String,
              is_active: T::Boolean,
              name: String
            ).returns(T.attached_class)
          end
          def self.new(
            description: nil,
            display_name: nil,
            is_active: nil,
            name: nil
          )
          end

          sig do
            override.returns(
              {
                description: T.nilable(String),
                display_name: String,
                is_active: T::Boolean,
                name: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
