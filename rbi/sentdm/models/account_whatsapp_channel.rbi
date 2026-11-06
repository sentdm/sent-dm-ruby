# typed: strong

module Sentdm
  module Models
    class AccountWhatsappChannel < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::AccountWhatsappChannel, Sentdm::Internal::AnyHash)
        end

      # WhatsApp Business display name
      sig { returns(T.nilable(String)) }
      attr_accessor :business_name

      # Whether WhatsApp is configured for this account
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :configured

      sig { params(configured: T::Boolean).void }
      attr_writer :configured

      # WhatsApp phone number in E.164 format
      sig { returns(T.nilable(String)) }
      attr_accessor :phone_number

      # WhatsApp Business channel configuration. When configured, includes the WhatsApp
      # phone number and business name.
      sig do
        params(
          business_name: T.nilable(String),
          configured: T::Boolean,
          phone_number: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # WhatsApp Business display name
        business_name: nil,
        # Whether WhatsApp is configured for this account
        configured: nil,
        # WhatsApp phone number in E.164 format
        phone_number: nil
      )
      end

      sig do
        override.returns(
          {
            business_name: T.nilable(String),
            configured: T::Boolean,
            phone_number: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
