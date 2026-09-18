# typed: strong

module Sentdm
  module Models
    class TemplateBody < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::TemplateBody, Sentdm::Internal::AnyHash) }

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
          multi_channel: T.nilable(Sentdm::TemplateBodyContent::OrHash),
          rcs: T.nilable(Sentdm::TemplateBodyContent::OrHash),
          sms: T.nilable(Sentdm::TemplateBodyContent::OrHash),
          whatsapp: T.nilable(Sentdm::TemplateBodyContent::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
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
            multi_channel: T.nilable(Sentdm::TemplateBodyContent),
            rcs: T.nilable(Sentdm::TemplateBodyContent),
            sms: T.nilable(Sentdm::TemplateBodyContent),
            whatsapp: T.nilable(Sentdm::TemplateBodyContent)
          }
        )
      end
      def to_hash
      end
    end
  end
end
