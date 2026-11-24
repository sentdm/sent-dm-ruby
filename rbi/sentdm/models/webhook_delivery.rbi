# typed: strong

module Sentdm
  module Models
    class WebhookDelivery < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookDelivery, Sentdm::Internal::AnyHash)
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
      # the six webhook envelopes:
      #
      # message — an outbound message changed status. message with event:
      # message.received — someone replied to you. templates — a template was approved,
      # rejected, paused or similar. channel — one of your markets moved in provisioning
      # or compliance. contact — a consent signal: opt-in, opt-out or help. link — a
      # tracked short link was clicked or a hosted file downloaded, or one expired or
      # was revoked.
      #
      # Read field and event to tell which, the same way your endpoint does. The two
      # message envelopes are the reason that is two fields and not one: they share a
      # field and differ by event.
      #
      # Treat the list as open. It has grown twice — channel and then link — and a
      # handler that rejects an envelope it does not recognise will break on the next
      # addition rather than ignore it.
      sig { returns(T.nilable(Sentdm::WebhookDelivery::EventData::Variants)) }
      attr_reader :event_data

      sig do
        params(
          event_data:
            T.any(
              Sentdm::MessageEvent::OrHash,
              Sentdm::InboundMessageEvent::OrHash,
              Sentdm::TemplateEvent::OrHash,
              Sentdm::ChannelEvent::OrHash,
              Sentdm::ContactEvent::OrHash,
              Sentdm::LinkEvent::OrHash,
              Sentdm::CallEvent::OrHash,
              Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::OrHash
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
              Sentdm::TemplateEvent::OrHash,
              Sentdm::ChannelEvent::OrHash,
              Sentdm::ContactEvent::OrHash,
              Sentdm::LinkEvent::OrHash,
              Sentdm::CallEvent::OrHash,
              Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::OrHash
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
        # the six webhook envelopes:
        #
        # message — an outbound message changed status. message with event:
        # message.received — someone replied to you. templates — a template was approved,
        # rejected, paused or similar. channel — one of your markets moved in provisioning
        # or compliance. contact — a consent signal: opt-in, opt-out or help. link — a
        # tracked short link was clicked or a hosted file downloaded, or one expired or
        # was revoked.
        #
        # Read field and event to tell which, the same way your endpoint does. The two
        # message envelopes are the reason that is two fields and not one: they share a
        # field and differ by event.
        #
        # Treat the list as open. It has grown twice — channel and then link — and a
        # handler that rejects an envelope it does not recognise will break on the next
        # addition rather than ignore it.
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
            event_data: Sentdm::WebhookDelivery::EventData::Variants,
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
      # the six webhook envelopes:
      #
      # message — an outbound message changed status. message with event:
      # message.received — someone replied to you. templates — a template was approved,
      # rejected, paused or similar. channel — one of your markets moved in provisioning
      # or compliance. contact — a consent signal: opt-in, opt-out or help. link — a
      # tracked short link was clicked or a hosted file downloaded, or one expired or
      # was revoked.
      #
      # Read field and event to tell which, the same way your endpoint does. The two
      # message envelopes are the reason that is two fields and not one: they share a
      # field and differ by event.
      #
      # Treat the list as open. It has grown twice — channel and then link — and a
      # handler that rejects an envelope it does not recognise will break on the next
      # addition rather than ignore it.
      module EventData
        extend Sentdm::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Sentdm::MessageEvent,
              Sentdm::InboundMessageEvent,
              Sentdm::TemplateEvent,
              Sentdm::ChannelEvent,
              Sentdm::ContactEvent,
              Sentdm::LinkEvent,
              Sentdm::CallEvent,
              Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload
            )
          end

        class SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload,
                Sentdm::Internal::AnyHash
              )
            end

          # The specific event within the family, for example message.delivered,
          # message.received or contact.opt_out. Absent on events that have no subtype, so
          # treat it as optional.
          sig { returns(T.nilable(String)) }
          attr_accessor :event

          # The event family, for example message, templates or contact. Route on this
          # first, then on event for the specific change.
          sig { returns(T.nilable(String)) }
          attr_reader :field

          sig { params(field: String).void }
          attr_writer :field

          # Body of an agent.\* webhook (Sent Agents). The event is the agent service's own
          # record, forwarded without renaming: EventId is its id, so a subscriber can
          # dedupe a redelivery.
          sig do
            returns(
              T.nilable(
                Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::Payload
              )
            )
          end
          attr_reader :payload

          sig do
            params(
              payload:
                T.nilable(
                  Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::Payload::OrHash
                )
            ).void
          end
          attr_writer :payload

          # The event-specific body.
          sig { returns(T.nilable(String)) }
          attr_accessor :request_id

          # When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
          # time, not the time the underlying change happened. Use the timestamp inside the
          # payload for the latter.
          sig { returns(T.nilable(String)) }
          attr_reader :timestamp

          sig { params(timestamp: String).void }
          attr_writer :timestamp

          # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
          # this shape and varies only in Payload.
          sig do
            params(
              event: T.nilable(String),
              field: String,
              payload:
                T.nilable(
                  Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::Payload::OrHash
                ),
              request_id: T.nilable(String),
              timestamp: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The specific event within the family, for example message.delivered,
            # message.received or contact.opt_out. Absent on events that have no subtype, so
            # treat it as optional.
            event: nil,
            # The event family, for example message, templates or contact. Route on this
            # first, then on event for the specific change.
            field: nil,
            # Body of an agent.\* webhook (Sent Agents). The event is the agent service's own
            # record, forwarded without renaming: EventId is its id, so a subscriber can
            # dedupe a redelivery.
            payload: nil,
            # The event-specific body.
            request_id: nil,
            # When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
            # time, not the time the underlying change happened. Use the timestamp inside the
            # payload for the latter.
            timestamp: nil
          )
          end

          sig do
            override.returns(
              {
                event: T.nilable(String),
                field: String,
                payload:
                  T.nilable(
                    Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::Payload
                  ),
                request_id: T.nilable(String),
                timestamp: String
              }
            )
          end
          def to_hash
          end

          class Payload < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::Payload,
                  Sentdm::Internal::AnyHash
                )
              end

            # The agent service's event id. The same event is never delivered under two ids.
            sig { returns(String) }
            attr_accessor :event_id

            # When the agent service recorded it, UTC, to the millisecond.
            sig { returns(String) }
            attr_accessor :occurred_at

            # The sender profile the agent runs on.
            sig { returns(T.nilable(String)) }
            attr_reader :account_id

            sig { params(account_id: String).void }
            attr_writer :account_id

            # Who caused it: system, the agent service's customer, or an approver.
            sig { returns(T.nilable(String)) }
            attr_accessor :actor

            # The agent.
            sig { returns(T.nilable(String)) }
            attr_reader :agent_id

            sig { params(agent_id: String).void }
            attr_writer :agent_id

            # The agent's name, as it is listed. Absent for an agent services no longer holds.
            sig { returns(T.nilable(String)) }
            attr_accessor :agent_name

            # The version of the agent the event is of: the one its conversation runs, or the
            # active one for an event of the agent itself. Absent when the agent service does
            # not say it.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :agent_version

            # The contact of that conversation; absent on agent-level events.
            sig { returns(T.nilable(String)) }
            attr_accessor :contact_id

            # The contact's phone number, in E.164, so a receiver knows who the event is about
            # without asking for the contact. Read from the account's contacts as the webhook
            # is built: the agent service's own record names a contact by id only. Absent on
            # agent-level events, and for a contact the account no longer holds.
            sig { returns(T.nilable(String)) }
            attr_accessor :contact_phone_number

            # The event's own fields (outcome, reason, ...), exactly as the agent service
            # recorded them.
            sig { returns(T.nilable(T.anything)) }
            attr_reader :data

            sig { params(data: T.anything).void }
            attr_writer :data

            # The conversation (agent × contact) the event belongs to; absent on agent-level
            # events.
            sig { returns(T.nilable(String)) }
            attr_accessor :instance_id

            # Where the event stands among the agent's events: a number that grows with each,
            # so two events of the same second are put in order by it. Not a count: there are
            # gaps between an agent's own. Absent from an agent service that does not say it.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :sequence

            # Body of an agent.\* webhook (Sent Agents). The event is the agent service's own
            # record, forwarded without renaming: EventId is its id, so a subscriber can
            # dedupe a redelivery.
            sig do
              params(
                event_id: String,
                occurred_at: String,
                account_id: String,
                actor: T.nilable(String),
                agent_id: String,
                agent_name: T.nilable(String),
                agent_version: T.nilable(Integer),
                contact_id: T.nilable(String),
                contact_phone_number: T.nilable(String),
                data: T.anything,
                instance_id: T.nilable(String),
                sequence: T.nilable(Integer)
              ).returns(T.attached_class)
            end
            def self.new(
              # The agent service's event id. The same event is never delivered under two ids.
              event_id:,
              # When the agent service recorded it, UTC, to the millisecond.
              occurred_at:,
              # The sender profile the agent runs on.
              account_id: nil,
              # Who caused it: system, the agent service's customer, or an approver.
              actor: nil,
              # The agent.
              agent_id: nil,
              # The agent's name, as it is listed. Absent for an agent services no longer holds.
              agent_name: nil,
              # The version of the agent the event is of: the one its conversation runs, or the
              # active one for an event of the agent itself. Absent when the agent service does
              # not say it.
              agent_version: nil,
              # The contact of that conversation; absent on agent-level events.
              contact_id: nil,
              # The contact's phone number, in E.164, so a receiver knows who the event is about
              # without asking for the contact. Read from the account's contacts as the webhook
              # is built: the agent service's own record names a contact by id only. Absent on
              # agent-level events, and for a contact the account no longer holds.
              contact_phone_number: nil,
              # The event's own fields (outcome, reason, ...), exactly as the agent service
              # recorded them.
              data: nil,
              # The conversation (agent × contact) the event belongs to; absent on agent-level
              # events.
              instance_id: nil,
              # Where the event stands among the agent's events: a number that grows with each,
              # so two events of the same second are put in order by it. Not a count: there are
              # gaps between an agent's own. Absent from an agent service that does not say it.
              sequence: nil
            )
            end

            sig do
              override.returns(
                {
                  event_id: String,
                  occurred_at: String,
                  account_id: String,
                  actor: T.nilable(String),
                  agent_id: String,
                  agent_name: T.nilable(String),
                  agent_version: T.nilable(Integer),
                  contact_id: T.nilable(String),
                  contact_phone_number: T.nilable(String),
                  data: T.anything,
                  instance_id: T.nilable(String),
                  sequence: T.nilable(Integer)
                }
              )
            end
            def to_hash
            end
          end
        end

        sig do
          override.returns(
            T::Array[Sentdm::WebhookDelivery::EventData::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
