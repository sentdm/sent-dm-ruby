# typed: strong

module SentDm
  module Models
    class MessageRetrieveActivitiesResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SentDm::Models::MessageRetrieveActivitiesResponse,
            SentDm::Internal::AnyHash
          )
        end

      # The response data (null if error)
      sig do
        returns(
          T.nilable(SentDm::Models::MessageRetrieveActivitiesResponse::Data)
        )
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(
              SentDm::Models::MessageRetrieveActivitiesResponse::Data::OrHash
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
              SentDm::Models::MessageRetrieveActivitiesResponse::Data::OrHash
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
              T.nilable(
                SentDm::Models::MessageRetrieveActivitiesResponse::Data
              ),
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
              SentDm::Models::MessageRetrieveActivitiesResponse::Data,
              SentDm::Internal::AnyHash
            )
          end

        # List of activity events ordered by most recent first
        sig do
          returns(
            T.nilable(
              T::Array[
                SentDm::Models::MessageRetrieveActivitiesResponse::Data::Activity
              ]
            )
          )
        end
        attr_reader :activities

        sig do
          params(
            activities:
              T::Array[
                SentDm::Models::MessageRetrieveActivitiesResponse::Data::Activity::OrHash
              ]
          ).void
        end
        attr_writer :activities

        # The message ID these activities belong to
        sig { returns(T.nilable(String)) }
        attr_reader :message_id

        sig { params(message_id: String).void }
        attr_writer :message_id

        # The response data (null if error)
        sig do
          params(
            activities:
              T::Array[
                SentDm::Models::MessageRetrieveActivitiesResponse::Data::Activity::OrHash
              ],
            message_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # List of activity events ordered by most recent first
          activities: nil,
          # The message ID these activities belong to
          message_id: nil
        )
        end

        sig do
          override.returns(
            {
              activities:
                T::Array[
                  SentDm::Models::MessageRetrieveActivitiesResponse::Data::Activity
                ],
              message_id: String
            }
          )
        end
        def to_hash
        end

        class Activity < SentDm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SentDm::Models::MessageRetrieveActivitiesResponse::Data::Activity,
                SentDm::Internal::AnyHash
              )
            end

          # Additional content or payload for the activity (e.g., channel response)
          sig { returns(T.nilable(String)) }
          attr_accessor :content

          # Human-readable description of the activity
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # Activity status (e.g., ACCEPTED, PROCESSED, SENT, DELIVERED, FAILED)
          sig { returns(T.nilable(String)) }
          attr_reader :status

          sig { params(status: String).void }
          attr_writer :status

          # When this activity occurred
          sig { returns(T.nilable(Time)) }
          attr_reader :timestamp

          sig { params(timestamp: Time).void }
          attr_writer :timestamp

          # A single message activity event for v3 API
          sig do
            params(
              content: T.nilable(String),
              description: String,
              status: String,
              timestamp: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # Additional content or payload for the activity (e.g., channel response)
            content: nil,
            # Human-readable description of the activity
            description: nil,
            # Activity status (e.g., ACCEPTED, PROCESSED, SENT, DELIVERED, FAILED)
            status: nil,
            # When this activity occurred
            timestamp: nil
          )
          end

          sig do
            override.returns(
              {
                content: T.nilable(String),
                description: String,
                status: String,
                timestamp: Time
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
