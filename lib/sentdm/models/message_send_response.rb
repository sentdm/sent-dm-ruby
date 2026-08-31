# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#send_
    class MessageSendResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The result of a multi-recipient send.
      #
      #   Declared here rather than in the service layer. POST /v3/messages used to
      #   publish MessageSendResult — a type in Common.Services.Messaging.Contracts — so
      #   the public contract was whatever the send service happened to return, and
      #   changing that service for an internal reason changed the API. The service keeps
      #   its result; this is what a caller sees, and the mapping between them is a
      #   decision the endpoint makes.
      #
      #   The wire is unchanged by the move: same names, same values.
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
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageSendResponse} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::MessageSendResponse::Data, nil] The result of a multi-recipient send.
      #
      #   @param error [Sentdm::Models::MessageSendResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::MessageSendResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::MessageSendResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute recipients
        #
        #   @return [Array<Sentdm::Models::MessageSendResponse::Data::Recipient>, nil]
        optional :recipients,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::MessageSendResponse::Data::Recipient] }

        # @!attribute status
        #   Overall status — QUEUED once the batch is accepted for delivery.
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute template_id
        #
        #   @return [String, nil]
        optional :template_id, String

        # @!attribute template_name
        #
        #   @return [String, nil]
        optional :template_name, String

        # @!method initialize(recipients: nil, status: nil, template_id: nil, template_name: nil)
        #   The result of a multi-recipient send.
        #
        #   Declared here rather than in the service layer. POST /v3/messages used to
        #   publish MessageSendResult — a type in Common.Services.Messaging.Contracts — so
        #   the public contract was whatever the send service happened to return, and
        #   changing that service for an internal reason changed the API. The service keeps
        #   its result; this is what a caller sees, and the mapping between them is a
        #   decision the endpoint makes.
        #
        #   The wire is unchanged by the move: same names, same values.
        #
        #   @param recipients [Array<Sentdm::Models::MessageSendResponse::Data::Recipient>]
        #
        #   @param status [String] Overall status — QUEUED once the batch is accepted for delivery.
        #
        #   @param template_id [String]
        #
        #   @param template_name [String]

        class Recipient < Sentdm::Internal::Type::BaseModel
          # @!attribute body
          #   Resolved template body for this recipient's channel, or null when the channel is
          #   auto-detected.
          #
          #   @return [String, nil]
          optional :body, String, nil?: true

          # @!attribute channel
          #   Channel this message will be sent on — sms, whatsapp — or null to auto-detect.
          #
          #   @return [String, nil]
          optional :channel, String, nil?: true

          # @!attribute message_id
          #   Identifier for tracking this recipient's message.
          #
          #   @return [String, nil]
          optional :message_id, String

          # @!attribute to
          #   Phone number in E.164 format.
          #
          #   @return [String, nil]
          optional :to, String

          # @!method initialize(body: nil, channel: nil, message_id: nil, to: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::MessageSendResponse::Data::Recipient} for more details.
          #
          #   What one recipient of a send got, as the API reports it.
          #
          #   @param body [String, nil] Resolved template body for this recipient's channel, or null when the channel is
          #
          #   @param channel [String, nil] Channel this message will be sent on — sms, whatsapp — or null to auto-detect.
          #
          #   @param message_id [String] Identifier for tracking this recipient's message.
          #
          #   @param to [String] Phone number in E.164 format.
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
