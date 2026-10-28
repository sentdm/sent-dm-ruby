# typed: strong

module Sentdm
  module Models
    class WebhookResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookResponse, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Failed attempts since the last success. Version 1 only: always 0 on a version 2
      # webhook, whose deliveries are in its events (GET /v3/webhooks/{id}/events).
      sig { returns(T.nilable(Integer)) }
      attr_reader :consecutive_failures

      sig { params(consecutive_failures: Integer).void }
      attr_writer :consecutive_failures

      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Which customer owns this — the key's own, or the profile named in x-profile-id.
      # Says whose resource this is, which the resource's own id does not.
      sig { returns(T.nilable(String)) }
      attr_reader :customer_id

      sig { params(customer_id: String).void }
      attr_writer :customer_id

      sig { returns(T.nilable(String)) }
      attr_reader :display_name

      sig { params(display_name: String).void }
      attr_writer :display_name

      sig { returns(T.nilable(String)) }
      attr_reader :endpoint_url

      sig { params(endpoint_url: String).void }
      attr_writer :endpoint_url

      sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
      attr_accessor :event_filters

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :event_types

      sig { params(event_types: T::Array[String]).void }
      attr_writer :event_types

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_active

      sig { params(is_active: T::Boolean).void }
      attr_writer :is_active

      # Whether the webhook also receives its organization's sender profiles' events,
      # and each profile sees it and reads the events about itself. Always false on a
      # version 1 webhook.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_inheritable

      sig { params(is_inheritable: T::Boolean).void }
      attr_writer :is_inheritable

      # When the webhook was last attempted. Version 1 only: always null on a version 2
      # webhook.
      sig { returns(T.nilable(Time)) }
      attr_accessor :last_delivery_attempt_at

      # When the webhook last received an event. Version 1 only: always null on a
      # version 2 webhook.
      sig { returns(T.nilable(Time)) }
      attr_accessor :last_successful_delivery_at

      sig { returns(T.nilable(Integer)) }
      attr_reader :retry_count

      sig { params(retry_count: Integer).void }
      attr_writer :retry_count

      # The events a version 1 webhook's sender profile clones receive, as a response
      # reports them.
      #
      # Its own type, field for field the same as the request's sender_profile. A
      # response is not a request, whatever it carries.
      sig { returns(T.nilable(Sentdm::WebhookResponse::SenderProfile)) }
      attr_reader :sender_profile

      sig do
        params(
          sender_profile:
            T.nilable(Sentdm::WebhookResponse::SenderProfile::OrHash)
        ).void
      end
      attr_writer :sender_profile

      sig { returns(T.nilable(String)) }
      attr_accessor :signing_secret

      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_seconds

      sig { params(timeout_seconds: Integer).void }
      attr_writer :timeout_seconds

      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      # Who delivers the webhook: 1 the older delivery, which will be retired, or 2
      # Svix. A webhook is created as version 2 unless the request asks for 1.
      sig { returns(T.nilable(Integer)) }
      attr_reader :webhook_version

      sig { params(webhook_version: Integer).void }
      attr_writer :webhook_version

      sig do
        params(
          id: String,
          consecutive_failures: Integer,
          created_at: Time,
          customer_id: String,
          display_name: String,
          endpoint_url: String,
          event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
          event_types: T::Array[String],
          is_active: T::Boolean,
          is_inheritable: T::Boolean,
          last_delivery_attempt_at: T.nilable(Time),
          last_successful_delivery_at: T.nilable(Time),
          retry_count: Integer,
          sender_profile:
            T.nilable(Sentdm::WebhookResponse::SenderProfile::OrHash),
          signing_secret: T.nilable(String),
          timeout_seconds: Integer,
          updated_at: T.nilable(Time),
          webhook_version: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        id: nil,
        # Failed attempts since the last success. Version 1 only: always 0 on a version 2
        # webhook, whose deliveries are in its events (GET /v3/webhooks/{id}/events).
        consecutive_failures: nil,
        created_at: nil,
        # Which customer owns this — the key's own, or the profile named in x-profile-id.
        # Says whose resource this is, which the resource's own id does not.
        customer_id: nil,
        display_name: nil,
        endpoint_url: nil,
        event_filters: nil,
        event_types: nil,
        is_active: nil,
        # Whether the webhook also receives its organization's sender profiles' events,
        # and each profile sees it and reads the events about itself. Always false on a
        # version 1 webhook.
        is_inheritable: nil,
        # When the webhook was last attempted. Version 1 only: always null on a version 2
        # webhook.
        last_delivery_attempt_at: nil,
        # When the webhook last received an event. Version 1 only: always null on a
        # version 2 webhook.
        last_successful_delivery_at: nil,
        retry_count: nil,
        # The events a version 1 webhook's sender profile clones receive, as a response
        # reports them.
        #
        # Its own type, field for field the same as the request's sender_profile. A
        # response is not a request, whatever it carries.
        sender_profile: nil,
        signing_secret: nil,
        timeout_seconds: nil,
        updated_at: nil,
        # Who delivers the webhook: 1 the older delivery, which will be retired, or 2
        # Svix. A webhook is created as version 2 unless the request asks for 1.
        webhook_version: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            consecutive_failures: Integer,
            created_at: Time,
            customer_id: String,
            display_name: String,
            endpoint_url: String,
            event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
            event_types: T::Array[String],
            is_active: T::Boolean,
            is_inheritable: T::Boolean,
            last_delivery_attempt_at: T.nilable(Time),
            last_successful_delivery_at: T.nilable(Time),
            retry_count: Integer,
            sender_profile: T.nilable(Sentdm::WebhookResponse::SenderProfile),
            signing_secret: T.nilable(String),
            timeout_seconds: Integer,
            updated_at: T.nilable(Time),
            webhook_version: Integer
          }
        )
      end
      def to_hash
      end

      class SenderProfile < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::WebhookResponse::SenderProfile,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
        attr_accessor :event_filters

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :event_types

        sig { params(event_types: T::Array[String]).void }
        attr_writer :event_types

        # The events a version 1 webhook's sender profile clones receive, as a response
        # reports them.
        #
        # Its own type, field for field the same as the request's sender_profile. A
        # response is not a request, whatever it carries.
        sig do
          params(
            event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
            event_types: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(event_filters: nil, event_types: nil)
        end

        sig do
          override.returns(
            {
              event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
              event_types: T::Array[String]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
