# typed: strong

module Sentdm
  module Models
    class AccountChannels < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::AccountChannels, Sentdm::Internal::AnyHash)
        end

      # RCS channel configuration. When configured, includes the RCS phone number.
      sig { returns(T.nilable(Sentdm::AccountRcsChannel)) }
      attr_reader :rcs

      sig { params(rcs: Sentdm::AccountRcsChannel::OrHash).void }
      attr_writer :rcs

      # SMS channel configuration. When configured, includes the sending phone number.
      sig { returns(T.nilable(Sentdm::AccountSMSChannel)) }
      attr_reader :sms

      sig { params(sms: Sentdm::AccountSMSChannel::OrHash).void }
      attr_writer :sms

      # WhatsApp Business channel configuration. When configured, includes the WhatsApp
      # phone number and business name.
      sig { returns(T.nilable(Sentdm::AccountWhatsappChannel)) }
      attr_reader :whatsapp

      sig { params(whatsapp: Sentdm::AccountWhatsappChannel::OrHash).void }
      attr_writer :whatsapp

      # Messaging channel configuration. All three channels are always present. Each
      # channel has a "configured" flag; configured channels expose additional details.
      sig do
        params(
          rcs: Sentdm::AccountRcsChannel::OrHash,
          sms: Sentdm::AccountSMSChannel::OrHash,
          whatsapp: Sentdm::AccountWhatsappChannel::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # RCS channel configuration. When configured, includes the RCS phone number.
        rcs: nil,
        # SMS channel configuration. When configured, includes the sending phone number.
        sms: nil,
        # WhatsApp Business channel configuration. When configured, includes the WhatsApp
        # phone number and business name.
        whatsapp: nil
      )
      end

      sig do
        override.returns(
          {
            rcs: Sentdm::AccountRcsChannel,
            sms: Sentdm::AccountSMSChannel,
            whatsapp: Sentdm::AccountWhatsappChannel
          }
        )
      end
      def to_hash
      end
    end
  end
end
