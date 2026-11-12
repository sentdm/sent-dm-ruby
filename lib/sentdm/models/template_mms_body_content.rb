# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateMmsBodyContent < Sentdm::Models::TemplateBodyContent
      # @!attribute media
      #   Attachments carried by every send on this template, in order. A per-send
      #   media_urls on the request replaces this list rather than adding to it, so a
      #   template can hold a default creative and a caller can still send something
      #   recipient-specific.
      #
      #   @return [Array<Sentdm::Models::TemplateMediaItem>, nil]
      optional :media, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateMediaItem] }, nil?: true

      # @!attribute subject
      #   MMS subject line. Optional — most handsets render it above the body, some ignore
      #   it entirely. Deliberately its own field rather than riding TemplateHeader: the
      #   header is authored once and shared across every channel, and carries Meta's
      #   60-character cap plus its no-newline, no-emoji text rules, none of which
      #   describe an MMS subject.
      #
      #   @return [String, nil]
      optional :subject, String, nil?: true

      # @!method initialize(media: nil, subject: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateMmsBodyContent} for more details.
      #
      #   MMS-specific body content.
      #
      #   Why MMS needs its own type when the other channels share one: it is the only
      #   channel with a subject line and the only one with attachments. Every other
      #   channel's body is text and variables, which is exactly what TemplateBodyContent
      #   already is. Putting Subject and Media on the shared type instead would give sms,
      #   whatsapp and rcs two members none of them can ever use.
      #
      #   Derives from TemplateBodyContent so that every existing consumer of a body slot
      #   — MessageUtils.ConvertVariableToReadable,
      #   TemplateDefinition.GetRequiredVariables,
      #   TemplateDefinitionValidator.ApplyBodyContentRules — reads it with no change. The
      #   two extra members are what the MMS strategy and the provider request need on
      #   top.
      #
      #   @param media [Array<Sentdm::Models::TemplateMediaItem>, nil] Attachments carried by every send on this template, in order. A per-send media_u
      #
      #   @param subject [String, nil] MMS subject line. Optional — most handsets render it above the body, some ignore
    end
  end
end
