# typed: strong

module Sentdm
  module Models
    class BrandWithKYC < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::BrandWithKYC, Sentdm::Internal::AnyHash) }

      # Unique identifier for the brand
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Brand relationship level with TCR
      sig { returns(T.nilable(Sentdm::TcrBrandRelationship::TaggedSymbol)) }
      attr_accessor :brand_relationship

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

      # Primary contact name
      sig { returns(T.nilable(String)) }
      attr_reader :contact_name

      sig { params(contact_name: String).void }
      attr_writer :contact_name

      # Contact phone number
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_phone

      # Contact phone country code
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_phone_country_code

      # Country code
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # Country where the business is registered
      sig { returns(T.nilable(String)) }
      attr_accessor :country_of_registration

      # When the brand was created
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # CSP (Campaign Service Provider) ID
      sig { returns(T.nilable(String)) }
      attr_accessor :csp_id

      # List of destination countries for messaging
      sig { returns(T.nilable(T::Array[Sentdm::DestinationCountry])) }
      attr_reader :destination_countries

      sig do
        params(
          destination_countries: T::Array[Sentdm::DestinationCountry::OrHash]
        ).void
      end
      attr_writer :destination_countries

      # Business entity type
      sig { returns(T.nilable(String)) }
      attr_accessor :entity_type

      # Expected daily messaging volume
      sig { returns(T.nilable(String)) }
      attr_accessor :expected_messaging_volume

      # TCR brand identity verification status
      sig do
        returns(T.nilable(Sentdm::BrandWithKYC::IdentityStatus::TaggedSymbol))
      end
      attr_accessor :identity_status

      # Whether this brand is inherited from parent organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_inherited

      sig { params(is_inherited: T::Boolean).void }
      attr_writer :is_inherited

      # Whether this is a TCR application
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_tcr_application

      sig { params(is_tcr_application: T::Boolean).void }
      attr_writer :is_tcr_application

      # Additional notes
      sig { returns(T.nilable(String)) }
      attr_accessor :notes

      # Phone number prefix for messaging
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

      # TCR brand status
      sig { returns(T.nilable(Sentdm::BrandWithKYC::Status::TaggedSymbol)) }
      attr_accessor :status

      # Street address
      sig { returns(T.nilable(String)) }
      attr_accessor :street

      # When the brand was submitted to TCR
      sig { returns(T.nilable(Time)) }
      attr_accessor :submitted_at

      # Whether this brand was submitted to TCR
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :submitted_to_tcr

      sig { params(submitted_to_tcr: T::Boolean).void }
      attr_writer :submitted_to_tcr

      # Tax ID/EIN number
      sig { returns(T.nilable(String)) }
      attr_accessor :tax_id

      # Type of tax ID
      sig { returns(T.nilable(String)) }
      attr_accessor :tax_id_type

      # TCR brand ID (populated after TCR submission)
      sig { returns(T.nilable(String)) }
      attr_accessor :tcr_brand_id

      # Universal EIN from TCR
      sig { returns(T.nilable(String)) }
      attr_accessor :universal_ein

      # When the brand was last updated
      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      # Business vertical/industry category
      sig { returns(T.nilable(Sentdm::TcrVertical::TaggedSymbol)) }
      attr_accessor :vertical

      # Flattened brand response with embedded KYC information
      sig do
        params(
          id: String,
          brand_relationship: T.nilable(Sentdm::TcrBrandRelationship::OrSymbol),
          business_legal_name: T.nilable(String),
          business_name: T.nilable(String),
          business_role: T.nilable(String),
          business_url: T.nilable(String),
          city: T.nilable(String),
          contact_email: T.nilable(String),
          contact_name: String,
          contact_phone: T.nilable(String),
          contact_phone_country_code: T.nilable(String),
          country: T.nilable(String),
          country_of_registration: T.nilable(String),
          created_at: Time,
          csp_id: T.nilable(String),
          destination_countries: T::Array[Sentdm::DestinationCountry::OrHash],
          entity_type: T.nilable(String),
          expected_messaging_volume: T.nilable(String),
          identity_status:
            T.nilable(Sentdm::BrandWithKYC::IdentityStatus::OrSymbol),
          is_inherited: T::Boolean,
          is_tcr_application: T::Boolean,
          notes: T.nilable(String),
          phone_number_prefix: T.nilable(String),
          postal_code: T.nilable(String),
          primary_use_case: T.nilable(String),
          state: T.nilable(String),
          status: T.nilable(Sentdm::BrandWithKYC::Status::OrSymbol),
          street: T.nilable(String),
          submitted_at: T.nilable(Time),
          submitted_to_tcr: T::Boolean,
          tax_id: T.nilable(String),
          tax_id_type: T.nilable(String),
          tcr_brand_id: T.nilable(String),
          universal_ein: T.nilable(String),
          updated_at: T.nilable(Time),
          vertical: T.nilable(Sentdm::TcrVertical::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the brand
        id: nil,
        # Brand relationship level with TCR
        brand_relationship: nil,
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
        # Primary contact name
        contact_name: nil,
        # Contact phone number
        contact_phone: nil,
        # Contact phone country code
        contact_phone_country_code: nil,
        # Country code
        country: nil,
        # Country where the business is registered
        country_of_registration: nil,
        # When the brand was created
        created_at: nil,
        # CSP (Campaign Service Provider) ID
        csp_id: nil,
        # List of destination countries for messaging
        destination_countries: nil,
        # Business entity type
        entity_type: nil,
        # Expected daily messaging volume
        expected_messaging_volume: nil,
        # TCR brand identity verification status
        identity_status: nil,
        # Whether this brand is inherited from parent organization
        is_inherited: nil,
        # Whether this is a TCR application
        is_tcr_application: nil,
        # Additional notes
        notes: nil,
        # Phone number prefix for messaging
        phone_number_prefix: nil,
        # Postal/ZIP code
        postal_code: nil,
        # Primary messaging use case description
        primary_use_case: nil,
        # State/province code
        state: nil,
        # TCR brand status
        status: nil,
        # Street address
        street: nil,
        # When the brand was submitted to TCR
        submitted_at: nil,
        # Whether this brand was submitted to TCR
        submitted_to_tcr: nil,
        # Tax ID/EIN number
        tax_id: nil,
        # Type of tax ID
        tax_id_type: nil,
        # TCR brand ID (populated after TCR submission)
        tcr_brand_id: nil,
        # Universal EIN from TCR
        universal_ein: nil,
        # When the brand was last updated
        updated_at: nil,
        # Business vertical/industry category
        vertical: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            brand_relationship:
              T.nilable(Sentdm::TcrBrandRelationship::TaggedSymbol),
            business_legal_name: T.nilable(String),
            business_name: T.nilable(String),
            business_role: T.nilable(String),
            business_url: T.nilable(String),
            city: T.nilable(String),
            contact_email: T.nilable(String),
            contact_name: String,
            contact_phone: T.nilable(String),
            contact_phone_country_code: T.nilable(String),
            country: T.nilable(String),
            country_of_registration: T.nilable(String),
            created_at: Time,
            csp_id: T.nilable(String),
            destination_countries: T::Array[Sentdm::DestinationCountry],
            entity_type: T.nilable(String),
            expected_messaging_volume: T.nilable(String),
            identity_status:
              T.nilable(Sentdm::BrandWithKYC::IdentityStatus::TaggedSymbol),
            is_inherited: T::Boolean,
            is_tcr_application: T::Boolean,
            notes: T.nilable(String),
            phone_number_prefix: T.nilable(String),
            postal_code: T.nilable(String),
            primary_use_case: T.nilable(String),
            state: T.nilable(String),
            status: T.nilable(Sentdm::BrandWithKYC::Status::TaggedSymbol),
            street: T.nilable(String),
            submitted_at: T.nilable(Time),
            submitted_to_tcr: T::Boolean,
            tax_id: T.nilable(String),
            tax_id_type: T.nilable(String),
            tcr_brand_id: T.nilable(String),
            universal_ein: T.nilable(String),
            updated_at: T.nilable(Time),
            vertical: T.nilable(Sentdm::TcrVertical::TaggedSymbol)
          }
        )
      end
      def to_hash
      end

      # TCR brand identity verification status
      module IdentityStatus
        extend Sentdm::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Sentdm::BrandWithKYC::IdentityStatus) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SELF_DECLARED =
          T.let(
            :SELF_DECLARED,
            Sentdm::BrandWithKYC::IdentityStatus::TaggedSymbol
          )
        UNVERIFIED =
          T.let(:UNVERIFIED, Sentdm::BrandWithKYC::IdentityStatus::TaggedSymbol)
        VERIFIED =
          T.let(:VERIFIED, Sentdm::BrandWithKYC::IdentityStatus::TaggedSymbol)
        VETTED_VERIFIED =
          T.let(
            :VETTED_VERIFIED,
            Sentdm::BrandWithKYC::IdentityStatus::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Sentdm::BrandWithKYC::IdentityStatus::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # TCR brand status
      module Status
        extend Sentdm::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Sentdm::BrandWithKYC::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE = T.let(:ACTIVE, Sentdm::BrandWithKYC::Status::TaggedSymbol)
        INACTIVE = T.let(:INACTIVE, Sentdm::BrandWithKYC::Status::TaggedSymbol)
        SUSPENDED =
          T.let(:SUSPENDED, Sentdm::BrandWithKYC::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Sentdm::BrandWithKYC::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
