# typed: strong

module Sentdm
  module Models
    class SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandComplianceInfo < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandComplianceInfo,
            Sentdm::Internal::AnyHash
          )
        end

      sig { returns(Sentdm::TcrBrandRelationship::OrSymbol) }
      attr_accessor :brand_relationship

      sig { returns(Sentdm::TcrVertical::OrSymbol) }
      attr_accessor :vertical

      # List of destination countries for messaging
      sig { returns(T.nilable(T::Array[Sentdm::DestinationCountry])) }
      attr_accessor :destination_countries

      # Expected daily messaging volume
      sig { returns(T.nilable(String)) }
      attr_accessor :expected_messaging_volume

      # Whether this is a TCR (Campaign Registry) application
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_tcr_application

      # Additional notes about the business or use case
      sig { returns(T.nilable(String)) }
      attr_accessor :notes

      # Phone number prefix for messaging (e.g., "+1")
      sig { returns(T.nilable(String)) }
      attr_accessor :phone_number_prefix

      # Primary messaging use case description
      sig { returns(T.nilable(String)) }
      attr_accessor :primary_use_case

      # Compliance and TCR information for brand registration
      sig do
        params(
          brand_relationship: Sentdm::TcrBrandRelationship::OrSymbol,
          vertical: Sentdm::TcrVertical::OrSymbol,
          destination_countries:
            T.nilable(T::Array[Sentdm::DestinationCountry::OrHash]),
          expected_messaging_volume: T.nilable(String),
          is_tcr_application: T.nilable(T::Boolean),
          notes: T.nilable(String),
          phone_number_prefix: T.nilable(String),
          primary_use_case: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        brand_relationship:,
        vertical:,
        # List of destination countries for messaging
        destination_countries: nil,
        # Expected daily messaging volume
        expected_messaging_volume: nil,
        # Whether this is a TCR (Campaign Registry) application
        is_tcr_application: nil,
        # Additional notes about the business or use case
        notes: nil,
        # Phone number prefix for messaging (e.g., "+1")
        phone_number_prefix: nil,
        # Primary messaging use case description
        primary_use_case: nil
      )
      end

      sig do
        override.returns(
          {
            brand_relationship: Sentdm::TcrBrandRelationship::OrSymbol,
            vertical: Sentdm::TcrVertical::OrSymbol,
            destination_countries:
              T.nilable(T::Array[Sentdm::DestinationCountry]),
            expected_messaging_volume: T.nilable(String),
            is_tcr_application: T.nilable(T::Boolean),
            notes: T.nilable(String),
            phone_number_prefix: T.nilable(String),
            primary_use_case: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
