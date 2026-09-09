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
