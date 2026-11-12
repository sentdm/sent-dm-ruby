# typed: strong

module Sentdm
  module Models
    class MessageActivity < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageActivity, Sentdm::Internal::AnyHash)
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

      # Sender phone number for this activity (the customer's sending number for
      # outbound, the external sender for inbound). Null when not reported by the
      # provider.
      sig { returns(T.nilable(String)) }
      attr_accessor :from

      # Channel cost for this activity (e.g., SMS/WhatsApp provider cost), formatted to
      # 4 decimal places.
      sig { returns(T.nilable(String)) }
      attr_accessor :price

      # A human-readable sentence for reason_code, for example "The recipient is not
      # registered on this channel" Omitted whenever reason_code is.
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      # Why the message reached this status, as a stable platform code such as
      # DELIVERY_007 or BUSINESS_003. Present on FAILED, FILTERED and BLOCKED
      # activities; omitted on every status that needs no explanation. Switch on this
      # rather than on reason: the code is stable, the wording may be improved. Same
      # wire name and vocabulary as on the message and the webhook.
      sig { returns(T.nilable(String)) }
      attr_accessor :reason_code

      # SCHEDULED and CANCELLED activities only, in UTC: on a SCHEDULED entry, when the
      # held message will be released for delivery; on a CANCELLED entry, the instant
      # that was called off. Same wire name as on the send response, the message and the
      # webhook. Omitted on every other activity. A message that quiet hours moved at
      # release has two SCHEDULED entries, each carrying the instant as it stood at that
      # moment.
      sig { returns(T.nilable(Time)) }
      attr_accessor :scheduled_at

      # Activity status. Outbound: QUEUED, PROCESSED, ROUTED, SCHEDULED, SENT,
      # DELIVERED, READ, FAILED. Inbound (from contact): RECEIVED (terminal).
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # When this activity occurred
      sig { returns(T.nilable(Time)) }
      attr_reader :timestamp

      sig { params(timestamp: Time).void }
      attr_writer :timestamp

      # A single message activity event for v3 API.
      #
      # The activity list mixes statuses, so unlike a message it is one shape rather
      # than two: a SCHEDULED entry carries scheduled_at, and every other entry has no
      # such key.
      sig do
        params(
          active_contact_price: T.nilable(String),
          description: String,
          from: T.nilable(String),
          price: T.nilable(String),
          reason: T.nilable(String),
          reason_code: T.nilable(String),
          scheduled_at: T.nilable(Time),
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
        # Sender phone number for this activity (the customer's sending number for
        # outbound, the external sender for inbound). Null when not reported by the
        # provider.
        from: nil,
        # Channel cost for this activity (e.g., SMS/WhatsApp provider cost), formatted to
        # 4 decimal places.
        price: nil,
        # A human-readable sentence for reason_code, for example "The recipient is not
        # registered on this channel" Omitted whenever reason_code is.
        reason: nil,
        # Why the message reached this status, as a stable platform code such as
        # DELIVERY_007 or BUSINESS_003. Present on FAILED, FILTERED and BLOCKED
        # activities; omitted on every status that needs no explanation. Switch on this
        # rather than on reason: the code is stable, the wording may be improved. Same
        # wire name and vocabulary as on the message and the webhook.
        reason_code: nil,
        # SCHEDULED and CANCELLED activities only, in UTC: on a SCHEDULED entry, when the
        # held message will be released for delivery; on a CANCELLED entry, the instant
        # that was called off. Same wire name as on the send response, the message and the
        # webhook. Omitted on every other activity. A message that quiet hours moved at
        # release has two SCHEDULED entries, each carrying the instant as it stood at that
        # moment.
        scheduled_at: nil,
        # Activity status. Outbound: QUEUED, PROCESSED, ROUTED, SCHEDULED, SENT,
        # DELIVERED, READ, FAILED. Inbound (from contact): RECEIVED (terminal).
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
            from: T.nilable(String),
            price: T.nilable(String),
            reason: T.nilable(String),
            reason_code: T.nilable(String),
            scheduled_at: T.nilable(Time),
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
