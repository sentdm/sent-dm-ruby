# typed: strong

module Sentdm
  module Models
    class TemplateMmsBodyContent < Sentdm::Models::TemplateBodyContent
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateMmsBodyContent, Sentdm::Internal::AnyHash)
        end

      # Attachments carried by every send on this template, in order. A per-send
      # media_urls on the request replaces this list rather than adding to it, so a
      # template can hold a default creative and a caller can still send something
      # recipient-specific.
      sig { returns(T.nilable(T::Array[Sentdm::TemplateMediaItem])) }
      attr_accessor :media

      # MMS subject line. Optional — most handsets render it above the body, some ignore
      # it entirely. Deliberately its own field rather than riding TemplateHeader: the
      # header is authored once and shared across every channel, and carries Meta's
      # 60-character cap plus its no-newline, no-emoji text rules, none of which
      # describe an MMS subject.
      sig { returns(T.nilable(String)) }
      attr_accessor :subject

      # MMS-specific body content.
      #
      # Why MMS needs its own type when the other channels share one: it is the only
      # channel with a subject line and the only one with attachments. Every other
      # channel's body is text and variables, which is exactly what TemplateBodyContent
      # already is. Putting Subject and Media on the shared type instead would give sms,
      # whatsapp and rcs two members none of them can ever use.
      #
      # Derives from TemplateBodyContent so that every existing consumer of a body slot
      # — MessageUtils.ConvertVariableToReadable,
      # TemplateDefinition.GetRequiredVariables,
      # TemplateDefinitionValidator.ApplyBodyContentRules — reads it with no change. The
      # two extra members are what the MMS strategy and the provider request need on
      # top.
      sig do
        params(
          media: T.nilable(T::Array[Sentdm::TemplateMediaItem::OrHash]),
          subject: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Attachments carried by every send on this template, in order. A per-send
        # media_urls on the request replaces this list rather than adding to it, so a
        # template can hold a default creative and a caller can still send something
        # recipient-specific.
        media: nil,
        # MMS subject line. Optional — most handsets render it above the body, some ignore
        # it entirely. Deliberately its own field rather than riding TemplateHeader: the
        # header is authored once and shared across every channel, and carries Meta's
        # 60-character cap plus its no-newline, no-emoji text rules, none of which
        # describe an MMS subject.
        subject: nil
      )
      end

      sig do
        override.returns(
          {
            media: T.nilable(T::Array[Sentdm::TemplateMediaItem]),
            subject: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
