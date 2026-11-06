# frozen_string_literal: true

module Sentdm
  module Models
    class AccountChannels < Sentdm::Internal::Type::BaseModel
      # @!attribute rcs
      #   RCS channel configuration. When configured, includes the RCS phone number.
      #
      #   @return [Sentdm::Models::AccountRcsChannel, nil]
      optional :rcs, -> { Sentdm::AccountRcsChannel }

      # @!attribute sms
      #   SMS channel configuration. When configured, includes the sending phone number.
      #
      #   @return [Sentdm::Models::AccountSMSChannel, nil]
      optional :sms, -> { Sentdm::AccountSMSChannel }

      # @!attribute whatsapp
      #   WhatsApp Business channel configuration. When configured, includes the WhatsApp
      #   phone number and business name.
      #
      #   @return [Sentdm::Models::AccountWhatsappChannel, nil]
      optional :whatsapp, -> { Sentdm::AccountWhatsappChannel }

      # @!method initialize(rcs: nil, sms: nil, whatsapp: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::AccountChannels} for more details.
      #
      #   Messaging channel configuration. All three channels are always present. Each
      #   channel has a "configured" flag; configured channels expose additional details.
      #
      #   @param rcs [Sentdm::Models::AccountRcsChannel] RCS channel configuration. When configured, includes the RCS phone number.
      #
      #   @param sms [Sentdm::Models::AccountSMSChannel] SMS channel configuration. When configured, includes the sending phone number.
      #
      #   @param whatsapp [Sentdm::Models::AccountWhatsappChannel] WhatsApp Business channel configuration. When configured, includes the WhatsApp
    end
  end
end
