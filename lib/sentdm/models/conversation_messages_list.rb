# frozen_string_literal: true

module Sentdm
  module Models
    class ConversationMessagesList < Sentdm::Internal::Type::BaseModel
      # @!attribute messages
      #   The messages on this page.
      #
      #   @return [Array<Sentdm::Models::ConversationMessagesList::Message>, nil]
      optional :messages, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ConversationMessagesList::Message] }

      # @!attribute pagination
      #   Pagination metadata for list responses
      #
      #   @return [Sentdm::Models::PaginationMeta, nil]
      optional :pagination, -> { Sentdm::PaginationMeta }

      # @!method initialize(messages: nil, pagination: nil)
      #   A paginated list of messages — used by both conversation read endpoints.
      #
      #   @param messages [Array<Sentdm::Models::ConversationMessagesList::Message>] The messages on this page.
      #
      #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses

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
        #   @return [Array<Sentdm::Models::ConversationMessagesList::Message::Event>, nil]
        optional :events,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ConversationMessagesList::Message::Event] },
                 nil?: true

        # @!attribute message_body
        #   Structured message body format for database storage. Preserves channel-specific
        #   components (header, body, footer, buttons).
        #
        #   @return [Sentdm::Models::ConversationMessagesList::Message::MessageBody, nil]
        optional :message_body, -> { Sentdm::ConversationMessagesList::Message::MessageBody }, nil?: true

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

        # @!method initialize(id: nil, active_contact_price: nil, channel: nil, contact_id: nil, created_at: nil, customer_id: nil, direction: nil, events: nil, message_body: nil, phone: nil, phone_international: nil, price: nil, region_code: nil, status: nil, template_category: nil, template_id: nil, template_name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::ConversationMessagesList::Message} for more details.
        #
        #   Message response for v3 API — same shape as v2 with snake_case JSON conventions
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
        #   @param events [Array<Sentdm::Models::ConversationMessagesList::Message::Event>, nil]
        #
        #   @param message_body [Sentdm::Models::ConversationMessagesList::Message::MessageBody, nil] Structured message body format for database storage.
        #
        #   @param phone [String]
        #
        #   @param phone_international [String]
        #
        #   @param price [Float, nil]
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

        class Event < Sentdm::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [String]
          required :status, String

          # @!attribute timestamp
          #
          #   @return [Time]
          required :timestamp, Time

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String, nil?: true

          # @!method initialize(status:, timestamp:, description: nil)
          #   Represents a status change event in a message's lifecycle (v3)
          #
          #   @param status [String]
          #   @param timestamp [Time]
          #   @param description [String, nil]
        end

        # @see Sentdm::Models::ConversationMessagesList::Message#message_body
        class MessageBody < Sentdm::Internal::Type::BaseModel
          # @!attribute buttons
          #
          #   @return [Array<Sentdm::Models::ConversationMessagesList::Message::MessageBody::Button>, nil]
          optional :buttons,
                   -> {
                     Sentdm::Internal::Type::ArrayOf[Sentdm::ConversationMessagesList::Message::MessageBody::Button]
                   },
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
          #   Structured message body format for database storage. Preserves channel-specific
          #   components (header, body, footer, buttons).
          #
          #   @param buttons [Array<Sentdm::Models::ConversationMessagesList::Message::MessageBody::Button>, nil]
          #   @param content [String]
          #   @param footer [String, nil]
          #   @param header [String, nil]

          class Button < Sentdm::Internal::Type::BaseModel
            # @!attribute postback_data
            #
            #   @return [String, nil]
            optional :postback_data, String, api_name: :postbackData, nil?: true

            # @!attribute text
            #
            #   @return [String, nil]
            optional :text, String, nil?: true

            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String

            # @!attribute value
            #
            #   @return [String, nil]
            optional :value, String

            # @!method initialize(postback_data: nil, text: nil, type: nil, value: nil)
            #   @param postback_data [String, nil]
            #   @param text [String, nil]
            #   @param type [String]
            #   @param value [String]
          end
        end
      end
    end
  end
end
