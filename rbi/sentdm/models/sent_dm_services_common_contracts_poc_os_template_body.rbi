# typed: strong

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateBody < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::SentDmServicesCommonContractsPocOsTemplateBody,
            Sentdm::Internal::AnyHash
          )
        end

      # Content that will be used for all channels (SMS and WhatsApp) unless
      # channel-specific content is provided
      sig { returns(T.nilable(Sentdm::TemplateBodyContent)) }
      attr_reader :multi_channel

      sig do
        params(
          multi_channel: T.nilable(Sentdm::TemplateBodyContent::OrHash)
        ).void
      end
      attr_writer :multi_channel

      # SMS-specific content that overrides multi-channel content for SMS messages
      sig { returns(T.nilable(Sentdm::TemplateBodyContent)) }
      attr_reader :sms

      sig { params(sms: T.nilable(Sentdm::TemplateBodyContent::OrHash)).void }
      attr_writer :sms

      # WhatsApp-specific content that overrides multi-channel content for WhatsApp
      # messages
      sig { returns(T.nilable(Sentdm::TemplateBodyContent)) }
      attr_reader :whatsapp

      sig do
        params(whatsapp: T.nilable(Sentdm::TemplateBodyContent::OrHash)).void
      end
      attr_writer :whatsapp

      # Body section of a message template with channel-specific content
      sig do
        params(
          multi_channel: T.nilable(Sentdm::TemplateBodyContent::OrHash),
          sms: T.nilable(Sentdm::TemplateBodyContent::OrHash),
          whatsapp: T.nilable(Sentdm::TemplateBodyContent::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Content that will be used for all channels (SMS and WhatsApp) unless
        # channel-specific content is provided
        multi_channel: nil,
        # SMS-specific content that overrides multi-channel content for SMS messages
        sms: nil,
        # WhatsApp-specific content that overrides multi-channel content for WhatsApp
        # messages
        whatsapp: nil
      )
      end

      sig do
        override.returns(
          {
            multi_channel: T.nilable(Sentdm::TemplateBodyContent),
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
