# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#retrieve
    class MessageRetrieveResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   The unique identifier of the message
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute channel
      #   The messaging channel used (e.g., SMS, WhatsApp)
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute contact_id
      #   The unique identifier of the contact who received the message
      #
      #   @return [String, nil]
      optional :contact_id, String, api_name: :contactId

      # @!attribute corrected_price
      #   The final price charged for sending this message
      #
      #   @return [Float, nil]
      optional :corrected_price, Float, api_name: :correctedPrice, nil?: true

      # @!attribute created_at
      #   The date and time when the message was created
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute customer_id
      #   The unique identifier of the customer who sent the message
      #
      #   @return [String, nil]
      optional :customer_id, String, api_name: :customerId

      # @!attribute events
      #   A chronological list of status change events for this message. Each event
      #   includes a status and timestamp, following industry standards (Twilio, SendGrid,
      #   Mailgun). Events are ordered chronologically from oldest to newest.
      #
      #   @return [Array<Sentdm::Models::MessageRetrieveResponse::Event>, nil]
      optional :events,
               -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::MessageRetrieveResponse::Event] },
               nil?: true

      # @!attribute message_body
      #   The message body content with variables substituted
      #
      #   @return [Sentdm::Models::MessageRetrieveResponse::MessageBody, nil]
      optional :message_body,
               -> { Sentdm::Models::MessageRetrieveResponse::MessageBody },
               api_name: :messageBody,
               nil?: true

      # @!attribute phone_number
      #   The phone number of the recipient (E.164 format)
      #
      #   @return [String, nil]
      optional :phone_number, String, api_name: :phoneNumber

      # @!attribute phone_number_international
      #   The phone number in international format
      #
      #   @return [String, nil]
      optional :phone_number_international, String, api_name: :phoneNumberInternational

      # @!attribute region_code
      #   The region code of the phone number (e.g., US, GB, DE)
      #
      #   @return [String, nil]
      optional :region_code, String, api_name: :regionCode

      # @!attribute status
      #   The delivery status of the message (e.g., sent, delivered, failed, read)
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute template_category
      #   The category of the template (e.g., MARKETING, UTILITY, AUTHENTICATION)
      #
      #   @return [String, nil]
      optional :template_category, String, api_name: :templateCategory

      # @!attribute template_id
      #   The unique identifier of the template used for this message (null if no template
      #   was used)
      #
      #   @return [String, nil]
      optional :template_id, String, api_name: :templateId, nil?: true

      # @!attribute template_name
      #   The display name of the template
      #
      #   @return [String, nil]
      optional :template_name, String, api_name: :templateName

      # @!method initialize(id: nil, channel: nil, contact_id: nil, corrected_price: nil, created_at: nil, customer_id: nil, events: nil, message_body: nil, phone_number: nil, phone_number_international: nil, region_code: nil, status: nil, template_category: nil, template_id: nil, template_name: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageRetrieveResponse} for more details.
      #
      #   Represents a sent message with comprehensive delivery and template information
      #   (v2)
      #
      #   @param id [String] The unique identifier of the message
      #
      #   @param channel [String] The messaging channel used (e.g., SMS, WhatsApp)
      #
      #   @param contact_id [String] The unique identifier of the contact who received the message
      #
      #   @param corrected_price [Float, nil] The final price charged for sending this message
      #
      #   @param created_at [Time] The date and time when the message was created
      #
      #   @param customer_id [String] The unique identifier of the customer who sent the message
      #
      #   @param events [Array<Sentdm::Models::MessageRetrieveResponse::Event>, nil] A chronological list of status change events for this message.
      #
      #   @param message_body [Sentdm::Models::MessageRetrieveResponse::MessageBody, nil] The message body content with variables substituted
      #
      #   @param phone_number [String] The phone number of the recipient (E.164 format)
      #
      #   @param phone_number_international [String] The phone number in international format
      #
      #   @param region_code [String] The region code of the phone number (e.g., US, GB, DE)
      #
      #   @param status [String] The delivery status of the message (e.g., sent, delivered, failed, read)
      #
      #   @param template_category [String] The category of the template (e.g., MARKETING, UTILITY, AUTHENTICATION)
      #
      #   @param template_id [String, nil] The unique identifier of the template used for this message (null if no template
      #
      #   @param template_name [String] The display name of the template

      class Event < Sentdm::Internal::Type::BaseModel
        # @!attribute description
        #   Optional human-readable description of the event Useful for error messages or
        #   additional context
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute status
        #   The status of the message at this point in time Examples: "queued", "sent",
        #   "delivered", "read", "failed"
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute timestamp
        #   When this status change occurred (ISO 8601 format)
        #
        #   @return [Time, nil]
        optional :timestamp, Time

        # @!method initialize(description: nil, status: nil, timestamp: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::MessageRetrieveResponse::Event} for more details.
        #
        #   Represents a status change event in a message's lifecycle Follows industry
        #   standards (Twilio, SendGrid, Mailgun pattern)
        #
        #   @param description [String, nil] Optional human-readable description of the event
        #
        #   @param status [String] The status of the message at this point in time
        #
        #   @param timestamp [Time] When this status change occurred (ISO 8601 format)
      end

      # @see Sentdm::Models::MessageRetrieveResponse#message_body
      class MessageBody < Sentdm::Internal::Type::BaseModel
        # @!attribute buttons
        #
        #   @return [Array<Sentdm::Models::MessageRetrieveResponse::MessageBody::Button>, nil]
        optional :buttons,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::MessageRetrieveResponse::MessageBody::Button] },
                 nil?: true

        # @!attribute content
        #
        #   @return [String, nil]
        optional :content, String

        # @!attribute footer
        #
        #   @return [String, nil]
        optional :footer, String, nil?: true

        # @!attribute header
        #
        #   @return [String, nil]
        optional :header, String, nil?: true

        # @!method initialize(buttons: nil, content: nil, footer: nil, header: nil)
        #   The message body content with variables substituted
        #
        #   @param buttons [Array<Sentdm::Models::MessageRetrieveResponse::MessageBody::Button>, nil]
        #   @param content [String]
        #   @param footer [String, nil]
        #   @param header [String, nil]

        class Button < Sentdm::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [String, nil]
          optional :type, String

          # @!attribute value
          #
          #   @return [String, nil]
          optional :value, String

          # @!method initialize(type: nil, value: nil)
          #   @param type [String]
          #   @param value [String]
        end
      end
    end
  end
end
