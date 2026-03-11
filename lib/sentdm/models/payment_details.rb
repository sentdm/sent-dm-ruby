# frozen_string_literal: true

module Sentdm
  module Models
    class PaymentDetails < Sentdm::Internal::Type::BaseModel
      # @!attribute card_number
      #   Card number (digits only, 13–19 characters)
      #
      #   @return [String]
      required :card_number, String

      # @!attribute cvc
      #   Card security code (3–4 digits)
      #
      #   @return [String]
      required :cvc, String

      # @!attribute expiry
      #   Card expiry date in MM/YY format (e.g. "09/27")
      #
      #   @return [String]
      required :expiry, String

      # @!attribute zip_code
      #   Billing ZIP / postal code associated with the card
      #
      #   @return [String]
      required :zip_code, String

      # @!method initialize(card_number:, cvc:, expiry:, zip_code:)
      #   Payment card details for a profile. Accepted when billing_model is "profile" or
      #   "profile_and_organization". These details are not stored on our servers and will
      #   be forwarded to the payment processor.
      #
      #   @param card_number [String] Card number (digits only, 13–19 characters)
      #
      #   @param cvc [String] Card security code (3–4 digits)
      #
      #   @param expiry [String] Card expiry date in MM/YY format (e.g. "09/27")
      #
      #   @param zip_code [String] Billing ZIP / postal code associated with the card
    end
  end
end
