# typed: strong

module Sentdm
  module Models
    class WebhookListEventsResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::WebhookListEventsResponse,
            Sentdm::Internal::AnyHash
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

      # The exact event body that was delivered, or attempted, for this record. One of
      # the three webhook envelopes: a message status change, an inbound message, or a
      # template status change. Read field and event to tell which, the same way your
      # endpoint does.
      sig do
        returns(
          T.nilable(
            Sentdm::Models::WebhookListEventsResponse::EventData::Variants
          )
        )
      end
      attr_reader :event_data

      sig do
        params(
          event_data:
            T.any(
              Sentdm::MessageEvent::OrHash,
              Sentdm::InboundMessageEvent::OrHash,
              Sentdm::TemplateEvent::OrHash
            )
        ).void
      end
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
          event_data:
            T.any(
              Sentdm::MessageEvent::OrHash,
              Sentdm::InboundMessageEvent::OrHash,
              Sentdm::TemplateEvent::OrHash
            ),
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
        # The exact event body that was delivered, or attempted, for this record. One of
        # the three webhook envelopes: a message status change, an inbound message, or a
        # template status change. Read field and event to tell which, the same way your
        # endpoint does.
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
            event_data:
              Sentdm::Models::WebhookListEventsResponse::EventData::Variants,
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

      # The exact event body that was delivered, or attempted, for this record. One of
      # the three webhook envelopes: a message status change, an inbound message, or a
      # template status change. Read field and event to tell which, the same way your
      # endpoint does.
      module EventData
        extend Sentdm::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Sentdm::MessageEvent,
              Sentdm::InboundMessageEvent,
              Sentdm::TemplateEvent
            )
          end

        sig do
          override.returns(
            T::Array[
              Sentdm::Models::WebhookListEventsResponse::EventData::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
