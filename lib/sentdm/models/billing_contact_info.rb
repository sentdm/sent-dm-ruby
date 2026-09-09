# frozen_string_literal: true

module Sentdm
  module Models
    class BillingContactInfo < Sentdm::Internal::Type::BaseModel
      # @!attribute email
      #   Email address where invoices will be sent (required)
      #
      #   @return [String]
      required :email, String

      # @!attribute name
      #   Full name of the billing contact or company (required)
      #
      #   @return [String]
      required :name, String

      # @!attribute address
      #   Billing address (optional). Free-form text including street, city, state, postal
      #   code, and country.
      #
      #   @return [String, nil]
      optional :address, String, nil?: true

      # @!attribute phone
      #   Phone number for the billing contact (optional)
      #
      #   @return [String, nil]
      optional :phone, String, nil?: true

      # @!method initialize(email:, name:, address: nil, phone: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::BillingContactInfo} for more details.
      #
      #   Billing contact information for a profile. Required when billing_model is
      #   "profile" or "profile_and_organization".
      #
      #   @param email [String] Email address where invoices will be sent (required)
      #
      #   @param name [String] Full name of the billing contact or company (required)
      #
      #   @param address [String, nil] Billing address (optional). Free-form text including street, city, state, postal
      #
      #   @param phone [String, nil] Phone number for the billing contact (optional)
    end
  end
end
