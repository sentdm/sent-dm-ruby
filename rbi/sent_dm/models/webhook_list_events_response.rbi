# typed: strong

module SentDm
  module Models
    class WebhookListEventsResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SentDm::Models::WebhookListEventsResponse,
            SentDm::Internal::AnyHash
          )
        end

      # The response data (null if error)
      sig do
        returns(T.nilable(SentDm::Models::WebhookListEventsResponse::Data))
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(SentDm::Models::WebhookListEventsResponse::Data::OrHash)
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
            T.nilable(SentDm::Models::WebhookListEventsResponse::Data::OrHash),
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
            data: T.nilable(SentDm::Models::WebhookListEventsResponse::Data),
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
              SentDm::Models::WebhookListEventsResponse::Data,
              SentDm::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Array[SentDm::Models::WebhookListEventsResponse::Data::Event]
            )
          )
        end
        attr_reader :events

        sig do
          params(
            events:
              T::Array[
                SentDm::Models::WebhookListEventsResponse::Data::Event::OrHash
              ]
          ).void
        end
        attr_writer :events

        # Pagination metadata for list responses
        sig { returns(T.nilable(SentDm::PaginationMeta)) }
        attr_reader :pagination

        sig { params(pagination: SentDm::PaginationMeta::OrHash).void }
        attr_writer :pagination

        # The response data (null if error)
        sig do
          params(
            events:
              T::Array[
                SentDm::Models::WebhookListEventsResponse::Data::Event::OrHash
              ],
            pagination: SentDm::PaginationMeta::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          events: nil,
          # Pagination metadata for list responses
          pagination: nil
        )
        end

        sig do
          override.returns(
            {
              events:
                T::Array[
                  SentDm::Models::WebhookListEventsResponse::Data::Event
                ],
              pagination: SentDm::PaginationMeta
            }
          )
        end
        def to_hash
        end

        class Event < SentDm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SentDm::Models::WebhookListEventsResponse::Data::Event,
                SentDm::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          sig { returns(T.nilable(Integer)) }
          attr_reader :delivery_attempts

          sig { params(delivery_attempts: Integer).void }
          attr_writer :delivery_attempts

          sig { returns(T.nilable(String)) }
          attr_reader :delivery_status

          sig { params(delivery_status: String).void }
          attr_writer :delivery_status

          sig { returns(T.nilable(String)) }
          attr_accessor :error_message

          sig { returns(T.nilable(T.anything)) }
          attr_reader :event_data

          sig { params(event_data: T.anything).void }
          attr_writer :event_data

          sig { returns(T.nilable(String)) }
          attr_reader :event_type

          sig { params(event_type: String).void }
          attr_writer :event_type

          sig { returns(T.nilable(Integer)) }
          attr_accessor :http_status_code

          sig { returns(T.nilable(Time)) }
          attr_accessor :processing_completed_at

          sig { returns(T.nilable(Time)) }
          attr_accessor :processing_started_at

          sig { returns(T.nilable(String)) }
          attr_accessor :response_body

          sig do
            params(
              id: String,
              created_at: Time,
              delivery_attempts: Integer,
              delivery_status: String,
              error_message: T.nilable(String),
              event_data: T.anything,
              event_type: String,
              http_status_code: T.nilable(Integer),
              processing_completed_at: T.nilable(Time),
              processing_started_at: T.nilable(Time),
              response_body: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            id: nil,
            created_at: nil,
            delivery_attempts: nil,
            delivery_status: nil,
            error_message: nil,
            event_data: nil,
            event_type: nil,
            http_status_code: nil,
            processing_completed_at: nil,
            processing_started_at: nil,
            response_body: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                delivery_attempts: Integer,
                delivery_status: String,
                error_message: T.nilable(String),
                event_data: T.anything,
                event_type: String,
                http_status_code: T.nilable(Integer),
                processing_completed_at: T.nilable(Time),
                processing_started_at: T.nilable(Time),
                response_body: T.nilable(String)
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
