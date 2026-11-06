# frozen_string_literal: true

module Sentdm
  module Models
    class MessageBody < Sentdm::Internal::Type::BaseModel
      # @!attribute buttons
      #
      #   @return [Array<Sentdm::Models::MessageButton>, nil]
      optional :buttons, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::MessageButton] }, nil?: true

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

      # @!attribute header_media
      #   The media asset that rode a message's header, recorded as sent.
      #
      #   @return [Sentdm::Models::MessageHeaderMedia, nil]
      optional :header_media, -> { Sentdm::MessageHeaderMedia }, api_name: :headerMedia, nil?: true

      # @!attribute media
      #   MMS attachments, as the publicly fetchable URLs handed to the carrier. Null on
      #   every other channel.
      #
      #   Persisted rather than derived because a resend and a curfew release rebuild the
      #   send from the stored row — MessageReplayCommandBuilder reads templateId and
      #   templateVariables and nothing else — so media that lives only on the original
      #   request would silently turn a replayed MMS into a text message.
      #
      #   @return [Array<Sentdm::Models::MessageMedia>, nil]
      optional :media, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::MessageMedia] }, nil?: true

      # @!attribute subject
      #   MMS subject line. Null on every other channel.
      #
      #   @return [String, nil]
      optional :subject, String, nil?: true

      # @!method initialize(buttons: nil, content: nil, footer: nil, header: nil, header_media: nil, media: nil, subject: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageBody} for more details.
      #
      #   Structured message body format for database storage. Preserves channel-specific
      #   components (header, header media, body, footer, buttons, MMS subject and media).
      #
      #   Persisted as the messageBody jsonb column on Messages. Every write path goes
      #   through MessageUtils.MessageBodyJsonOptions, which writes nulls, so the envelope
      #   shape is stable regardless of channel or status. Anything that rebuilds this
      #   object field by field — the four IMessageBodyStrategy implementations and
      #   MessageUtils.BuildSegmentBody — has to carry every member, or that member is
      #   silently dropped on whichever path forgot it.
      #
      #   @param buttons [Array<Sentdm::Models::MessageButton>, nil]
      #
      #   @param content [String]
      #
      #   @param footer [String, nil]
      #
      #   @param header [String, nil]
      #
      #   @param header_media [Sentdm::Models::MessageHeaderMedia, nil] The media asset that rode a message's header, recorded as sent.
      #
      #   @param media [Array<Sentdm::Models::MessageMedia>, nil] MMS attachments, as the publicly fetchable URLs handed to the carrier. Null on e
      #
      #   @param subject [String, nil] MMS subject line. Null on every other channel.
    end
  end
end
