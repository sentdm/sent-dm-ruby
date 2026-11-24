# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list_events
    class WebhookDelivery < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute created_at
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute delivery_attempts
      #
      #   @return [Integer, nil]
      optional :delivery_attempts, Integer

      # @!attribute delivery_status
      #
      #   @return [String, nil]
      optional :delivery_status, String

      # @!attribute error_message
      #
      #   @return [String, nil]
      optional :error_message, String, nil?: true

      # @!attribute event_data
      #   The exact event body that was delivered, or attempted, for this record. One of
      #   the six webhook envelopes:
      #
      #   message — an outbound message changed status. message with event:
      #   message.received — someone replied to you. templates — a template was approved,
      #   rejected, paused or similar. channel — one of your markets moved in provisioning
      #   or compliance. contact — a consent signal: opt-in, opt-out or help. link — a
      #   tracked short link was clicked or a hosted file downloaded, or one expired or
      #   was revoked.
      #
      #   Read field and event to tell which, the same way your endpoint does. The two
      #   message envelopes are the reason that is two fields and not one: they share a
      #   field and differ by event.
      #
      #   Treat the list as open. It has grown twice — channel and then link — and a
      #   handler that rejects an envelope it does not recognise will break on the next
      #   addition rather than ignore it.
      #
      #   @return [Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent, Sentdm::Models::ChannelEvent, Sentdm::Models::ContactEvent, Sentdm::Models::LinkEvent, Sentdm::Models::CallEvent, Sentdm::Models::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload, nil]
      optional :event_data, union: -> { Sentdm::WebhookDelivery::EventData }

      # @!attribute event_type
      #
      #   @return [String, nil]
      optional :event_type, String

      # @!attribute http_status_code
      #
      #   @return [Integer, nil]
      optional :http_status_code, Integer, nil?: true

      # @!attribute processing_completed_at
      #
      #   @return [Time, nil]
      optional :processing_completed_at, Time, nil?: true

      # @!attribute processing_started_at
      #
      #   @return [Time, nil]
      optional :processing_started_at, Time, nil?: true

      # @!attribute response_body
      #
      #   @return [String, nil]
      optional :response_body, String, nil?: true

      # @!method initialize(id: nil, created_at: nil, delivery_attempts: nil, delivery_status: nil, error_message: nil, event_data: nil, event_type: nil, http_status_code: nil, processing_completed_at: nil, processing_started_at: nil, response_body: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::WebhookDelivery} for more details.
      #
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param delivery_attempts [Integer]
      #
      #   @param delivery_status [String]
      #
      #   @param error_message [String, nil]
      #
      #   @param event_data [Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent, Sentdm::Models::ChannelEvent, Sentdm::Models::ContactEvent, Sentdm::Models::LinkEvent, Sentdm::Models::CallEvent, Sentdm::Models::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload] The exact event body that was delivered, or attempted, for this record. One of t
      #
      #   @param event_type [String]
      #
      #   @param http_status_code [Integer, nil]
      #
      #   @param processing_completed_at [Time, nil]
      #
      #   @param processing_started_at [Time, nil]
      #
      #   @param response_body [String, nil]

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
      #
      # @see Sentdm::Models::WebhookDelivery#event_data
      module EventData
        extend Sentdm::Internal::Type::Union

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::MessageEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::InboundMessageEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::TemplateEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::ChannelEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::ContactEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::LinkEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::CallEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload }

        class SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload < Sentdm::Internal::Type::BaseModel
          # @!attribute event
          #   The specific event within the family, for example message.delivered,
          #   message.received or contact.opt_out. Absent on events that have no subtype, so
          #   treat it as optional.
          #
          #   @return [String, nil]
          optional :event, String, nil?: true

          # @!attribute field
          #   The event family, for example message, templates or contact. Route on this
          #   first, then on event for the specific change.
          #
          #   @return [String, nil]
          optional :field, String

          # @!attribute payload
          #   Body of an agent.\* webhook (Sent Agents). The event is the agent service's own
          #   record, forwarded without renaming: EventId is its id, so a subscriber can
          #   dedupe a redelivery.
          #
          #   @return [Sentdm::Models::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::Payload, nil]
          optional :payload,
                   -> {
                     Sentdm::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::Payload
                   },
                   nil?: true

          # @!attribute request_id
          #   The event-specific body.
          #
          #   @return [String, nil]
          optional :request_id, String, nil?: true

          # @!attribute timestamp
          #   When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
          #   time, not the time the underlying change happened. Use the timestamp inside the
          #   payload for the latter.
          #
          #   @return [String, nil]
          optional :timestamp, String

          # @!method initialize(event: nil, field: nil, payload: nil, request_id: nil, timestamp: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload}
          #   for more details.
          #
          #   The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
          #   this shape and varies only in Payload.
          #
          #   @param event [String, nil] The specific event within the family, for example message.delivered,
          #
          #   @param field [String] The event family, for example message, templates or contact. Route on
          #
          #   @param payload [Sentdm::Models::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::Payload, nil] Body of an agent.\* webhook (Sent Agents). The event is the agent service's own
          #   r
          #
          #   @param request_id [String, nil] The event-specific body.
          #
          #   @param timestamp [String] When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission

          # @see Sentdm::Models::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload#payload
          class Payload < Sentdm::Internal::Type::BaseModel
            # @!attribute event_id
            #   The agent service's event id. The same event is never delivered under two ids.
            #
            #   @return [String]
            required :event_id, String

            # @!attribute occurred_at
            #   When the agent service recorded it, UTC, to the millisecond.
            #
            #   @return [String]
            required :occurred_at, String

            # @!attribute account_id
            #   The sender profile the agent runs on.
            #
            #   @return [String, nil]
            optional :account_id, String

            # @!attribute actor
            #   Who caused it: system, the agent service's customer, or an approver.
            #
            #   @return [String, nil]
            optional :actor, String, nil?: true

            # @!attribute agent_id
            #   The agent.
            #
            #   @return [String, nil]
            optional :agent_id, String

            # @!attribute agent_name
            #   The agent's name, as it is listed. Absent for an agent services no longer holds.
            #
            #   @return [String, nil]
            optional :agent_name, String, nil?: true

            # @!attribute agent_version
            #   The version of the agent the event is of: the one its conversation runs, or the
            #   active one for an event of the agent itself. Absent when the agent service does
            #   not say it.
            #
            #   @return [Integer, nil]
            optional :agent_version, Integer, nil?: true

            # @!attribute contact_id
            #   The contact of that conversation; absent on agent-level events.
            #
            #   @return [String, nil]
            optional :contact_id, String, nil?: true

            # @!attribute contact_phone_number
            #   The contact's phone number, in E.164, so a receiver knows who the event is about
            #   without asking for the contact. Read from the account's contacts as the webhook
            #   is built: the agent service's own record names a contact by id only. Absent on
            #   agent-level events, and for a contact the account no longer holds.
            #
            #   @return [String, nil]
            optional :contact_phone_number, String, nil?: true

            # @!attribute data
            #   The event's own fields (outcome, reason, ...), exactly as the agent service
            #   recorded them.
            #
            #   @return [Object, nil]
            optional :data, Sentdm::Internal::Type::Unknown

            # @!attribute instance_id
            #   The conversation (agent × contact) the event belongs to; absent on agent-level
            #   events.
            #
            #   @return [String, nil]
            optional :instance_id, String, nil?: true

            # @!attribute sequence
            #   Where the event stands among the agent's events: a number that grows with each,
            #   so two events of the same second are put in order by it. Not a count: there are
            #   gaps between an agent's own. Absent from an agent service that does not say it.
            #
            #   @return [Integer, nil]
            optional :sequence, Integer, nil?: true

            # @!method initialize(event_id:, occurred_at:, account_id: nil, actor: nil, agent_id: nil, agent_name: nil, agent_version: nil, contact_id: nil, contact_phone_number: nil, data: nil, instance_id: nil, sequence: nil)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload::Payload}
            #   for more details.
            #
            #   Body of an agent.\* webhook (Sent Agents). The event is the agent service's own
            #   record, forwarded without renaming: EventId is its id, so a subscriber can
            #   dedupe a redelivery.
            #
            #   @param event_id [String] The agent service's event id. The same event is never delivered under two ids.
            #
            #   @param occurred_at [String] When the agent service recorded it, UTC, to the millisecond.
            #
            #   @param account_id [String] The sender profile the agent runs on.
            #
            #   @param actor [String, nil] Who caused it: system, the agent service's customer, or an approver.
            #
            #   @param agent_id [String] The agent.
            #
            #   @param agent_name [String, nil] The agent's name, as it is listed. Absent for an agent services no longer holds.
            #
            #   @param agent_version [Integer, nil] The version of the agent the event is of: the one its conversation runs, or the
            #
            #   @param contact_id [String, nil] The contact of that conversation; absent on agent-level events.
            #
            #   @param contact_phone_number [String, nil] The contact's phone number, in E.164, so a receiver knows who the event is about
            #
            #   @param data [Object] The event's own fields (outcome, reason, ...), exactly as the agent service reco
            #
            #   @param instance_id [String, nil] The conversation (agent × contact) the event belongs to; absent on agent-level e
            #
            #   @param sequence [Integer, nil] Where the event stands among the agent's events: a number that grows with each,
          end
        end

        # @!method self.variants
        #   @return [Array(Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent, Sentdm::Models::ChannelEvent, Sentdm::Models::ContactEvent, Sentdm::Models::LinkEvent, Sentdm::Models::CallEvent, Sentdm::Models::WebhookDelivery::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfAgentWebhookPayload)]
      end
    end
  end
end
