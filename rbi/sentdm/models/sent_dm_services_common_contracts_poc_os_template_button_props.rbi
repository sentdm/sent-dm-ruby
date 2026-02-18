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

      sig { returns(T.nilable(Integer)) }
      attr_accessor :active_for

      sig { returns(T.nilable(String)) }
      attr_accessor :autofill_text

      sig { returns(T.nilable(String)) }
      attr_accessor :country_code

      sig { returns(T.nilable(String)) }
      attr_accessor :offer_code

      sig { returns(T.nilable(String)) }
      attr_accessor :otp_type

      sig { returns(T.nilable(String)) }
      attr_accessor :package_name

      sig { returns(T.nilable(String)) }
      attr_accessor :phone_number

      sig { returns(T.nilable(String)) }
      attr_accessor :quick_reply_type

      sig { returns(T.nilable(String)) }
      attr_accessor :signature_hash

      sig { returns(T.nilable(String)) }
      attr_accessor :text

      sig { returns(T.nilable(String)) }
      attr_accessor :url

      sig { returns(T.nilable(String)) }
      attr_accessor :url_type

      sig do
        params(
          active_for: T.nilable(Integer),
          autofill_text: T.nilable(String),
          country_code: T.nilable(String),
          offer_code: T.nilable(String),
          otp_type: T.nilable(String),
          package_name: T.nilable(String),
          phone_number: T.nilable(String),
          quick_reply_type: T.nilable(String),
          signature_hash: T.nilable(String),
          text: T.nilable(String),
          url: T.nilable(String),
          url_type: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        active_for: nil,
        autofill_text: nil,
        country_code: nil,
        offer_code: nil,
        otp_type: nil,
        package_name: nil,
        phone_number: nil,
        quick_reply_type: nil,
        signature_hash: nil,
        text: nil,
        url: nil,
        url_type: nil
      )
      end

      sig do
        override.returns(
          {
            active_for: T.nilable(Integer),
            autofill_text: T.nilable(String),
            country_code: T.nilable(String),
            offer_code: T.nilable(String),
            otp_type: T.nilable(String),
            package_name: T.nilable(String),
            phone_number: T.nilable(String),
            quick_reply_type: T.nilable(String),
            signature_hash: T.nilable(String),
            text: T.nilable(String),
            url: T.nilable(String),
            url_type: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
