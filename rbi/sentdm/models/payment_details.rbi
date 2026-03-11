# typed: strong

module Sentdm
  module Models
    class PaymentDetails < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::PaymentDetails, Sentdm::Internal::AnyHash)
        end

      # Card number (digits only, 13–19 characters)
      sig { returns(String) }
      attr_accessor :card_number

      # Card security code (3–4 digits)
      sig { returns(String) }
      attr_accessor :cvc

      # Card expiry date in MM/YY format (e.g. "09/27")
      sig { returns(String) }
      attr_accessor :expiry

      # Billing ZIP / postal code associated with the card
      sig { returns(String) }
      attr_accessor :zip_code

      # Payment card details for a profile. Accepted when billing_model is "profile" or
      # "profile_and_organization". These details are not stored on our servers and will
      # be forwarded to the payment processor.
      sig do
        params(
          card_number: String,
          cvc: String,
          expiry: String,
          zip_code: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Card number (digits only, 13–19 characters)
        card_number:,
        # Card security code (3–4 digits)
        cvc:,
        # Card expiry date in MM/YY format (e.g. "09/27")
        expiry:,
        # Billing ZIP / postal code associated with the card
        zip_code:
      )
      end

      sig do
        override.returns(
          { card_number: String, cvc: String, expiry: String, zip_code: String }
        )
      end
      def to_hash
      end
    end
  end
end
