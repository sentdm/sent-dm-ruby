# typed: strong

module Sentdm
  module Models
    class SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandContactInfo < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandContactInfo,
            Sentdm::Internal::AnyHash
          )
        end

      # Primary contact name (required)
      sig { returns(String) }
      attr_accessor :name

      # Business/brand name
      sig { returns(T.nilable(String)) }
      attr_accessor :business_name

      # Contact email address
      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # Contact phone number in E.164 format
      sig { returns(T.nilable(String)) }
      attr_accessor :phone

      # Contact phone country code (e.g., "1" for US)
      sig { returns(T.nilable(String)) }
      attr_accessor :phone_country_code

      # Contact's role in the business
      sig { returns(T.nilable(String)) }
      attr_accessor :role

      # Contact information for brand KYC
      sig do
        params(
          name: String,
          business_name: T.nilable(String),
          email: T.nilable(String),
          phone: T.nilable(String),
          phone_country_code: T.nilable(String),
          role: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Primary contact name (required)
        name:,
        # Business/brand name
        business_name: nil,
        # Contact email address
        email: nil,
        # Contact phone number in E.164 format
        phone: nil,
        # Contact phone country code (e.g., "1" for US)
        phone_country_code: nil,
        # Contact's role in the business
        role: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            business_name: T.nilable(String),
            email: T.nilable(String),
            phone: T.nilable(String),
            phone_country_code: T.nilable(String),
            role: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
