# frozen_string_literal: true

module Sentdm
  module Models
    class AccountWhatsappChannel < Sentdm::Internal::Type::BaseModel
      # @!attribute business_name
      #   WhatsApp Business display name
      #
      #   @return [String, nil]
      optional :business_name, String, nil?: true

      # @!attribute configured
      #   Whether WhatsApp is configured for this account
      #
      #   @return [Boolean, nil]
      optional :configured, Sentdm::Internal::Type::Boolean

      # @!attribute phone_number
      #   WhatsApp phone number in E.164 format
      #
      #   @return [String, nil]
      optional :phone_number, String, nil?: true

      # @!method initialize(business_name: nil, configured: nil, phone_number: nil)
      #   WhatsApp Business channel configuration. When configured, includes the WhatsApp
      #   phone number and business name.
      #
      #   @param business_name [String, nil] WhatsApp Business display name
      #
      #   @param configured [Boolean] Whether WhatsApp is configured for this account
      #
      #   @param phone_number [String, nil] WhatsApp phone number in E.164 format
    end
  end
end
