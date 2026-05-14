# typed: strong

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateButtonProps < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::SentDmServicesCommonContractsPocOsTemplateButtonProps,
            Sentdm::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :active_for

      sig { returns(String) }
      attr_accessor :country_code

      sig { returns(String) }
      attr_accessor :offer_code

      sig { returns(String) }
      attr_accessor :phone_number

      sig { returns(String) }
      attr_accessor :quick_reply_type

      sig { returns(String) }
      attr_accessor :text

      sig { returns(String) }
      attr_accessor :url

      sig { returns(String) }
      attr_accessor :url_type

      sig { returns(T.nilable(String)) }
      attr_accessor :autofill_text

      sig { returns(T.nilable(String)) }
      attr_accessor :otp_type

      sig { returns(T.nilable(String)) }
      attr_accessor :package_name

      sig { returns(T.nilable(String)) }
      attr_accessor :signature_hash

      sig do
        params(
          active_for: Integer,
          country_code: String,
          offer_code: String,
          phone_number: String,
          quick_reply_type: String,
          text: String,
          url: String,
          url_type: String,
          autofill_text: T.nilable(String),
          otp_type: T.nilable(String),
          package_name: T.nilable(String),
          signature_hash: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        active_for:,
        country_code:,
        offer_code:,
        phone_number:,
        quick_reply_type:,
        text:,
        url:,
        url_type:,
        autofill_text: nil,
        otp_type: nil,
        package_name: nil,
        signature_hash: nil
      )
      end

      sig do
        override.returns(
          {
            active_for: Integer,
            country_code: String,
            offer_code: String,
            phone_number: String,
            quick_reply_type: String,
            text: String,
            url: String,
            url_type: String,
            autofill_text: T.nilable(String),
            otp_type: T.nilable(String),
            package_name: T.nilable(String),
            signature_hash: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
