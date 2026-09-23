# typed: strong

module Sentdm
  module Models
    class TemplateBody < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::TemplateBody, Sentdm::Internal::AnyHash) }

      # MMS-specific content — subject, text and attachments.
      #
      # Like Rcs, an override that cannot stand on its own: a template still needs a
      # MultiChannel body or the Sms + Whatsapp pair to be deliverable at all. Unlike
      # Rcs, it has no fallback at send time — MMS with no media is a more expensive
      # SMS, so a template without this slot is deliberately not MMS-capable and never
      # produces an MMS route candidate.
      sig { returns(T.nilable(Sentdm::TemplateBody::Mms)) }
      attr_reader :mms

      sig { params(mms: T.nilable(Sentdm::TemplateBody::Mms::OrHash)).void }
      attr_writer :mms

      # The shared body, used for every channel. One half of the choice described above.
      sig { returns(T.nilable(Sentdm::TemplateBodyContent)) }
      attr_reader :multi_channel

      sig do
        params(
          multi_channel: T.nilable(Sentdm::TemplateBodyContent::OrHash)
        ).void
      end
      attr_writer :multi_channel

      # RCS-specific copy that overrides the chosen strategy for RCS only. The one true
      # override: optional on top of either strategy, but it cannot be the only body
      # present. Its length cap is the higher one described on Template.
      sig { returns(T.nilable(Sentdm::TemplateBodyContent)) }
      attr_reader :rcs

      sig { params(rcs: T.nilable(Sentdm::TemplateBodyContent::OrHash)).void }
      attr_writer :rcs

      # The SMS body. It does not override multiChannel, it replaces it.
      sig { returns(T.nilable(Sentdm::TemplateBodyContent)) }
      attr_reader :sms

      sig { params(sms: T.nilable(Sentdm::TemplateBodyContent::OrHash)).void }
      attr_writer :sms

      # The WhatsApp body. It does not override multiChannel, it replaces it.
      sig { returns(T.nilable(Sentdm::TemplateBodyContent)) }
      attr_reader :whatsapp

      sig do
        params(whatsapp: T.nilable(Sentdm::TemplateBodyContent::OrHash)).void
      end
      attr_writer :whatsapp

      # Body section of a message template.
      #
      # A body picks one of two authoring strategies, and mixing them is refused
      # (TemplateDefinitionValidator.HaveValidChannelConfiguration): a shared
      # multiChannel body on its own, or an explicit sms + whatsapp pair, both present.
      #
      # multiChannel together with sms or whatsapp is rejected, and so is sms or
      # whatsapp on its own — every template is expected to be deliverable on every
      # channel. rcs is the one true override: it may accompany either strategy to vary
      # the copy, but cannot stand alone.
      sig do
        params(
          mms: T.nilable(Sentdm::TemplateBody::Mms::OrHash),
          multi_channel: T.nilable(Sentdm::TemplateBodyContent::OrHash),
          rcs: T.nilable(Sentdm::TemplateBodyContent::OrHash),
          sms: T.nilable(Sentdm::TemplateBodyContent::OrHash),
          whatsapp: T.nilable(Sentdm::TemplateBodyContent::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # MMS-specific content — subject, text and attachments.
        #
        # Like Rcs, an override that cannot stand on its own: a template still needs a
        # MultiChannel body or the Sms + Whatsapp pair to be deliverable at all. Unlike
        # Rcs, it has no fallback at send time — MMS with no media is a more expensive
        # SMS, so a template without this slot is deliberately not MMS-capable and never
        # produces an MMS route candidate.
        mms: nil,
        # The shared body, used for every channel. One half of the choice described above.
        multi_channel: nil,
        # RCS-specific copy that overrides the chosen strategy for RCS only. The one true
        # override: optional on top of either strategy, but it cannot be the only body
        # present. Its length cap is the higher one described on Template.
        rcs: nil,
        # The SMS body. It does not override multiChannel, it replaces it.
        sms: nil,
        # The WhatsApp body. It does not override multiChannel, it replaces it.
        whatsapp: nil
      )
      end

      sig do
        override.returns(
          {
            mms: T.nilable(Sentdm::TemplateBody::Mms),
            multi_channel: T.nilable(Sentdm::TemplateBodyContent),
            rcs: T.nilable(Sentdm::TemplateBodyContent),
            sms: T.nilable(Sentdm::TemplateBodyContent),
            whatsapp: T.nilable(Sentdm::TemplateBodyContent)
          }
        )
      end
      def to_hash
      end

      class Mms < Sentdm::Models::TemplateBodyContent
        OrHash =
          T.type_alias do
            T.any(Sentdm::TemplateBody::Mms, Sentdm::Internal::AnyHash)
          end

        # Attachments carried by every send on this template, in order. A per-send
        # media_urls on the request replaces this list rather than adding to it, so a
        # template can hold a default creative and a caller can still send something
        # recipient-specific.
        sig { returns(T.nilable(T::Array[Sentdm::TemplateBody::Mms::Media])) }
        attr_accessor :media

        # MMS subject line. Optional — most handsets render it above the body, some ignore
        # it entirely. Deliberately its own field rather than riding TemplateHeader: the
        # header is authored once and shared across every channel, and carries Meta's
        # 60-character cap plus its no-newline, no-emoji text rules, none of which
        # describe an MMS subject.
        sig { returns(T.nilable(String)) }
        attr_accessor :subject

        # MMS-specific content — subject, text and attachments.
        #
        # Like Rcs, an override that cannot stand on its own: a template still needs a
        # MultiChannel body or the Sms + Whatsapp pair to be deliverable at all. Unlike
        # Rcs, it has no fallback at send time — MMS with no media is a more expensive
        # SMS, so a template without this slot is deliberately not MMS-capable and never
        # produces an MMS route candidate.
        sig do
          params(
            media:
              T.nilable(T::Array[Sentdm::TemplateBody::Mms::Media::OrHash]),
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
              media: T.nilable(T::Array[Sentdm::TemplateBody::Mms::Media]),
              subject: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Media < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(Sentdm::TemplateBody::Mms::Media, Sentdm::Internal::AnyHash)
            end

          # One of MmsMediaTypes. Advisory: the carrier reads the Content-Type off the
          # fetched object, not this field. It exists so an authoring UI can render the
          # right preview and so a reviewer can see what was intended.
          sig { returns(T.nilable(String)) }
          attr_accessor :media_type

          # Publicly fetchable https URL. The carrier's MMSC fetches this at send time, so
          # it has to stay reachable and unauthenticated for the life of the send —
          # including retries and a DLQ replay — which is why a presigned URL is not a valid
          # value here.
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          # One attachment on an MMS template body.
          sig do
            params(media_type: T.nilable(String), url: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # One of MmsMediaTypes. Advisory: the carrier reads the Content-Type off the
            # fetched object, not this field. It exists so an authoring UI can render the
            # right preview and so a reviewer can see what was intended.
            media_type: nil,
            # Publicly fetchable https URL. The carrier's MMSC fetches this at send time, so
            # it has to stay reachable and unauthenticated for the life of the send —
            # including retries and a DLQ replay — which is why a presigned URL is not a valid
            # value here.
            url: nil
          )
          end

          sig do
            override.returns({ media_type: T.nilable(String), url: String })
          end
          def to_hash
          end
        end
      end
    end
  end
end
