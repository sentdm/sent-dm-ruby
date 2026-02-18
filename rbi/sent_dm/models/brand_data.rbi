# typed: strong

module SentDm
  module Models
    class BrandData < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(SentDm::BrandData, SentDm::Internal::AnyHash) }

      # Brand relationship level with TCR (required for TCR)
      sig { returns(SentDm::TcrBrandRelationship::OrSymbol) }
      attr_accessor :brand_relationship

      # Primary contact name (required)
      sig { returns(String) }
      attr_accessor :contact_name

      # Business vertical/industry category (required for TCR)
      sig { returns(SentDm::TcrVertical::OrSymbol) }
      attr_accessor :vertical

      # Brand name for KYC submission
      sig { returns(T.nilable(String)) }
      attr_accessor :brand_name

      # Legal business name
      sig { returns(T.nilable(String)) }
      attr_accessor :business_legal_name

      # Business/brand name
      sig { returns(T.nilable(String)) }
      attr_accessor :business_name

      # Contact's role in the business
      sig { returns(T.nilable(String)) }
      attr_accessor :business_role

      # Business website URL
      sig { returns(T.nilable(String)) }
      attr_accessor :business_url

      # City
      sig { returns(T.nilable(String)) }
      attr_accessor :city

      # Contact email address
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_email

      # Contact phone number in E.164 format
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_phone

      # Contact phone country code (e.g., "1" for US)
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_phone_country_code

      # Country code (e.g., US, CA)
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # Country where the business is registered
      sig { returns(T.nilable(String)) }
      attr_accessor :country_of_registration

      # List of destination countries for messaging
      sig { returns(T.nilable(T::Array[SentDm::DestinationCountry])) }
      attr_accessor :destination_countries

      # Business entity type
      sig { returns(T.nilable(SentDm::BrandData::EntityType::OrSymbol)) }
      attr_accessor :entity_type

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

      # Postal/ZIP code
      sig { returns(T.nilable(String)) }
      attr_accessor :postal_code

      # Primary messaging use case description
      sig { returns(T.nilable(String)) }
      attr_accessor :primary_use_case

      # State/province code
      sig { returns(T.nilable(String)) }
      attr_accessor :state

      # Street address
      sig { returns(T.nilable(String)) }
      attr_accessor :street

      # Tax ID/EIN number
      sig { returns(T.nilable(String)) }
      attr_accessor :tax_id

      # Type of tax ID (e.g., us_ein, ca_bn)
      sig { returns(T.nilable(String)) }
      attr_accessor :tax_id_type

      # Brand and KYC data
      sig do
        params(
          brand_relationship: SentDm::TcrBrandRelationship::OrSymbol,
          contact_name: String,
          vertical: SentDm::TcrVertical::OrSymbol,
          brand_name: T.nilable(String),
          business_legal_name: T.nilable(String),
          business_name: T.nilable(String),
          business_role: T.nilable(String),
          business_url: T.nilable(String),
          city: T.nilable(String),
          contact_email: T.nilable(String),
          contact_phone: T.nilable(String),
          contact_phone_country_code: T.nilable(String),
          country: T.nilable(String),
          country_of_registration: T.nilable(String),
          destination_countries:
            T.nilable(T::Array[SentDm::DestinationCountry::OrHash]),
          entity_type: T.nilable(SentDm::BrandData::EntityType::OrSymbol),
          expected_messaging_volume: T.nilable(String),
          is_tcr_application: T.nilable(T::Boolean),
          notes: T.nilable(String),
          phone_number_prefix: T.nilable(String),
          postal_code: T.nilable(String),
          primary_use_case: T.nilable(String),
          state: T.nilable(String),
          street: T.nilable(String),
          tax_id: T.nilable(String),
          tax_id_type: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Brand relationship level with TCR (required for TCR)
        brand_relationship:,
        # Primary contact name (required)
        contact_name:,
        # Business vertical/industry category (required for TCR)
        vertical:,
        # Brand name for KYC submission
        brand_name: nil,
        # Legal business name
        business_legal_name: nil,
        # Business/brand name
        business_name: nil,
        # Contact's role in the business
        business_role: nil,
        # Business website URL
        business_url: nil,
        # City
        city: nil,
        # Contact email address
        contact_email: nil,
        # Contact phone number in E.164 format
        contact_phone: nil,
        # Contact phone country code (e.g., "1" for US)
        contact_phone_country_code: nil,
        # Country code (e.g., US, CA)
        country: nil,
        # Country where the business is registered
        country_of_registration: nil,
        # List of destination countries for messaging
        destination_countries: nil,
        # Business entity type
        entity_type: nil,
        # Expected daily messaging volume
        expected_messaging_volume: nil,
        # Whether this is a TCR (Campaign Registry) application
        is_tcr_application: nil,
        # Additional notes about the business or use case
        notes: nil,
        # Phone number prefix for messaging (e.g., "+1")
        phone_number_prefix: nil,
        # Postal/ZIP code
        postal_code: nil,
        # Primary messaging use case description
        primary_use_case: nil,
        # State/province code
        state: nil,
        # Street address
        street: nil,
        # Tax ID/EIN number
        tax_id: nil,
        # Type of tax ID (e.g., us_ein, ca_bn)
        tax_id_type: nil
      )
      end

      sig do
        override.returns(
          {
            brand_relationship: SentDm::TcrBrandRelationship::OrSymbol,
            contact_name: String,
            vertical: SentDm::TcrVertical::OrSymbol,
            brand_name: T.nilable(String),
            business_legal_name: T.nilable(String),
            business_name: T.nilable(String),
            business_role: T.nilable(String),
            business_url: T.nilable(String),
            city: T.nilable(String),
            contact_email: T.nilable(String),
            contact_phone: T.nilable(String),
            contact_phone_country_code: T.nilable(String),
            country: T.nilable(String),
            country_of_registration: T.nilable(String),
            destination_countries:
              T.nilable(T::Array[SentDm::DestinationCountry]),
            entity_type: T.nilable(SentDm::BrandData::EntityType::OrSymbol),
            expected_messaging_volume: T.nilable(String),
            is_tcr_application: T.nilable(T::Boolean),
            notes: T.nilable(String),
            phone_number_prefix: T.nilable(String),
            postal_code: T.nilable(String),
            primary_use_case: T.nilable(String),
            state: T.nilable(String),
            street: T.nilable(String),
            tax_id: T.nilable(String),
            tax_id_type: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Business entity type
      module EntityType
        extend SentDm::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SentDm::BrandData::EntityType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PRIVATE_PROFIT =
          T.let(:PRIVATE_PROFIT, SentDm::BrandData::EntityType::TaggedSymbol)
        PUBLIC_PROFIT =
          T.let(:PUBLIC_PROFIT, SentDm::BrandData::EntityType::TaggedSymbol)
        NON_PROFIT =
          T.let(:NON_PROFIT, SentDm::BrandData::EntityType::TaggedSymbol)
        SOLE_PROPRIETOR =
          T.let(:SOLE_PROPRIETOR, SentDm::BrandData::EntityType::TaggedSymbol)
        GOVERNMENT =
          T.let(:GOVERNMENT, SentDm::BrandData::EntityType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SentDm::BrandData::EntityType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
