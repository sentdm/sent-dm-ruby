# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list_events
    class WebhookListEventsResponse < Sentdm::Internal::Type::BaseModel
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
      #   the four webhook envelopes: a message status change, an inbound message, a
      #   template status change, or a contact consent signal. Read field and event to
      #   tell which, the same way your endpoint does.
      #
      #   @return [Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload, nil]
      optional :event_data, union: -> { Sentdm::Models::WebhookListEventsResponse::EventData }

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
      #   {Sentdm::Models::WebhookListEventsResponse} for more details.
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
      #   @param event_data [Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload] The exact event body that was delivered, or attempted, for this record. One of t
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
      # the four webhook envelopes: a message status change, an inbound message, a
      # template status change, or a contact consent signal. Read field and event to
      # tell which, the same way your endpoint does.
      #
      # @see Sentdm::Models::WebhookListEventsResponse#event_data
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
        variant -> { Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload }

        class SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload < Sentdm::Internal::Type::BaseModel
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
          #   Body of a channel event: where one of the customer's channels stands in
          #   provisioning and compliance. Delivered when a milestone moves — a registration
          #   filed, a verdict returned, a resubmission asked for, a sender gone live — so a
          #   customer's own onboarding UI does not have to poll GET /v3/channels.
          #
          #   The subject is one item, never the account. A customer's "SMS channel" has no
          #   status; a market does. Country, NumberType and SenderValue name which one, so a
          #   customer terminating only to Kosovo never receives an event about US 10DLC.
          #
          #   Status is the stable half of the contract. It is the same four-value set GET
          #   /v3/channels publishes, computed through the same code, so an event and a read
          #   of the same market cannot disagree. A subscriber that reads nothing but the
          #   status and the subject fields is a correct subscriber. The sub-type on the
          #   envelope names the specific milestone and is additive — that vocabulary comes
          #   from registries and carriers, which are parties Sent does not control.
          #
          #   Status means provisioning and compliance are complete, not that a send will
          #   succeed right now. An account can be suspended, or a destination blocked by a
          #   routing rule, without either showing up here. Those are separate surfaces and
          #   deliberately not modelled on this payload.
          #
          #   @return [Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::Payload, nil]
          optional :payload,
                   -> { Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::Payload },
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
          #   {Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload}
          #   for more details.
          #
          #   The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
          #   this shape and varies only in Payload.
          #
          #   @param event [String, nil] The specific event within the family, for example message.delivered,
          #
          #   @param field [String] The event family, for example message, templates or contact. Route on
          #
          #   @param payload [Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::Payload, nil] Body of a channel event: where one of the customer's channels stands in provisio
          #
          #   @param request_id [String, nil] The event-specific body.
          #
          #   @param timestamp [String] When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission

          # @see Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload#payload
          class Payload < Sentdm::Internal::Type::BaseModel
            # @!attribute country
            #   The market's destination country as an ISO 3166-1 alpha-2 code, for example XK.
            #   Always present, and the property that identifies this payload among the
            #   delivered envelopes — see DeliveredWebhookEvents. Every event in this family
            #   reports one market, and a market has a country.
            #
            #   @return [String]
            required :country, String

            # @!attribute account_id
            #   The account whose market this is, named as on every other family. When an
            #   organization receives an event for one of its sender profiles this is the
            #   profile, so a reseller compares it with its own id and anything different is one
            #   of its profiles.
            #
            #   @return [String, nil]
            optional :account_id, String

            # @!attribute channel
            #   The channel this market belongs to: sms, whatsapp, or rcs. Never sent — that
            #   value belongs to message events, where it names the smart-routing brand rather
            #   than a channel that can be provisioned.
            #
            #   @return [String, nil]
            optional :channel, String

            # @!attribute number_type
            #   The kind of sender the market uses, for example TEN_DLC, LOCAL, or ALPHANUMERIC.
            #   Omitted when the subject has no sender type of its own.
            #
            #   @return [String, nil]
            optional :number_type, String, nil?: true

            # @!attribute reason
            #   Why the market reached this state, when a reason was given — a correction
            #   explained, or a campaign lapse. Free text, passed through from the registry or
            #   carrier that wrote it, so treat it as a message to show a human rather than a
            #   value to branch on.
            #
            #   @return [String, nil]
            optional :reason, String, nil?: true

            # @!attribute sender_value
            #   The sender itself — a number in E.164, or an alphanumeric sender ID.
            #
            #   Always present, and null until a sender exists. The key is on every delivery so
            #   a subscriber reads one shape rather than branching on whether the field arrived
            #   — the same choice template_id makes on the message payload.
            #
            #   It can carry a value at any point in the lifecycle, not only once the market is
            #   live: a number ordered and not yet active at the carrier is already known during
            #   PROVISIONING, and an alphanumeric sender the customer chose themselves is known
            #   before anything is filed. It is null while the market is still waiting on a
            #   number, which for a US 10DLC registration is every event up to
            #   channel.activated.
            #
            #   @return [String, nil]
            optional :sender_value, String, nil?: true

            # @!attribute status
            #   Where the market stands: PENDING_REVIEW, ACTION_NEEDED, PROVISIONING, ACTIVE or
            #   INACTIVE. PENDING_REVIEW means a registry or a carrier holds it and the wait is
            #   theirs; ACTION_NEEDED means it is yours; PROVISIONING means the verdict is in
            #   and Sent is acquiring the sender; INACTIVE means it had a working sender and no
            #   longer does.
            #
            #   Each event name is the transition into one of these, but the two are separate
            #   fields and may legitimately differ. A resubmission filed against a market whose
            #   sender is already live is channel.submitted carrying ACTIVE: a correction is
            #   with the registry and the sender keeps working. Read both.
            #
            #   @return [String, nil]
            optional :status, String

            # @!attribute updated_at
            #   When the transition happened, in UTC (yyyy-MM-ddTHH:mm:ssZ).
            #
            #   @return [String, nil]
            optional :updated_at, String

            # @!method initialize(country:, account_id: nil, channel: nil, number_type: nil, reason: nil, sender_value: nil, status: nil, updated_at: nil)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::Payload}
            #   for more details.
            #
            #   Body of a channel event: where one of the customer's channels stands in
            #   provisioning and compliance. Delivered when a milestone moves — a registration
            #   filed, a verdict returned, a resubmission asked for, a sender gone live — so a
            #   customer's own onboarding UI does not have to poll GET /v3/channels.
            #
            #   The subject is one item, never the account. A customer's "SMS channel" has no
            #   status; a market does. Country, NumberType and SenderValue name which one, so a
            #   customer terminating only to Kosovo never receives an event about US 10DLC.
            #
            #   Status is the stable half of the contract. It is the same four-value set GET
            #   /v3/channels publishes, computed through the same code, so an event and a read
            #   of the same market cannot disagree. A subscriber that reads nothing but the
            #   status and the subject fields is a correct subscriber. The sub-type on the
            #   envelope names the specific milestone and is additive — that vocabulary comes
            #   from registries and carriers, which are parties Sent does not control.
            #
            #   Status means provisioning and compliance are complete, not that a send will
            #   succeed right now. An account can be suspended, or a destination blocked by a
            #   routing rule, without either showing up here. Those are separate surfaces and
            #   deliberately not modelled on this payload.
            #
            #   @param country [String] The market's destination country as an ISO 3166-1 alpha-2 code, for example XK.
            #
            #   @param account_id [String] The account whose market this is, named as on every other family. When an organi
            #
            #   @param channel [String] The channel this market belongs to: sms, whatsapp, or rcs. Never
            #
            #   @param number_type [String, nil] The kind of sender the market uses, for example TEN_DLC, LOCAL, or
            #
            #   @param reason [String, nil] Why the market reached this state, when a reason was given — a correction explai
            #
            #   @param sender_value [String, nil] The sender itself — a number in E.164, or an alphanumeric sender ID.
            #
            #   @param status [String] Where the market stands: PENDING_REVIEW, ACTION_NEEDED, PROVISIONING,
            #
            #   @param updated_at [String] When the transition happened, in UTC (yyyy-MM-ddTHH:mm:ssZ).
          end
        end

        class SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload < Sentdm::Internal::Type::BaseModel
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
          #   Body of a contact.opt_in, contact.opt_out or contact.help event. Delivered when
          #   a contact signals a consent change or asks for help.
          #
          #   These events state the signal outright, so you do not have to recognise keywords
          #   in the text of a message.received event. They also cover cases that produce no
          #   inbound message at all, such as a network handling an opt-out on your behalf.
          #
          #   Fields are ordered identity → resulting state → provenance → join key. Nothing
          #   here restates the envelope: which of the three signals occurred is the
          #   envelope's event, and when it was emitted is its timestamp. Retries carry the
          #   same X-Webhook-Event-ID header, which is what to deduplicate on.
          #
          #   @return [Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::Payload, nil]
          optional :payload,
                   -> { Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::Payload },
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
          #   {Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload}
          #   for more details.
          #
          #   The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
          #   this shape and varies only in Payload.
          #
          #   @param event [String, nil] The specific event within the family, for example message.delivered,
          #
          #   @param field [String] The event family, for example message, templates or contact. Route on
          #
          #   @param payload [Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::Payload, nil] Body of a contact.opt_in, contact.opt_out or contact.help event. Delivered
          #
          #   @param request_id [String, nil] The event-specific body.
          #
          #   @param timestamp [String] When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission

          # @see Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload#payload
          class Payload < Sentdm::Internal::Type::BaseModel
            # @!attribute opt_out
            #   Whether the contact is opted out after this signal — the state to write to your
            #   own record. Same meaning as opt_out on the contact resource. On contact.help
            #   this reports the contact's existing state, which help does not change.
            #
            #   Two signals from the same contact can arrive out of order, because each one is
            #   queued on its own rather than against the contact. Compare the envelope's
            #   timestamp before you overwrite a newer state with an older one. That timestamp
            #   is second-precision, so treat two signals stamped in the same second as
            #   unordered and read the contact resource to settle them.
            #
            #   @return [Boolean]
            required :opt_out, Sentdm::Internal::Type::Boolean

            # @!attribute source
            #   How the signal reached us. INBOUND_KEYWORD means the contact sent a message
            #   whose text matched one of the keywords; PROVIDER_SIGNAL means the network
            #   reported it. A provider signal usually carries no message_id or text, so read
            #   both for null rather than inferring them from this field.
            #
            #   @return [String]
            required :source, String

            # @!attribute account_id
            #   The account the contact belongs to. Present so one endpoint can serve several
            #   accounts.
            #
            #   @return [String, nil]
            optional :account_id, String

            # @!attribute channel
            #   The channel the signal arrived on, for example sms or whatsapp.
            #
            #   @return [String, nil]
            optional :channel, String

            # @!attribute contact_id
            #   The contact who raised the signal. Always populated, including for contact.help
            #   from a number you have not messaged before — the contact is created if it does
            #   not exist yet, so this identifier is always resolvable against the contacts API.
            #
            #   @return [String, nil]
            optional :contact_id, String

            # @!attribute message_id
            #   The inbound message that carried the signal, matching message_id on the
            #   corresponding message.received event so the two can be joined.
            #
            #   Sent as null when the signal did not arrive as a message — for example when a
            #   network processed an opt-out on your behalf — and also when the message belongs
            #   to a different account than this event, which can happen on a shared WhatsApp
            #   number. The field is always present, so read it and check for null rather than
            #   checking whether the key exists.
            #
            #   @return [String, nil]
            optional :message_id, String, nil?: true

            # @!attribute phone_number
            #   The contact's number in E.164 format. Same value as phone_number on the contact
            #   resource.
            #
            #   @return [String, nil]
            optional :phone_number, String

            # @!attribute text
            #   The text the contact sent, for example STOP or UNSUBSCRIBE. Sent as null when
            #   the signal did not arrive as text. The field is always present, so read it and
            #   check for null rather than checking whether the key exists.
            #
            #   @return [String, nil]
            optional :text, String, nil?: true

            # @!method initialize(opt_out:, source:, account_id: nil, channel: nil, contact_id: nil, message_id: nil, phone_number: nil, text: nil)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::Payload}
            #   for more details.
            #
            #   Body of a contact.opt_in, contact.opt_out or contact.help event. Delivered when
            #   a contact signals a consent change or asks for help.
            #
            #   These events state the signal outright, so you do not have to recognise keywords
            #   in the text of a message.received event. They also cover cases that produce no
            #   inbound message at all, such as a network handling an opt-out on your behalf.
            #
            #   Fields are ordered identity → resulting state → provenance → join key. Nothing
            #   here restates the envelope: which of the three signals occurred is the
            #   envelope's event, and when it was emitted is its timestamp. Retries carry the
            #   same X-Webhook-Event-ID header, which is what to deduplicate on.
            #
            #   @param opt_out [Boolean] Whether the contact is opted out after this signal — the state to write to your
            #
            #   @param source [String] How the signal reached us. INBOUND_KEYWORD means the contact sent a message whos
            #
            #   @param account_id [String] The account the contact belongs to. Present so one endpoint can serve several ac
            #
            #   @param channel [String] The channel the signal arrived on, for example sms or whatsapp.
            #
            #   @param contact_id [String] The contact who raised the signal. Always populated, including for contact.help
            #
            #   @param message_id [String, nil] The inbound message that carried the signal, matching message_id on the
            #
            #   @param phone_number [String] The contact's number in E.164 format. Same value as phone_number on the contact
            #
            #   @param text [String, nil] The text the contact sent, for example STOP or UNSUBSCRIBE. Sent as
          end
        end

        # @!method self.variants
        #   @return [Array(Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload)]
      end
    end
  end
end
