# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#send_
    class MessageSendResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Response for the multi-recipient send message endpoint
      #
      #   @return [Sentdm::Models::MessageSendResponse::Data, nil]
      optional :data, -> { Sentdm::Models::MessageSendResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::MessageSendResponse::Error, nil]
      optional :error, -> { Sentdm::Models::MessageSendResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::MessageSendResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::MessageSendResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::MessageSendResponse::Data, nil] Response for the multi-recipient send message endpoint
      #
      #   @param error [Sentdm::Models::MessageSendResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::MessageSendResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::MessageSendResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute recipients
        #   Per-recipient message results
        #
        #   @return [Array<Sentdm::Models::MessageSendResponse::Data::Recipient>, nil]
        optional :recipients,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::MessageSendResponse::Data::Recipient] }

        # @!attribute status
        #   Overall request status: "QUEUED" when the batch has been accepted and published
        #   to Kafka.
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

        # @!method initialize(recipients: nil, status: nil, template_id: nil, template_name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::MessageSendResponse::Data} for more details.
        #
        #   Response for the multi-recipient send message endpoint
        #
        #   @param recipients [Array<Sentdm::Models::MessageSendResponse::Data::Recipient>] Per-recipient message results
        #
        #   @param status [String] Overall request status: "QUEUED" when the batch has been accepted and published
        #
        #   @param template_id [String] Template ID that was used
        #
        #   @param template_name [String] Template display name

        class Recipient < Sentdm::Internal::Type::BaseModel
          # @!attribute body
          #   Resolved template body text for this recipient's channel, or null for
          #   auto-detect
          #
          #   @return [String, nil]
          optional :body, String, nil?: true

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

          # @!method initialize(body: nil, channel: nil, message_id: nil, to: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::MessageSendResponse::Data::Recipient} for more details.
          #
          #   Per-recipient result in the send message response
          #
          #   @param body [String, nil] Resolved template body text for this recipient's channel, or null for auto-detec
          #
          #   @param channel [String, nil] Channel this message will be sent on (e.g. "sms", "whatsapp"), or null for auto-
          #
          #   @param message_id [String] Unique message identifier for tracking this recipient's message
          #
          #   @param to [String] Phone number in E.164 format
        end
      end

      # @see Sentdm::Models::MessageSendResponse#error
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

      # @see Sentdm::Models::MessageSendResponse#meta
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
