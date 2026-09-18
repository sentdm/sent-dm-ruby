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
      # the four webhook envelopes: a message status change, an inbound message, a
      # template status change, or a contact consent signal. Read field and event to
      # tell which, the same way your endpoint does.
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
              Sentdm::TemplateEvent::OrHash,
              Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::OrHash,
              Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::OrHash
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
              Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::OrHash,
              Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::OrHash
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
        # the four webhook envelopes: a message status change, an inbound message, a
        # template status change, or a contact consent signal. Read field and event to
        # tell which, the same way your endpoint does.
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
      # the four webhook envelopes: a message status change, an inbound message, a
      # template status change, or a contact consent signal. Read field and event to
      # tell which, the same way your endpoint does.
      module EventData
        extend Sentdm::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Sentdm::MessageEvent,
              Sentdm::InboundMessageEvent,
              Sentdm::TemplateEvent,
              Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload,
              Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload
            )
          end

        class SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload,
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

          # Body of a channel event: where one of the customer's channels stands in
          # provisioning and compliance. Delivered when a milestone moves — a registration
          # filed, a verdict returned, a resubmission asked for, a sender gone live — so a
          # customer's own onboarding UI does not have to poll GET /v3/channels.
          #
          # The subject is one item, never the account. A customer's "SMS channel" has no
          # status; a market does. Country, NumberType and SenderValue name which one, so a
          # customer terminating only to Kosovo never receives an event about US 10DLC.
          #
          # Status is the stable half of the contract. It is the same four-value set GET
          # /v3/channels publishes, computed through the same code, so an event and a read
          # of the same market cannot disagree. A subscriber that reads nothing but the
          # status and the subject fields is a correct subscriber. The sub-type on the
          # envelope names the specific milestone and is additive — that vocabulary comes
          # from registries and carriers, which are parties Sent does not control.
          #
          # Status means provisioning and compliance are complete, not that a send will
          # succeed right now. An account can be suspended, or a destination blocked by a
          # routing rule, without either showing up here. Those are separate surfaces and
          # deliberately not modelled on this payload.
          sig do
            returns(
              T.nilable(
                Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::Payload
              )
            )
          end
          attr_reader :payload

          sig do
            params(
              payload:
                T.nilable(
                  Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::Payload::OrHash
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
                  Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::Payload::OrHash
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
            # Body of a channel event: where one of the customer's channels stands in
            # provisioning and compliance. Delivered when a milestone moves — a registration
            # filed, a verdict returned, a resubmission asked for, a sender gone live — so a
            # customer's own onboarding UI does not have to poll GET /v3/channels.
            #
            # The subject is one item, never the account. A customer's "SMS channel" has no
            # status; a market does. Country, NumberType and SenderValue name which one, so a
            # customer terminating only to Kosovo never receives an event about US 10DLC.
            #
            # Status is the stable half of the contract. It is the same four-value set GET
            # /v3/channels publishes, computed through the same code, so an event and a read
            # of the same market cannot disagree. A subscriber that reads nothing but the
            # status and the subject fields is a correct subscriber. The sub-type on the
            # envelope names the specific milestone and is additive — that vocabulary comes
            # from registries and carriers, which are parties Sent does not control.
            #
            # Status means provisioning and compliance are complete, not that a send will
            # succeed right now. An account can be suspended, or a destination blocked by a
            # routing rule, without either showing up here. Those are separate surfaces and
            # deliberately not modelled on this payload.
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
                    Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::Payload
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
                  Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfChannelWebhookPayload::Payload,
                  Sentdm::Internal::AnyHash
                )
              end

            # The market's destination country as an ISO 3166-1 alpha-2 code, for example XK.
            # Always present, and the property that identifies this payload among the
            # delivered envelopes — see DeliveredWebhookEvents. Every event in this family
            # reports one market, and a market has a country.
            sig { returns(String) }
            attr_accessor :country

            # The account whose market this is, named as on every other family. When an
            # organization receives an event for one of its sender profiles this is the
            # profile, so a reseller compares it with its own id and anything different is one
            # of its profiles.
            sig { returns(T.nilable(String)) }
            attr_reader :account_id

            sig { params(account_id: String).void }
            attr_writer :account_id

            # The channel this market belongs to: sms, whatsapp, or rcs. Never sent — that
            # value belongs to message events, where it names the smart-routing brand rather
            # than a channel that can be provisioned.
            sig { returns(T.nilable(String)) }
            attr_reader :channel

            sig { params(channel: String).void }
            attr_writer :channel

            # The kind of sender the market uses, for example TEN_DLC, LOCAL, or ALPHANUMERIC.
            # Omitted when the subject has no sender type of its own.
            sig { returns(T.nilable(String)) }
            attr_accessor :number_type

            # Why the market reached this state, when a reason was given — a correction
            # explained, or a campaign lapse. Free text, passed through from the registry or
            # carrier that wrote it, so treat it as a message to show a human rather than a
            # value to branch on.
            sig { returns(T.nilable(String)) }
            attr_accessor :reason

            # The sender itself — a number in E.164, or an alphanumeric sender ID.
            #
            # Always present, and null until a sender exists. The key is on every delivery so
            # a subscriber reads one shape rather than branching on whether the field arrived
            # — the same choice template_id makes on the message payload.
            #
            # It can carry a value at any point in the lifecycle, not only once the market is
            # live: a number ordered and not yet active at the carrier is already known during
            # PROVISIONING, and an alphanumeric sender the customer chose themselves is known
            # before anything is filed. It is null while the market is still waiting on a
            # number, which for a US 10DLC registration is every event up to
            # channel.activated.
            sig { returns(T.nilable(String)) }
            attr_accessor :sender_value

            # Where the market stands: PENDING_REVIEW, ACTION_NEEDED, PROVISIONING, ACTIVE or
            # INACTIVE. PENDING_REVIEW means a registry or a carrier holds it and the wait is
            # theirs; ACTION_NEEDED means it is yours; PROVISIONING means the verdict is in
            # and Sent is acquiring the sender; INACTIVE means it had a working sender and no
            # longer does.
            #
            # Each event name is the transition into one of these, but the two are separate
            # fields and may legitimately differ. A resubmission filed against a market whose
            # sender is already live is channel.submitted carrying ACTIVE: a correction is
            # with the registry and the sender keeps working. Read both.
            sig { returns(T.nilable(String)) }
            attr_reader :status

            sig { params(status: String).void }
            attr_writer :status

            # When the transition happened, in UTC (yyyy-MM-ddTHH:mm:ssZ).
            sig { returns(T.nilable(String)) }
            attr_reader :updated_at

            sig { params(updated_at: String).void }
            attr_writer :updated_at

            # Body of a channel event: where one of the customer's channels stands in
            # provisioning and compliance. Delivered when a milestone moves — a registration
            # filed, a verdict returned, a resubmission asked for, a sender gone live — so a
            # customer's own onboarding UI does not have to poll GET /v3/channels.
            #
            # The subject is one item, never the account. A customer's "SMS channel" has no
            # status; a market does. Country, NumberType and SenderValue name which one, so a
            # customer terminating only to Kosovo never receives an event about US 10DLC.
            #
            # Status is the stable half of the contract. It is the same four-value set GET
            # /v3/channels publishes, computed through the same code, so an event and a read
            # of the same market cannot disagree. A subscriber that reads nothing but the
            # status and the subject fields is a correct subscriber. The sub-type on the
            # envelope names the specific milestone and is additive — that vocabulary comes
            # from registries and carriers, which are parties Sent does not control.
            #
            # Status means provisioning and compliance are complete, not that a send will
            # succeed right now. An account can be suspended, or a destination blocked by a
            # routing rule, without either showing up here. Those are separate surfaces and
            # deliberately not modelled on this payload.
            sig do
              params(
                country: String,
                account_id: String,
                channel: String,
                number_type: T.nilable(String),
                reason: T.nilable(String),
                sender_value: T.nilable(String),
                status: String,
                updated_at: String
              ).returns(T.attached_class)
            end
            def self.new(
              # The market's destination country as an ISO 3166-1 alpha-2 code, for example XK.
              # Always present, and the property that identifies this payload among the
              # delivered envelopes — see DeliveredWebhookEvents. Every event in this family
              # reports one market, and a market has a country.
              country:,
              # The account whose market this is, named as on every other family. When an
              # organization receives an event for one of its sender profiles this is the
              # profile, so a reseller compares it with its own id and anything different is one
              # of its profiles.
              account_id: nil,
              # The channel this market belongs to: sms, whatsapp, or rcs. Never sent — that
              # value belongs to message events, where it names the smart-routing brand rather
              # than a channel that can be provisioned.
              channel: nil,
              # The kind of sender the market uses, for example TEN_DLC, LOCAL, or ALPHANUMERIC.
              # Omitted when the subject has no sender type of its own.
              number_type: nil,
              # Why the market reached this state, when a reason was given — a correction
              # explained, or a campaign lapse. Free text, passed through from the registry or
              # carrier that wrote it, so treat it as a message to show a human rather than a
              # value to branch on.
              reason: nil,
              # The sender itself — a number in E.164, or an alphanumeric sender ID.
              #
              # Always present, and null until a sender exists. The key is on every delivery so
              # a subscriber reads one shape rather than branching on whether the field arrived
              # — the same choice template_id makes on the message payload.
              #
              # It can carry a value at any point in the lifecycle, not only once the market is
              # live: a number ordered and not yet active at the carrier is already known during
              # PROVISIONING, and an alphanumeric sender the customer chose themselves is known
              # before anything is filed. It is null while the market is still waiting on a
              # number, which for a US 10DLC registration is every event up to
              # channel.activated.
              sender_value: nil,
              # Where the market stands: PENDING_REVIEW, ACTION_NEEDED, PROVISIONING, ACTIVE or
              # INACTIVE. PENDING_REVIEW means a registry or a carrier holds it and the wait is
              # theirs; ACTION_NEEDED means it is yours; PROVISIONING means the verdict is in
              # and Sent is acquiring the sender; INACTIVE means it had a working sender and no
              # longer does.
              #
              # Each event name is the transition into one of these, but the two are separate
              # fields and may legitimately differ. A resubmission filed against a market whose
              # sender is already live is channel.submitted carrying ACTIVE: a correction is
              # with the registry and the sender keeps working. Read both.
              status: nil,
              # When the transition happened, in UTC (yyyy-MM-ddTHH:mm:ssZ).
              updated_at: nil
            )
            end

            sig do
              override.returns(
                {
                  country: String,
                  account_id: String,
                  channel: String,
                  number_type: T.nilable(String),
                  reason: T.nilable(String),
                  sender_value: T.nilable(String),
                  status: String,
                  updated_at: String
                }
              )
            end
            def to_hash
            end
          end
        end

        class SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload,
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

          # Body of a contact.opt_in, contact.opt_out or contact.help event. Delivered when
          # a contact signals a consent change or asks for help.
          #
          # These events state the signal outright, so you do not have to recognise keywords
          # in the text of a message.received event. They also cover cases that produce no
          # inbound message at all, such as a network handling an opt-out on your behalf.
          #
          # Fields are ordered identity → resulting state → provenance → join key. Nothing
          # here restates the envelope: which of the three signals occurred is the
          # envelope's event, and when it was emitted is its timestamp. Retries carry the
          # same X-Webhook-Event-ID header, which is what to deduplicate on.
          sig do
            returns(
              T.nilable(
                Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::Payload
              )
            )
          end
          attr_reader :payload

          sig do
            params(
              payload:
                T.nilable(
                  Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::Payload::OrHash
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
                  Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::Payload::OrHash
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
            # Body of a contact.opt_in, contact.opt_out or contact.help event. Delivered when
            # a contact signals a consent change or asks for help.
            #
            # These events state the signal outright, so you do not have to recognise keywords
            # in the text of a message.received event. They also cover cases that produce no
            # inbound message at all, such as a network handling an opt-out on your behalf.
            #
            # Fields are ordered identity → resulting state → provenance → join key. Nothing
            # here restates the envelope: which of the three signals occurred is the
            # envelope's event, and when it was emitted is its timestamp. Retries carry the
            # same X-Webhook-Event-ID header, which is what to deduplicate on.
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
                    Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::Payload
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
                  Sentdm::Models::WebhookListEventsResponse::EventData::SentDmServicesCommonServicesWebhooksContractsWebhookEventOfContactWebhookPayload::Payload,
                  Sentdm::Internal::AnyHash
                )
              end

            # Whether the contact is opted out after this signal — the state to write to your
            # own record. Same meaning as opt_out on the contact resource. On contact.help
            # this reports the contact's existing state, which help does not change.
            #
            # Two signals from the same contact can arrive out of order, because each one is
            # queued on its own rather than against the contact. Compare the envelope's
            # timestamp before you overwrite a newer state with an older one. That timestamp
            # is second-precision, so treat two signals stamped in the same second as
            # unordered and read the contact resource to settle them.
            sig { returns(T::Boolean) }
            attr_accessor :opt_out

            # How the signal reached us. INBOUND_KEYWORD means the contact sent a message
            # whose text matched one of the keywords; PROVIDER_SIGNAL means the network
            # reported it. A provider signal usually carries no message_id or text, so read
            # both for null rather than inferring them from this field.
            sig { returns(String) }
            attr_accessor :source

            # The account the contact belongs to. Present so one endpoint can serve several
            # accounts.
            sig { returns(T.nilable(String)) }
            attr_reader :account_id

            sig { params(account_id: String).void }
            attr_writer :account_id

            # The channel the signal arrived on, for example sms or whatsapp.
            sig { returns(T.nilable(String)) }
            attr_reader :channel

            sig { params(channel: String).void }
            attr_writer :channel

            # The contact who raised the signal. Always populated, including for contact.help
            # from a number you have not messaged before — the contact is created if it does
            # not exist yet, so this identifier is always resolvable against the contacts API.
            sig { returns(T.nilable(String)) }
            attr_reader :contact_id

            sig { params(contact_id: String).void }
            attr_writer :contact_id

            # The inbound message that carried the signal, matching message_id on the
            # corresponding message.received event so the two can be joined.
            #
            # Sent as null when the signal did not arrive as a message — for example when a
            # network processed an opt-out on your behalf — and also when the message belongs
            # to a different account than this event, which can happen on a shared WhatsApp
            # number. The field is always present, so read it and check for null rather than
            # checking whether the key exists.
            sig { returns(T.nilable(String)) }
            attr_accessor :message_id

            # The contact's number in E.164 format. Same value as phone_number on the contact
            # resource.
            sig { returns(T.nilable(String)) }
            attr_reader :phone_number

            sig { params(phone_number: String).void }
            attr_writer :phone_number

            # The text the contact sent, for example STOP or UNSUBSCRIBE. Sent as null when
            # the signal did not arrive as text. The field is always present, so read it and
            # check for null rather than checking whether the key exists.
            sig { returns(T.nilable(String)) }
            attr_accessor :text

            # Body of a contact.opt_in, contact.opt_out or contact.help event. Delivered when
            # a contact signals a consent change or asks for help.
            #
            # These events state the signal outright, so you do not have to recognise keywords
            # in the text of a message.received event. They also cover cases that produce no
            # inbound message at all, such as a network handling an opt-out on your behalf.
            #
            # Fields are ordered identity → resulting state → provenance → join key. Nothing
            # here restates the envelope: which of the three signals occurred is the
            # envelope's event, and when it was emitted is its timestamp. Retries carry the
            # same X-Webhook-Event-ID header, which is what to deduplicate on.
            sig do
              params(
                opt_out: T::Boolean,
                source: String,
                account_id: String,
                channel: String,
                contact_id: String,
                message_id: T.nilable(String),
                phone_number: String,
                text: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Whether the contact is opted out after this signal — the state to write to your
              # own record. Same meaning as opt_out on the contact resource. On contact.help
              # this reports the contact's existing state, which help does not change.
              #
              # Two signals from the same contact can arrive out of order, because each one is
              # queued on its own rather than against the contact. Compare the envelope's
              # timestamp before you overwrite a newer state with an older one. That timestamp
              # is second-precision, so treat two signals stamped in the same second as
              # unordered and read the contact resource to settle them.
              opt_out:,
              # How the signal reached us. INBOUND_KEYWORD means the contact sent a message
              # whose text matched one of the keywords; PROVIDER_SIGNAL means the network
              # reported it. A provider signal usually carries no message_id or text, so read
              # both for null rather than inferring them from this field.
              source:,
              # The account the contact belongs to. Present so one endpoint can serve several
              # accounts.
              account_id: nil,
              # The channel the signal arrived on, for example sms or whatsapp.
              channel: nil,
              # The contact who raised the signal. Always populated, including for contact.help
              # from a number you have not messaged before — the contact is created if it does
              # not exist yet, so this identifier is always resolvable against the contacts API.
              contact_id: nil,
              # The inbound message that carried the signal, matching message_id on the
              # corresponding message.received event so the two can be joined.
              #
              # Sent as null when the signal did not arrive as a message — for example when a
              # network processed an opt-out on your behalf — and also when the message belongs
              # to a different account than this event, which can happen on a shared WhatsApp
              # number. The field is always present, so read it and check for null rather than
              # checking whether the key exists.
              message_id: nil,
              # The contact's number in E.164 format. Same value as phone_number on the contact
              # resource.
              phone_number: nil,
              # The text the contact sent, for example STOP or UNSUBSCRIBE. Sent as null when
              # the signal did not arrive as text. The field is always present, so read it and
              # check for null rather than checking whether the key exists.
              text: nil
            )
            end

            sig do
              override.returns(
                {
                  opt_out: T::Boolean,
                  source: String,
                  account_id: String,
                  channel: String,
                  contact_id: String,
                  message_id: T.nilable(String),
                  phone_number: String,
                  text: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
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
