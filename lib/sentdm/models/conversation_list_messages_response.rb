# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Conversations#list_messages
    class ConversationListMessagesResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   A paginated list of messages — used by both conversation read endpoints.
      #
      #   @return [Sentdm::Models::ConversationListMessagesResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ConversationListMessagesResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ConversationListMessagesResponse::Error, nil]
      optional :error, -> { Sentdm::Models::ConversationListMessagesResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::ConversationListMessagesResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::ConversationListMessagesResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ConversationListMessagesResponse::Data, nil] A paginated list of messages — used by both conversation read endpoints.
      #
      #   @param error [Sentdm::Models::ConversationListMessagesResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::ConversationListMessagesResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ConversationListMessagesResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute messages
        #   The messages on this page.
        #
        #   @return [Array<Sentdm::Models::ConversationListMessagesResponse::Data::Message>, nil]
        optional :messages,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::ConversationListMessagesResponse::Data::Message] }

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::ConversationListMessagesResponse::Data::Pagination, nil]
        optional :pagination, -> { Sentdm::Models::ConversationListMessagesResponse::Data::Pagination }

        # @!method initialize(messages: nil, pagination: nil)
        #   A paginated list of messages — used by both conversation read endpoints.
        #
        #   @param messages [Array<Sentdm::Models::ConversationListMessagesResponse::Data::Message>] The messages on this page.
        #
        #   @param pagination [Sentdm::Models::ConversationListMessagesResponse::Data::Pagination] Pagination metadata for list responses

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
          #   @return [Array<Sentdm::Models::ConversationListMessagesResponse::Data::Message::Event>, nil]
          optional :events,
                   -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::ConversationListMessagesResponse::Data::Message::Event] },
                   nil?: true

          # @!attribute message_body
          #   Structured message body format for database storage. Preserves channel-specific
          #   components (header, body, footer, buttons).
          #
          #   @return [Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody, nil]
          optional :message_body,
                   -> { Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody },
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
          #   {Sentdm::Models::ConversationListMessagesResponse::Data::Message} for more
          #   details.
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
          #   @param events [Array<Sentdm::Models::ConversationListMessagesResponse::Data::Message::Event>, nil]
          #
          #   @param message_body [Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody, nil] Structured message body format for database storage.
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

          # @see Sentdm::Models::ConversationListMessagesResponse::Data::Message#message_body
          class MessageBody < Sentdm::Internal::Type::BaseModel
            # @!attribute buttons
            #
            #   @return [Array<Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody::Button>, nil]
            optional :buttons,
                     -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody::Button] },
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
            #   @param buttons [Array<Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody::Button>, nil]
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

        # @see Sentdm::Models::ConversationListMessagesResponse::Data#pagination
        class Pagination < Sentdm::Internal::Type::BaseModel
          # @!attribute cursors
          #   @deprecated
          #
          #   Cursor-based pagination. Never populated — see Cursors.
          #
          #   @return [Sentdm::Models::ConversationListMessagesResponse::Data::Pagination::Cursors, nil]
          optional :cursors,
                   -> { Sentdm::Models::ConversationListMessagesResponse::Data::Pagination::Cursors },
                   nil?: true

          # @!attribute has_more
          #   Whether there are more pages after this one
          #
          #   @return [Boolean, nil]
          optional :has_more, Sentdm::Internal::Type::Boolean

          # @!attribute page
          #   Current page number (1-indexed)
          #
          #   @return [Integer, nil]
          optional :page, Integer

          # @!attribute page_size
          #   Number of items per page
          #
          #   @return [Integer, nil]
          optional :page_size, Integer

          # @!attribute total_count
          #   Total number of items across all pages
          #
          #   @return [Integer, nil]
          optional :total_count, Integer

          # @!attribute total_pages
          #   Total number of pages
          #
          #   @return [Integer, nil]
          optional :total_pages, Integer

          # @!method initialize(cursors: nil, has_more: nil, page: nil, page_size: nil, total_count: nil, total_pages: nil)
          #   Pagination metadata for list responses
          #
          #   @param cursors [Sentdm::Models::ConversationListMessagesResponse::Data::Pagination::Cursors, nil] Cursor-based pagination. Never populated — see Cursors.
          #
          #   @param has_more [Boolean] Whether there are more pages after this one
          #
          #   @param page [Integer] Current page number (1-indexed)
          #
          #   @param page_size [Integer] Number of items per page
          #
          #   @param total_count [Integer] Total number of items across all pages
          #
          #   @param total_pages [Integer] Total number of pages

          # @deprecated
          #
          # @see Sentdm::Models::ConversationListMessagesResponse::Data::Pagination#cursors
          class Cursors < Sentdm::Internal::Type::BaseModel
            # @!attribute after
            #   Cursor to fetch the next page.
            #
            #   @return [String, nil]
            optional :after, String, nil?: true

            # @!attribute before
            #   Cursor to fetch the previous page.
            #
            #   @return [String, nil]
            optional :before, String, nil?: true

            # @!method initialize(after: nil, before: nil)
            #   Cursor-based pagination. Never populated — see Cursors.
            #
            #   @param after [String, nil] Cursor to fetch the next page.
            #
            #   @param before [String, nil] Cursor to fetch the previous page.
          end
        end
      end

      # @see Sentdm::Models::ConversationListMessagesResponse#error
      class Error < Sentdm::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @return [String, nil]
        optional :code, String

        # @!attribute details
        #   Additional validation error details (field-level errors)
        #
        #   @return [Hash{Symbol=>Array<String>}, nil]
        optional :details, Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]], nil?: true

        # @!attribute doc_url
        #   URL to documentation about this error
        #
        #   @return [String, nil]
        optional :doc_url, String, nil?: true

        # @!attribute message
        #   Human-readable error message
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(code: nil, details: nil, doc_url: nil, message: nil)
        #   Error information
        #
        #   @param code [String] Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @param details [Hash{Symbol=>Array<String>}, nil] Additional validation error details (field-level errors)
        #
        #   @param doc_url [String, nil] URL to documentation about this error
        #
        #   @param message [String] Human-readable error message
      end

      # @see Sentdm::Models::ConversationListMessagesResponse#meta
      class Meta < Sentdm::Internal::Type::BaseModel
        # @!attribute request_id
        #   Unique identifier for this request (for tracing and support)
        #
        #   @return [String, nil]
        optional :request_id, String

        # @!attribute timestamp
        #   Server timestamp when the response was generated
        #
        #   @return [Time, nil]
        optional :timestamp, Time

        # @!attribute version
        #   API version used for this request
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(request_id: nil, timestamp: nil, version: nil)
        #   Request and response metadata
        #
        #   @param request_id [String] Unique identifier for this request (for tracing and support)
        #
        #   @param timestamp [Time] Server timestamp when the response was generated
        #
        #   @param version [String] API version used for this request
      end
    end
  end
end
