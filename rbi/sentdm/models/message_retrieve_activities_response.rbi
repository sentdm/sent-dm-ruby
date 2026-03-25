# typed: strong

module Sentdm
  module Models
    class MessageRetrieveActivitiesResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::MessageRetrieveActivitiesResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # Response for GET /messages/{id}/activities
      sig do
        returns(
          T.nilable(Sentdm::Models::MessageRetrieveActivitiesResponse::Data)
        )
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(
              Sentdm::Models::MessageRetrieveActivitiesResponse::Data::OrHash
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
              Sentdm::Models::MessageRetrieveActivitiesResponse::Data::OrHash
            ),
          error: T.nilable(Sentdm::ErrorDetail::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Response for GET /messages/{id}/activities
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
              T.nilable(
                Sentdm::Models::MessageRetrieveActivitiesResponse::Data
              ),
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
              Sentdm::Models::MessageRetrieveActivitiesResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # List of activity events ordered by most recent first
        sig do
          returns(
            T.nilable(
              T::Array[
                Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity
              ]
            )
          )
        end
        attr_reader :activities

        sig do
          params(
            activities:
              T::Array[
                Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity::OrHash
              ]
          ).void
        end
        attr_writer :activities

        # The message ID these activities belong to
        sig { returns(T.nilable(String)) }
        attr_reader :message_id

        sig { params(message_id: String).void }
        attr_writer :message_id

        # Response for GET /messages/{id}/activities
        sig do
          params(
            activities:
              T::Array[
                Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity::OrHash
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
                  Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity
                ],
              message_id: String
            }
          )
        end
        def to_hash
        end

        class Activity < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity,
                Sentdm::Internal::AnyHash
              )
            end

          # Active contact markup applied on top of the channel cost, formatted to 4 decimal
          # places.
          sig { returns(T.nilable(String)) }
          attr_accessor :active_contact_price

          # Human-readable description of the activity
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # Channel cost for this activity (e.g., SMS/WhatsApp provider cost), formatted to
          # 4 decimal places.
          sig { returns(T.nilable(String)) }
          attr_accessor :price

          # Activity status (e.g., QUEUED, PROCESSED, ROUTED, SENT, DELIVERED, FAILED)
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
              active_contact_price: T.nilable(String),
              description: String,
              price: T.nilable(String),
              status: String,
              timestamp: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # Active contact markup applied on top of the channel cost, formatted to 4 decimal
            # places.
            active_contact_price: nil,
            # Human-readable description of the activity
            description: nil,
            # Channel cost for this activity (e.g., SMS/WhatsApp provider cost), formatted to
            # 4 decimal places.
            price: nil,
            # Activity status (e.g., QUEUED, PROCESSED, ROUTED, SENT, DELIVERED, FAILED)
            status: nil,
            # When this activity occurred
            timestamp: nil
          )
          end

          sig do
            override.returns(
              {
                active_contact_price: T.nilable(String),
                description: String,
                price: T.nilable(String),
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
