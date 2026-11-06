# frozen_string_literal: true

module Sentdm
  module Models
    class MessageRecipient < Sentdm::Internal::Type::BaseModel
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
      #   {Sentdm::Models::MessageRecipient} for more details.
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
