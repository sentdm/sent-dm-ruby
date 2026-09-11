# typed: strong

module Sentdm
  module Models
    class BillingContactInfo < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::BillingContactInfo, Sentdm::Internal::AnyHash)
        end

      # Email address where invoices will be sent (required)
      sig { returns(String) }
      attr_accessor :email

      # Full name of the billing contact or company (required)
      sig { returns(String) }
      attr_accessor :name

      # Billing address (optional). Free-form text including street, city, state, postal
      # code, and country.
      sig { returns(T.nilable(String)) }
      attr_accessor :address

      # Phone number for the billing contact (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :phone

      # Billing contact information for a profile. Required when billing_model is
      # "profile" or "profile_and_organization".
      sig do
        params(
          email: String,
          name: String,
          address: T.nilable(String),
          phone: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Email address where invoices will be sent (required)
        email:,
        # Full name of the billing contact or company (required)
        name:,
        # Billing address (optional). Free-form text including street, city, state, postal
        # code, and country.
        address: nil,
        # Phone number for the billing contact (optional)
        phone: nil
      )
      end

      sig do
        override.returns(
          {
            email: String,
            name: String,
            address: T.nilable(String),
            phone: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
