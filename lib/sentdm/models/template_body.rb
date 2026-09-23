# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateBody < Sentdm::Internal::Type::BaseModel
      # @!attribute mms
      #   MMS-specific content — subject, text and attachments.
      #
      #   Like Rcs, an override that cannot stand on its own: a template still needs a
      #   MultiChannel body or the Sms + Whatsapp pair to be deliverable at all. Unlike
      #   Rcs, it has no fallback at send time — MMS with no media is a more expensive
      #   SMS, so a template without this slot is deliberately not MMS-capable and never
      #   produces an MMS route candidate.
      #
      #   @return [Sentdm::Models::TemplateBody::Mms, nil]
      optional :mms, -> { Sentdm::TemplateBody::Mms }, nil?: true

      # @!attribute multi_channel
      #   The shared body, used for every channel. One half of the choice described above.
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :multi_channel, -> { Sentdm::TemplateBodyContent }, api_name: :multiChannel, nil?: true

      # @!attribute rcs
      #   RCS-specific copy that overrides the chosen strategy for RCS only. The one true
      #   override: optional on top of either strategy, but it cannot be the only body
      #   present. Its length cap is the higher one described on Template.
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :rcs, -> { Sentdm::TemplateBodyContent }, nil?: true

      # @!attribute sms
      #   The SMS body. It does not override multiChannel, it replaces it.
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :sms, -> { Sentdm::TemplateBodyContent }, nil?: true

      # @!attribute whatsapp
      #   The WhatsApp body. It does not override multiChannel, it replaces it.
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :whatsapp, -> { Sentdm::TemplateBodyContent }, nil?: true

      # @!method initialize(mms: nil, multi_channel: nil, rcs: nil, sms: nil, whatsapp: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateBody} for more details.
      #
      #   Body section of a message template.
      #
      #   A body picks one of two authoring strategies, and mixing them is refused
      #   (TemplateDefinitionValidator.HaveValidChannelConfiguration): a shared
      #   multiChannel body on its own, or an explicit sms + whatsapp pair, both present.
      #
      #   multiChannel together with sms or whatsapp is rejected, and so is sms or
      #   whatsapp on its own — every template is expected to be deliverable on every
      #   channel. rcs is the one true override: it may accompany either strategy to vary
      #   the copy, but cannot stand alone.
      #
      #   @param mms [Sentdm::Models::TemplateBody::Mms, nil] MMS-specific content — subject, text and attachments.
      #
      #   @param multi_channel [Sentdm::Models::TemplateBodyContent, nil] The shared body, used for every channel. One half of the choice described above.
      #
      #   @param rcs [Sentdm::Models::TemplateBodyContent, nil] RCS-specific copy that overrides the chosen strategy for RCS only. The one true
      #
      #   @param sms [Sentdm::Models::TemplateBodyContent, nil] The SMS body. It does not override multiChannel, it replaces it.
      #
      #   @param whatsapp [Sentdm::Models::TemplateBodyContent, nil] The WhatsApp body. It does not override multiChannel, it replaces it.

      # @see Sentdm::Models::TemplateBody#mms
      class Mms < Sentdm::Models::TemplateBodyContent
        # @!attribute media
        #   Attachments carried by every send on this template, in order. A per-send
        #   media_urls on the request replaces this list rather than adding to it, so a
        #   template can hold a default creative and a caller can still send something
        #   recipient-specific.
        #
        #   @return [Array<Sentdm::Models::TemplateBody::Mms::Media>, nil]
        optional :media, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateBody::Mms::Media] }, nil?: true

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
        #   {Sentdm::Models::TemplateBody::Mms} for more details.
        #
        #   MMS-specific content — subject, text and attachments.
        #
        #   Like Rcs, an override that cannot stand on its own: a template still needs a
        #   MultiChannel body or the Sms + Whatsapp pair to be deliverable at all. Unlike
        #   Rcs, it has no fallback at send time — MMS with no media is a more expensive
        #   SMS, so a template without this slot is deliberately not MMS-capable and never
        #   produces an MMS route candidate.
        #
        #   @param media [Array<Sentdm::Models::TemplateBody::Mms::Media>, nil] Attachments carried by every send on this template, in order. A per-send media_u
        #
        #   @param subject [String, nil] MMS subject line. Optional — most handsets render it above the body, some ignore

        class Media < Sentdm::Internal::Type::BaseModel
          # @!attribute media_type
          #   One of MmsMediaTypes. Advisory: the carrier reads the Content-Type off the
          #   fetched object, not this field. It exists so an authoring UI can render the
          #   right preview and so a reviewer can see what was intended.
          #
          #   @return [String, nil]
          optional :media_type, String, api_name: :mediaType, nil?: true

          # @!attribute url
          #   Publicly fetchable https URL. The carrier's MMSC fetches this at send time, so
          #   it has to stay reachable and unauthenticated for the life of the send —
          #   including retries and a DLQ replay — which is why a presigned URL is not a valid
          #   value here.
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(media_type: nil, url: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::TemplateBody::Mms::Media} for more details.
          #
          #   One attachment on an MMS template body.
          #
          #   @param media_type [String, nil] One of MmsMediaTypes. Advisory: the carrier reads the Content-Type off the
          #
          #   @param url [String] Publicly fetchable https URL. The carrier's MMSC fetches this at send time, so i
        end
      end
    end
  end
end
