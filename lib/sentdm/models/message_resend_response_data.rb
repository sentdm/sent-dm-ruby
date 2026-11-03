# frozen_string_literal: true

module Sentdm
  module Models
    class MessageResendResponseData < Sentdm::Internal::Type::BaseModel
      # @!attribute recipients
      #
      #   @return [Array<Sentdm::Models::MessageResendResponseData::Recipient>, nil]
      optional :recipients, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::MessageResendResponseData::Recipient] }

      # @!attribute status
      #   QUEUED: the batch is accepted. A request that carried scheduled_at is QUEUED
      #   here too; each message moves to SCHEDULED once it is held, as GET
      #   /v3/messages/{id} and the message.scheduled webhook report.
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
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageResendResponseData} for more details.
      #
      #   The result of a multi-recipient send.
      #
      #   Declared here rather than in the service layer. POST /v3/messages used to
      #   publish MessageSendResult — a type in Common.Services.Messaging.Contracts — so
      #   the public contract was whatever the send service happened to return, and
      #   changing that service for an internal reason changed the API. The service keeps
      #   its result; this is what a caller sees, and the mapping between them is a
      #   decision the endpoint makes.
      #
      #   The shape of an immediate send: it never has a scheduled_at key. A send that
      #   carried scheduled_at is a ScheduledSendMessageResponse, and the endpoint decides
      #   which of the two to answer with. From always returns this type.
      #
      #   @param recipients [Array<Sentdm::Models::MessageResendResponseData::Recipient>]
      #
      #   @param status [String] QUEUED: the batch is accepted. A request that carried scheduled_at is QUEUED
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
        #   {Sentdm::Models::MessageResendResponseData::Recipient} for more details.
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
