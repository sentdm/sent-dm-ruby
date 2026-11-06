# typed: strong

module Sentdm
  module Models
    class MessageBody < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::MessageBody, Sentdm::Internal::AnyHash) }

      sig { returns(T.nilable(T::Array[Sentdm::MessageButton])) }
      attr_accessor :buttons

      sig { returns(T.nilable(String)) }
      attr_reader :content

      sig { params(content: String).void }
      attr_writer :content

      sig { returns(T.nilable(String)) }
      attr_accessor :footer

      sig { returns(T.nilable(String)) }
      attr_accessor :header

      # The media asset that rode a message's header, recorded as sent.
      sig { returns(T.nilable(Sentdm::MessageHeaderMedia)) }
      attr_reader :header_media

      sig do
        params(header_media: T.nilable(Sentdm::MessageHeaderMedia::OrHash)).void
      end
      attr_writer :header_media

      # MMS attachments, as the publicly fetchable URLs handed to the carrier. Null on
      # every other channel.
      #
      # Persisted rather than derived because a resend and a curfew release rebuild the
      # send from the stored row — MessageReplayCommandBuilder reads templateId and
      # templateVariables and nothing else — so media that lives only on the original
      # request would silently turn a replayed MMS into a text message.
      sig { returns(T.nilable(T::Array[Sentdm::MessageMedia])) }
      attr_accessor :media

      # MMS subject line. Null on every other channel.
      sig { returns(T.nilable(String)) }
      attr_accessor :subject

      # Structured message body format for database storage. Preserves channel-specific
      # components (header, header media, body, footer, buttons, MMS subject and media).
      #
      # Persisted as the messageBody jsonb column on Messages. Every write path goes
      # through MessageUtils.MessageBodyJsonOptions, which writes nulls, so the envelope
      # shape is stable regardless of channel or status. Anything that rebuilds this
      # object field by field — the four IMessageBodyStrategy implementations and
      # MessageUtils.BuildSegmentBody — has to carry every member, or that member is
      # silently dropped on whichever path forgot it.
      sig do
        params(
          buttons: T.nilable(T::Array[Sentdm::MessageButton::OrHash]),
          content: String,
          footer: T.nilable(String),
          header: T.nilable(String),
          header_media: T.nilable(Sentdm::MessageHeaderMedia::OrHash),
          media: T.nilable(T::Array[Sentdm::MessageMedia::OrHash]),
          subject: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        buttons: nil,
        content: nil,
        footer: nil,
        header: nil,
        # The media asset that rode a message's header, recorded as sent.
        header_media: nil,
        # MMS attachments, as the publicly fetchable URLs handed to the carrier. Null on
        # every other channel.
        #
        # Persisted rather than derived because a resend and a curfew release rebuild the
        # send from the stored row — MessageReplayCommandBuilder reads templateId and
        # templateVariables and nothing else — so media that lives only on the original
        # request would silently turn a replayed MMS into a text message.
        media: nil,
        # MMS subject line. Null on every other channel.
        subject: nil
      )
      end

      sig do
        override.returns(
          {
            buttons: T.nilable(T::Array[Sentdm::MessageButton]),
            content: String,
            footer: T.nilable(String),
            header: T.nilable(String),
            header_media: T.nilable(Sentdm::MessageHeaderMedia),
            media: T.nilable(T::Array[Sentdm::MessageMedia]),
            subject: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
