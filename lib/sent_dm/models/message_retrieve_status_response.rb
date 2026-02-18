# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Messages#retrieve_status
    class MessageRetrieveStatusResponse < SentDm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [SentDm::Models::MessageRetrieveStatusResponse::Data, nil]
      optional :data, -> { SentDm::Models::MessageRetrieveStatusResponse::Data }, nil?: true

      # @!attribute error
      #   Error details (null if successful)
      #
      #   @return [SentDm::Models::APIError, nil]
      optional :error, -> { SentDm::APIError }, nil?: true

      # @!attribute meta
      #   Metadata about the request and response
      #
      #   @return [SentDm::Models::APIMeta, nil]
      optional :meta, -> { SentDm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, SentDm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [SentDm::Models::MessageRetrieveStatusResponse::Data, nil] The response data (null if error)
      #
      #   @param error [SentDm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [SentDm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see SentDm::Models::MessageRetrieveStatusResponse#data
      class Data < SentDm::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

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

        # @!attribute events
        #
        #   @return [Array<SentDm::Models::MessageRetrieveStatusResponse::Data::Event>, nil]
        optional :events,
                 -> { SentDm::Internal::Type::ArrayOf[SentDm::Models::MessageRetrieveStatusResponse::Data::Event] },
                 nil?: true

        # @!attribute message_body
        #   Structured message body format for database storage. Preserves channel-specific
        #   components (header, body, footer, buttons).
        #
        #   @return [SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody, nil]
        optional :message_body,
                 -> { SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody },
                 nil?: true

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
        optional :template_category, String

        # @!attribute template_id
        #
        #   @return [String, nil]
        optional :template_id, String, nil?: true

        # @!attribute template_name
        #
        #   @return [String, nil]
        optional :template_name, String

        # @!method initialize(id: nil, channel: nil, contact_id: nil, created_at: nil, customer_id: nil, events: nil, message_body: nil, phone: nil, phone_international: nil, price: nil, region_code: nil, status: nil, template_category: nil, template_id: nil, template_name: nil)
        #   Some parameter documentations has been truncated, see
        #   {SentDm::Models::MessageRetrieveStatusResponse::Data} for more details.
        #
        #   The response data (null if error)
        #
        #   @param id [String]
        #
        #   @param channel [String]
        #
        #   @param contact_id [String]
        #
        #   @param created_at [Time]
        #
        #   @param customer_id [String]
        #
        #   @param events [Array<SentDm::Models::MessageRetrieveStatusResponse::Data::Event>, nil]
        #
        #   @param message_body [SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody, nil] Structured message body format for database storage.
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
        #   @param template_category [String]
        #
        #   @param template_id [String, nil]
        #
        #   @param template_name [String]

        class Event < SentDm::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String, nil?: true

          # @!attribute status
          #
          #   @return [String, nil]
          optional :status, String

          # @!attribute timestamp
          #
          #   @return [Time, nil]
          optional :timestamp, Time

          # @!method initialize(description: nil, status: nil, timestamp: nil)
          #   Represents a status change event in a message's lifecycle (v3)
          #
          #   @param description [String, nil]
          #   @param status [String]
          #   @param timestamp [Time]
        end

        # @see SentDm::Models::MessageRetrieveStatusResponse::Data#message_body
        class MessageBody < SentDm::Internal::Type::BaseModel
          # @!attribute buttons
          #
          #   @return [Array<SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button>, nil]
          optional :buttons,
                   -> { SentDm::Internal::Type::ArrayOf[SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button] },
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
          #   @param buttons [Array<SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button>, nil]
          #   @param content [String]
          #   @param footer [String, nil]
          #   @param header [String, nil]

          class Button < SentDm::Internal::Type::BaseModel
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
end
