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
      #   @return [Sentdm::Models::ErrorDetail, nil]
      optional :error, -> { Sentdm::ErrorDetail }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::APIMeta, nil]
      optional :meta, -> { Sentdm::APIMeta }

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
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
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
    end
  end
end
