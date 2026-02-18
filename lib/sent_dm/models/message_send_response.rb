# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Messages#send_
    class MessageSendResponse < SentDm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [SentDm::Models::MessageSendResponse::Data, nil]
      optional :data, -> { SentDm::Models::MessageSendResponse::Data }, nil?: true

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
      #   @param data [SentDm::Models::MessageSendResponse::Data, nil] The response data (null if error)
      #
      #   @param error [SentDm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [SentDm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see SentDm::Models::MessageSendResponse#data
      class Data < SentDm::Internal::Type::BaseModel
        # @!attribute body
        #   Resolved template body text
        #
        #   @return [String, nil]
        optional :body, String, nil?: true

        # @!attribute recipients
        #   Per-recipient message results
        #
        #   @return [Array<SentDm::Models::MessageSendResponse::Data::Recipient>, nil]
        optional :recipients,
                 -> { SentDm::Internal::Type::ArrayOf[SentDm::Models::MessageSendResponse::Data::Recipient] }

        # @!attribute status
        #   Overall request status (e.g. "accepted")
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute template_id
        #   Template ID that was used
        #
        #   @return [String, nil]
        optional :template_id, String

        # @!attribute template_name
        #   Template display name
        #
        #   @return [String, nil]
        optional :template_name, String

        # @!method initialize(body: nil, recipients: nil, status: nil, template_id: nil, template_name: nil)
        #   The response data (null if error)
        #
        #   @param body [String, nil] Resolved template body text
        #
        #   @param recipients [Array<SentDm::Models::MessageSendResponse::Data::Recipient>] Per-recipient message results
        #
        #   @param status [String] Overall request status (e.g. "accepted")
        #
        #   @param template_id [String] Template ID that was used
        #
        #   @param template_name [String] Template display name

        class Recipient < SentDm::Internal::Type::BaseModel
          # @!attribute channel
          #   Channel this message will be sent on (e.g. "sms", "whatsapp"), or null for
          #   auto-detect
          #
          #   @return [String, nil]
          optional :channel, String, nil?: true

          # @!attribute message_id
          #   Unique message identifier for tracking this recipient's message
          #
          #   @return [String, nil]
          optional :message_id, String

          # @!attribute to
          #   Phone number in E.164 format
          #
          #   @return [String, nil]
          optional :to, String

          # @!method initialize(channel: nil, message_id: nil, to: nil)
          #   Some parameter documentations has been truncated, see
          #   {SentDm::Models::MessageSendResponse::Data::Recipient} for more details.
          #
          #   Per-recipient result in the send message response
          #
          #   @param channel [String, nil] Channel this message will be sent on (e.g. "sms", "whatsapp"), or null for auto-
          #
          #   @param message_id [String] Unique message identifier for tracking this recipient's message
          #
          #   @param to [String] Phone number in E.164 format
        end
      end
    end
  end
end
