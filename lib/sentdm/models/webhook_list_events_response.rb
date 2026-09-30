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
      #   @return [Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent, Sentdm::Models::ChannelEvent, Sentdm::Models::ContactEvent, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload, nil]
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
      #   @param event_data [Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent, Sentdm::Models::ChannelEvent, Sentdm::Models::ContactEvent, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload] The exact event body that was delivered, or attempted, for this record. One of t
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
        variant -> { Sentdm::ChannelEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::ContactEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload }

        class SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload < Sentdm::Internal::Type::BaseModel
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
          #   Body of a link event: something happened to a tracked link Sent published on the
          #   customer's behalf. A link points either at a URL the customer supplied or at a
          #   file Sent hosts for them; LinkKind says which. Delivered when an eligible
          #   request is served, or when a published link reaches the end of its life.
          #
          #   A click is a request, not a read receipt. link.clicked means the redirect was
          #   served; link.downloaded means bytes went out. Neither proves a person saw
          #   anything — messaging providers and link scanners fetch URLs on their own, which
          #   is what TrafficClass exists to tell apart. Filter on it before reporting a
          #   click-through rate; treat likely_human as a hint, never as delivery
          #   confirmation.
          #
          #   RecordId identifies the link; the X-Webhook-Event-ID header identifies the
          #   delivery. One link is hit many times, so those are the two keys a subscriber
          #   needs: group by the first, deduplicate on the second — exactly as on every other
          #   family. The payload carries no event identifier of its own, for the same reason
          #   none of the others do.
          #
          #   Nothing here identifies the visitor. No IP address and no visitor token crosses
          #   this boundary. Country, Device and Browser are coarse buckets derived at the
          #   edge and are absent whenever the request did not supply enough to derive them.
          #
          #   @return [Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload::Payload, nil]
          optional :payload,
                   -> { Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload::Payload },
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
          #   {Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload}
          #   for more details.
          #
          #   The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
          #   this shape and varies only in Payload.
          #
          #   @param event [String, nil] The specific event within the family, for example message.delivered,
          #
          #   @param field [String] The event family, for example message, templates or contact. Route on
          #
          #   @param payload [Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload::Payload, nil] Body of a link event: something happened to a tracked link Sent published on the
          #
          #   @param request_id [String, nil] The event-specific body.
          #
          #   @param timestamp [String] When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission

          # @see Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload#payload
          class Payload < Sentdm::Internal::Type::BaseModel
            # @!attribute record_id
            #   The link's public identifier — the eight-character code in the short URL, for
            #   example A78B2BU0. Unique across both kinds, and never reused, so it is the
            #   stable key to group one link's events by.
            #
            #   @return [String]
            required :record_id, String

            # @!attribute access_country
            #   Where the request appeared to come from, as an ISO 3166-1 alpha-2 code. Named
            #   separately from the country on a channel event, which is a destination market
            #   the customer registered for — this one is a property of a single visitor and is
            #   absent when the edge could not resolve it.
            #
            #   @return [String, nil]
            optional :access_country, String, nil?: true

            # @!attribute access_outcome
            #   How the request was served, when the edge recorded it. Free text describing the
            #   outcome — show it to a human rather than branching on it.
            #
            #   @return [String, nil]
            optional :access_outcome, String, nil?: true

            # @!attribute browser
            #   The requesting browser family, for example chrome or safari, or unknown. Derived
            #   from the user agent.
            #
            #   @return [String, nil]
            optional :browser, String, nil?: true

            # @!attribute bytes_served
            #   How many bytes were served, for a file access. A ranged request reports the
            #   bytes in that range, not the size of the file, so several accesses of one file
            #   can each report a part.
            #
            #   @return [Integer, nil]
            optional :bytes_served, Integer, nil?: true

            # @!attribute channel
            #   The channel the message carrying this link went out on: sms, whatsapp, or rcs.
            #
            #   @return [String, nil]
            optional :channel, String, nil?: true

            # @!attribute customer_id
            #   The organization the link belongs to. Always the parent account, never a sender
            #   profile — read SenderProfileId for that.
            #
            #   This family publishes the owner as an explicit pair rather than the single
            #   account_id the other families use. The pair says which organization and which
            #   profile without the subscriber deriving either, which is the trade: one more key
            #   against not having to know that account_id silently becomes the profile when one
            #   exists.
            #
            #   @return [String, nil]
            optional :customer_id, String

            # @!attribute device
            #   The requesting device class: mobile, tablet, desktop or unknown. Derived from
            #   the user agent.
            #
            #   @return [String, nil]
            optional :device, String, nil?: true

            # @!attribute link_kind
            #   What the link points at: url for a destination the customer supplied, file for
            #   media Sent hosts. Always present, and implied by the event — link.clicked is
            #   always url and link.downloaded always file — but published as its own field so a
            #   subscriber can branch on the kind without parsing the event name, the same
            #   separation the channel family keeps between its event and its status.
            #
            #   @return [String, nil]
            optional :link_kind, String

            # @!attribute message_id
            #   The message the link was published in.
            #
            #   The event can arrive before the message is readable through GET /v3/messages: a
            #   provider may fetch a link within milliseconds of the send, and nothing here
            #   waits for the message row. Retry the read rather than treating an unknown id as
            #   an error.
            #
            #   @return [String, nil]
            optional :message_id, String, nil?: true

            # @!attribute occurred_at
            #   When the access or lifecycle change actually happened, in UTC
            #   (yyyy-MM-ddTHH:mm:ssZ). The envelope's timestamp is when Sent emitted the event;
            #   this is when the thing occurred, and the two differ by the ingest delay.
            #
            #   @return [String, nil]
            optional :occurred_at, String

            # @!attribute reference_key
            #   The caller-supplied label tying this link back to a position in the message, for
            #   example body:0 for the first link in the body. Present when the link was created
            #   with one.
            #
            #   @return [String, nil]
            optional :reference_key, String, nil?: true

            # @!attribute referrer_host
            #   The host of the page that linked here, when the request supplied one. The host
            #   only — never a full referring URL.
            #
            #   @return [String, nil]
            optional :referrer_host, String, nil?: true

            # @!attribute request_method
            #   The HTTP method of the request that was served, for an access event. Omitted on
            #   link.expired and link.revoked, which describe no request.
            #
            #   @return [String, nil]
            optional :request_method, String, nil?: true

            # @!attribute sender_profile_id
            #   The sender profile that owns the link, or null when the organization owns it
            #   directly. Always on the wire so a handler reads one shape rather than branching
            #   on whether the key arrived.
            #
            #   sender_profile_id, not profile_id: the API already publishes
            #   messaging_profile_id and sending_phone_number_profile_id for provider-side
            #   profiles, which are a different thing entirely. The unqualified name would read
            #   as one of those.
            #
            #   @return [String, nil]
            optional :sender_profile_id, String, nil?: true

            # @!attribute status_code
            #   The HTTP status Sent answered the request with: 302 for a link, 200 or 206 for a
            #   file. Omitted on lifecycle events.
            #
            #   @return [Integer, nil]
            optional :status_code, Integer, nil?: true

            # @!attribute traffic_class
            #   A coarse guess at what made the request: likely_human, provider (a messaging
            #   platform prefetching the link), bot, or unknown. Derived from the user agent, so
            #   it is a hint for filtering noise rather than a fact to bill or report on.
            #
            #   @return [String, nil]
            optional :traffic_class, String, nil?: true

            # @!method initialize(record_id:, access_country: nil, access_outcome: nil, browser: nil, bytes_served: nil, channel: nil, customer_id: nil, device: nil, link_kind: nil, message_id: nil, occurred_at: nil, reference_key: nil, referrer_host: nil, request_method: nil, sender_profile_id: nil, status_code: nil, traffic_class: nil)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload::Payload}
            #   for more details.
            #
            #   Body of a link event: something happened to a tracked link Sent published on the
            #   customer's behalf. A link points either at a URL the customer supplied or at a
            #   file Sent hosts for them; LinkKind says which. Delivered when an eligible
            #   request is served, or when a published link reaches the end of its life.
            #
            #   A click is a request, not a read receipt. link.clicked means the redirect was
            #   served; link.downloaded means bytes went out. Neither proves a person saw
            #   anything — messaging providers and link scanners fetch URLs on their own, which
            #   is what TrafficClass exists to tell apart. Filter on it before reporting a
            #   click-through rate; treat likely_human as a hint, never as delivery
            #   confirmation.
            #
            #   RecordId identifies the link; the X-Webhook-Event-ID header identifies the
            #   delivery. One link is hit many times, so those are the two keys a subscriber
            #   needs: group by the first, deduplicate on the second — exactly as on every other
            #   family. The payload carries no event identifier of its own, for the same reason
            #   none of the others do.
            #
            #   Nothing here identifies the visitor. No IP address and no visitor token crosses
            #   this boundary. Country, Device and Browser are coarse buckets derived at the
            #   edge and are absent whenever the request did not supply enough to derive them.
            #
            #   @param record_id [String] The link's public identifier — the eight-character code in the short URL, for ex
            #
            #   @param access_country [String, nil] Where the request appeared to come from, as an ISO 3166-1 alpha-2 code. Named se
            #
            #   @param access_outcome [String, nil] How the request was served, when the edge recorded it. Free text describing the
            #
            #   @param browser [String, nil] The requesting browser family, for example chrome or safari, or
            #
            #   @param bytes_served [Integer, nil] How many bytes were served, for a file access. A ranged request reports the byte
            #
            #   @param channel [String, nil] The channel the message carrying this link went out on: sms, whatsapp, or
            #
            #   @param customer_id [String] The organization the link belongs to. Always the parent account, never a sender
            #
            #   @param device [String, nil] The requesting device class: mobile, tablet, desktop or
            #
            #   @param link_kind [String] What the link points at: url for a destination the customer supplied, file for
            #
            #   @param message_id [String, nil] The message the link was published in.
            #
            #   @param occurred_at [String] When the access or lifecycle change actually happened, in UTC
            #
            #   @param reference_key [String, nil] The caller-supplied label tying this link back to a position in the message, for
            #
            #   @param referrer_host [String, nil] The host of the page that linked here, when the request supplied one. The host o
            #
            #   @param request_method [String, nil] The HTTP method of the request that was served, for an access event. Omitted on
            #
            #   @param sender_profile_id [String, nil] The sender profile that owns the link, or null when the organization owns it dir
            #
            #   @param status_code [Integer, nil] The HTTP status Sent answered the request with: 302 for a link, 200 or
            #
            #   @param traffic_class [String, nil] A coarse guess at what made the request: likely_human, provider (a messaging
          end
        end

        class SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload < Sentdm::Internal::Type::BaseModel
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
          #   Body of a call.initiated, call.answered, call.completed, call.failed or
          #   call.recording_ready event. Which of them occurred is the envelope's event.
          #
          #   Shaped like the message, inbound, template and channel payloads: account_id
          #   names the account the event is about, channel names the channel, and updated_at
          #   is when the change happened on the call, in the same yyyy-MM-ddTHH:mm:ssZ form.
          #   duration_seconds and price are added on call.completed, reason on call.failed
          #   and recording_id on call.recording_ready; each is omitted rather than sent as
          #   null when it does not apply.
          #
          #   Casing is snake_case because these ride the same webhook stream customers
          #   already parse message_id from; the question/answer contract is a separate
          #   surface and stays camelCase. Nothing here is provider-shaped: no provider call
          #   id, no namespaced identity.
          #
          #   @return [Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload::Payload, nil]
          optional :payload,
                   -> { Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload::Payload },
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
          #   {Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload}
          #   for more details.
          #
          #   The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
          #   this shape and varies only in Payload.
          #
          #   @param event [String, nil] The specific event within the family, for example message.delivered,
          #
          #   @param field [String] The event family, for example message, templates or contact. Route on
          #
          #   @param payload [Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload::Payload, nil] Body of a call.initiated, call.answered, call.completed, call.failed
          #
          #   @param request_id [String, nil] The event-specific body.
          #
          #   @param timestamp [String] When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission

          # @see Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload#payload
          class Payload < Sentdm::Internal::Type::BaseModel
            # @!attribute call_id
            #   Sent's call id, the same one the customer saw on the first question.
            #
            #   @return [String]
            required :call_id, String

            # @!attribute account_id
            #   The account the call belongs to: the key's own customer, or the sender profile
            #   it acted as.
            #
            #   @return [String, nil]
            optional :account_id, String

            # @!attribute channel
            #   Always voice.
            #
            #   @return [String, nil]
            optional :channel, String

            # @!attribute duration_seconds
            #   How long the call lasted. Only on call.completed.
            #
            #   @return [Integer, nil]
            optional :duration_seconds, Integer, nil?: true

            # @!attribute number
            #   The customer number that owns the call, in E.164 format.
            #
            #   @return [String, nil]
            optional :number, String

            # @!attribute price
            #   What the call was charged. Only on call.completed, and omitted there until
            #   billing has recorded the charge.
            #
            #   @return [Float, nil]
            optional :price, Float, nil?: true

            # @!attribute reason
            #   The machine-readable reason the call did not complete. Only on call.failed, and
            #   omitted when no reason was recorded.
            #
            #   @return [String, nil]
            optional :reason, String, nil?: true

            # @!attribute recording_id
            #   The recording that became available, the same id GET /v3/calls/{id}/recordings
            #   lists it under. Only on call.recording_ready, which is sent once per recording.
            #
            #   @return [String, nil]
            optional :recording_id, String, nil?: true

            # @!attribute updated_at
            #   When the change happened on the call, as opposed to when the event was emitted.
            #
            #   @return [String, nil]
            optional :updated_at, String

            # @!method initialize(call_id:, account_id: nil, channel: nil, duration_seconds: nil, number: nil, price: nil, reason: nil, recording_id: nil, updated_at: nil)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload::Payload}
            #   for more details.
            #
            #   Body of a call.initiated, call.answered, call.completed, call.failed or
            #   call.recording_ready event. Which of them occurred is the envelope's event.
            #
            #   Shaped like the message, inbound, template and channel payloads: account_id
            #   names the account the event is about, channel names the channel, and updated_at
            #   is when the change happened on the call, in the same yyyy-MM-ddTHH:mm:ssZ form.
            #   duration_seconds and price are added on call.completed, reason on call.failed
            #   and recording_id on call.recording_ready; each is omitted rather than sent as
            #   null when it does not apply.
            #
            #   Casing is snake_case because these ride the same webhook stream customers
            #   already parse message_id from; the question/answer contract is a separate
            #   surface and stays camelCase. Nothing here is provider-shaped: no provider call
            #   id, no namespaced identity.
            #
            #   @param call_id [String] Sent's call id, the same one the customer saw on the first question.
            #
            #   @param account_id [String] The account the call belongs to: the key's own customer, or the sender profile i
            #
            #   @param channel [String] Always voice.
            #
            #   @param duration_seconds [Integer, nil] How long the call lasted. Only on call.completed.
            #
            #   @param number [String] The customer number that owns the call, in E.164 format.
            #
            #   @param price [Float, nil] What the call was charged. Only on call.completed, and omitted there until billi
            #
            #   @param reason [String, nil] The machine-readable reason the call did not complete. Only on call.failed, and
            #
            #   @param recording_id [String, nil] The recording that became available, the same id GET /v3/calls/{id}/recordings l
            #
            #   @param updated_at [String] When the change happened on the call, as opposed to when the event was emitted.
          end
        end

        # @!method self.variants
        #   @return [Array(Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent, Sentdm::Models::ChannelEvent, Sentdm::Models::ContactEvent, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfLinkWebhookPayload, Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfCallWebhookPayload)]
      end
    end
  end
end
