# frozen_string_literal: true

module Sentdm
  module Models
    class Message < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute active_contact_price
      #
      #   @return [Float, nil]
      optional :active_contact_price, Float, nil?: true

      # @!attribute channel
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute contact_id
      #
      #   @return [String, nil]
      optional :contact_id, String

      # @!attribute created_at
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute customer_id
      #
      #   @return [String, nil]
      optional :customer_id, String

      # @!attribute direction
      #
      #   @return [String, nil]
      optional :direction, String

      # @!attribute events
      #
      #   @return [Array<Sentdm::Models::MessageStatusEvent>, nil]
      optional :events, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::MessageStatusEvent] }, nil?: true

      # @!attribute message_body
      #   Structured message body format for database storage. Preserves channel-specific
      #   components (header, header media, body, footer, buttons, MMS subject and media).
      #
      #   Persisted as the messageBody jsonb column on Messages. Every write path goes
      #   through MessageUtils.MessageBodyJsonOptions, which writes nulls, so the envelope
      #   shape is stable regardless of channel or status. Anything that rebuilds this
      #   object field by field — the four IMessageBodyStrategy implementations and
      #   MessageUtils.BuildSegmentBody — has to carry every member, or that member is
      #   silently dropped on whichever path forgot it.
      #
      #   @return [Sentdm::Models::MessageBody, nil]
      optional :message_body, -> { Sentdm::MessageBody }, nil?: true

      # @!attribute phone
      #
      #   @return [String, nil]
      optional :phone, String

      # @!attribute phone_international
      #
      #   @return [String, nil]
      optional :phone_international, String

      # @!attribute price
      #
      #   @return [Float, nil]
      optional :price, Float, nil?: true

      # @!attribute reason
      #   A human-readable sentence for reason_code, for example "Insufficient balance".
      #   Omitted whenever reason_code is.
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute reason_code
      #   Why the message is at its current status, as a stable platform code such as
      #   DELIVERY_007, BUSINESS_003 or DELIVERY_003. Present when the current status is
      #   FAILED, FILTERED or BLOCKED and the lifecycle was loaded; omitted otherwise.
      #   Switch on this rather than on reason: the code is stable, the wording may be
      #   improved. It is the platform's classification of the outcome, never a carrier or
      #   vendor code.
      #
      #   @return [String, nil]
      optional :reason_code, String, nil?: true

      # @!attribute region_code
      #
      #   @return [String, nil]
      optional :region_code, String

      # @!attribute status
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute template_category
      #
      #   @return [String, nil]
      optional :template_category, String, nil?: true

      # @!attribute template_id
      #
      #   @return [String, nil]
      optional :template_id, String, nil?: true

      # @!attribute template_name
      #
      #   @return [String, nil]
      optional :template_name, String, nil?: true

      # @!method initialize(id: nil, active_contact_price: nil, channel: nil, contact_id: nil, created_at: nil, customer_id: nil, direction: nil, events: nil, message_body: nil, phone: nil, phone_international: nil, price: nil, reason: nil, reason_code: nil, region_code: nil, status: nil, template_category: nil, template_id: nil, template_name: nil)
      #   Some parameter documentations has been truncated, see {Sentdm::Models::Message}
      #   for more details.
      #
      #   Message response for v3 API — same shape as v2 with snake_case JSON conventions.
      #
      #   The shape of a message that was sent immediately: it never has a scheduled_at
      #   key. A message that is or was held for a later instant is a
      #   ScheduledMessageResponse, and the endpoint decides which of the two to answer
      #   with. From always returns this type.
      #
      #   @param id [String]
      #
      #   @param active_contact_price [Float, nil]
      #
      #   @param channel [String]
      #
      #   @param contact_id [String]
      #
      #   @param created_at [Time]
      #
      #   @param customer_id [String]
      #
      #   @param direction [String]
      #
      #   @param events [Array<Sentdm::Models::MessageStatusEvent>, nil]
      #
      #   @param message_body [Sentdm::Models::MessageBody, nil] Structured message body format for database storage.
      #
      #   @param phone [String]
      #
      #   @param phone_international [String]
      #
      #   @param price [Float, nil]
      #
      #   @param reason [String, nil] A human-readable sentence for reason_code, for example "Insufficient balance". O
      #
      #   @param reason_code [String, nil] Why the message is at its current status, as a stable platform code such as
      #
      #   @param region_code [String]
      #
      #   @param status [String]
      #
      #   @param template_category [String, nil]
      #
      #   @param template_id [String, nil]
      #
      #   @param template_name [String, nil]
    end
  end
end
