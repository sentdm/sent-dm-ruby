# typed: strong

module Sentdm
  module Models
    class Message < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::Message, Sentdm::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(Float)) }
      attr_accessor :active_contact_price

      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      sig { returns(T.nilable(String)) }
      attr_reader :contact_id

      sig { params(contact_id: String).void }
      attr_writer :contact_id

      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      sig { returns(T.nilable(String)) }
      attr_reader :customer_id

      sig { params(customer_id: String).void }
      attr_writer :customer_id

      sig { returns(T.nilable(String)) }
      attr_reader :direction

      sig { params(direction: String).void }
      attr_writer :direction

      sig { returns(T.nilable(T::Array[Sentdm::MessageStatusEvent])) }
      attr_accessor :events

      # Structured message body format for database storage. Preserves channel-specific
      # components (header, header media, body, footer, buttons, MMS subject and media).
      #
      # Persisted as the messageBody jsonb column on Messages. Every write path goes
      # through MessageUtils.MessageBodyJsonOptions, which writes nulls, so the envelope
      # shape is stable regardless of channel or status. Anything that rebuilds this
      # object field by field — the four IMessageBodyStrategy implementations and
      # MessageUtils.BuildSegmentBody — has to carry every member, or that member is
      # silently dropped on whichever path forgot it.
      sig { returns(T.nilable(Sentdm::MessageBody)) }
      attr_reader :message_body

      sig { params(message_body: T.nilable(Sentdm::MessageBody::OrHash)).void }
      attr_writer :message_body

      sig { returns(T.nilable(String)) }
      attr_reader :phone

      sig { params(phone: String).void }
      attr_writer :phone

      sig { returns(T.nilable(String)) }
      attr_reader :phone_international

      sig { params(phone_international: String).void }
      attr_writer :phone_international

      sig { returns(T.nilable(Float)) }
      attr_accessor :price

      # A human-readable sentence for reason_code, for example "Insufficient balance".
      # Omitted whenever reason_code is.
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      # Why the message is at its current status, as a stable platform code such as
      # DELIVERY_007, BUSINESS_003 or DELIVERY_003. Present when the current status is
      # FAILED, FILTERED or BLOCKED and the lifecycle was loaded; omitted otherwise.
      # Switch on this rather than on reason: the code is stable, the wording may be
      # improved. It is the platform's classification of the outcome, never a carrier or
      # vendor code.
      sig { returns(T.nilable(String)) }
      attr_accessor :reason_code

      sig { returns(T.nilable(String)) }
      attr_reader :region_code

      sig { params(region_code: String).void }
      attr_writer :region_code

      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_accessor :template_category

      sig { returns(T.nilable(String)) }
      attr_accessor :template_id

      sig { returns(T.nilable(String)) }
      attr_accessor :template_name

      # Message response for v3 API — same shape as v2 with snake_case JSON conventions.
      #
      # The shape of a message that was sent immediately: it never has a scheduled_at
      # key. A message that is or was held for a later instant is a
      # ScheduledMessageResponse, and the endpoint decides which of the two to answer
      # with. From always returns this type.
      sig do
        params(
          id: String,
          active_contact_price: T.nilable(Float),
          channel: String,
          contact_id: String,
          created_at: Time,
          customer_id: String,
          direction: String,
          events: T.nilable(T::Array[Sentdm::MessageStatusEvent::OrHash]),
          message_body: T.nilable(Sentdm::MessageBody::OrHash),
          phone: String,
          phone_international: String,
          price: T.nilable(Float),
          reason: T.nilable(String),
          reason_code: T.nilable(String),
          region_code: String,
          status: String,
          template_category: T.nilable(String),
          template_id: T.nilable(String),
          template_name: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        id: nil,
        active_contact_price: nil,
        channel: nil,
        contact_id: nil,
        created_at: nil,
        customer_id: nil,
        direction: nil,
        events: nil,
        # Structured message body format for database storage. Preserves channel-specific
        # components (header, header media, body, footer, buttons, MMS subject and media).
        #
        # Persisted as the messageBody jsonb column on Messages. Every write path goes
        # through MessageUtils.MessageBodyJsonOptions, which writes nulls, so the envelope
        # shape is stable regardless of channel or status. Anything that rebuilds this
        # object field by field — the four IMessageBodyStrategy implementations and
        # MessageUtils.BuildSegmentBody — has to carry every member, or that member is
        # silently dropped on whichever path forgot it.
        message_body: nil,
        phone: nil,
        phone_international: nil,
        price: nil,
        # A human-readable sentence for reason_code, for example "Insufficient balance".
        # Omitted whenever reason_code is.
        reason: nil,
        # Why the message is at its current status, as a stable platform code such as
        # DELIVERY_007, BUSINESS_003 or DELIVERY_003. Present when the current status is
        # FAILED, FILTERED or BLOCKED and the lifecycle was loaded; omitted otherwise.
        # Switch on this rather than on reason: the code is stable, the wording may be
        # improved. It is the platform's classification of the outcome, never a carrier or
        # vendor code.
        reason_code: nil,
        region_code: nil,
        status: nil,
        template_category: nil,
        template_id: nil,
        template_name: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            active_contact_price: T.nilable(Float),
            channel: String,
            contact_id: String,
            created_at: Time,
            customer_id: String,
            direction: String,
            events: T.nilable(T::Array[Sentdm::MessageStatusEvent]),
            message_body: T.nilable(Sentdm::MessageBody),
            phone: String,
            phone_international: String,
            price: T.nilable(Float),
            reason: T.nilable(String),
            reason_code: T.nilable(String),
            region_code: String,
            status: String,
            template_category: T.nilable(String),
            template_id: T.nilable(String),
            template_name: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
