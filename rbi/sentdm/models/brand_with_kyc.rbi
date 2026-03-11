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

      # Business details and address information
      sig { returns(T.nilable(Sentdm::BrandWithKYC::Business)) }
      attr_reader :business

      sig do
        params(business: T.nilable(Sentdm::BrandWithKYC::Business::OrHash)).void
      end
      attr_writer :business

      # Compliance and TCR-related information
      sig { returns(T.nilable(Sentdm::BrandWithKYC::Compliance)) }
      attr_reader :compliance

      sig do
        params(
          compliance: T.nilable(Sentdm::BrandWithKYC::Compliance::OrHash)
        ).void
      end
      attr_writer :compliance

      # Contact information for the brand
      sig { returns(T.nilable(Sentdm::BrandWithKYC::Contact)) }
      attr_reader :contact

      sig do
        params(contact: T.nilable(Sentdm::BrandWithKYC::Contact::OrHash)).void
      end
      attr_writer :contact

      # When the brand was created
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # CSP (Campaign Service Provider) ID
      sig { returns(T.nilable(String)) }
      attr_accessor :csp_id

      # TCR brand identity verification status
      sig do
        returns(T.nilable(Sentdm::BrandWithKYC::IdentityStatus::TaggedSymbol))
      end
      attr_accessor :identity_status

      # Whether this brand is inherited from the parent organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_inherited

      sig { params(is_inherited: T::Boolean).void }
      attr_writer :is_inherited

      # TCR brand status
      sig { returns(T.nilable(Sentdm::BrandWithKYC::Status::TaggedSymbol)) }
      attr_accessor :status

      # When the brand was submitted to TCR
      sig { returns(T.nilable(Time)) }
      attr_accessor :submitted_at

      # Whether this brand has been submitted to TCR
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :submitted_to_tcr

      sig { params(submitted_to_tcr: T::Boolean).void }
      attr_writer :submitted_to_tcr

      # TCR brand ID (populated after TCR submission)
      sig { returns(T.nilable(String)) }
      attr_accessor :tcr_brand_id

      # Universal EIN from TCR
      sig { returns(T.nilable(String)) }
      attr_accessor :universal_ein

      # When the brand was last updated
      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      # Brand response with nested contact, business, and compliance sections — mirrors
      # the request structure.
      sig do
        params(
          id: String,
          business: T.nilable(Sentdm::BrandWithKYC::Business::OrHash),
          compliance: T.nilable(Sentdm::BrandWithKYC::Compliance::OrHash),
          contact: T.nilable(Sentdm::BrandWithKYC::Contact::OrHash),
          created_at: Time,
          csp_id: T.nilable(String),
          identity_status:
            T.nilable(Sentdm::BrandWithKYC::IdentityStatus::OrSymbol),
          is_inherited: T::Boolean,
          status: T.nilable(Sentdm::BrandWithKYC::Status::OrSymbol),
          submitted_at: T.nilable(Time),
          submitted_to_tcr: T::Boolean,
          tcr_brand_id: T.nilable(String),
          universal_ein: T.nilable(String),
          updated_at: T.nilable(Time)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the brand
        id: nil,
        # Business details and address information
        business: nil,
        # Compliance and TCR-related information
        compliance: nil,
        # Contact information for the brand
        contact: nil,
        # When the brand was created
        created_at: nil,
        # CSP (Campaign Service Provider) ID
        csp_id: nil,
        # TCR brand identity verification status
        identity_status: nil,
        # Whether this brand is inherited from the parent organization
        is_inherited: nil,
        # TCR brand status
        status: nil,
        # When the brand was submitted to TCR
        submitted_at: nil,
        # Whether this brand has been submitted to TCR
        submitted_to_tcr: nil,
        # TCR brand ID (populated after TCR submission)
        tcr_brand_id: nil,
        # Universal EIN from TCR
        universal_ein: nil,
        # When the brand was last updated
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            business: T.nilable(Sentdm::BrandWithKYC::Business),
            compliance: T.nilable(Sentdm::BrandWithKYC::Compliance),
            contact: T.nilable(Sentdm::BrandWithKYC::Contact),
            created_at: Time,
            csp_id: T.nilable(String),
            identity_status:
              T.nilable(Sentdm::BrandWithKYC::IdentityStatus::TaggedSymbol),
            is_inherited: T::Boolean,
            status: T.nilable(Sentdm::BrandWithKYC::Status::TaggedSymbol),
            submitted_at: T.nilable(Time),
            submitted_to_tcr: T::Boolean,
            tcr_brand_id: T.nilable(String),
            universal_ein: T.nilable(String),
            updated_at: T.nilable(Time)
          }
        )
      end
      def to_hash
      end

      class Business < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::BrandWithKYC::Business, Sentdm::Internal::AnyHash)
          end

        # City
        sig { returns(T.nilable(String)) }
        attr_accessor :city

        # Country code (e.g., US, CA)
        sig { returns(T.nilable(String)) }
        attr_accessor :country

        # Country where the business is registered
        sig { returns(T.nilable(String)) }
        attr_accessor :country_of_registration

        # Business entity type
        sig { returns(T.nilable(String)) }
        attr_accessor :entity_type

        # Legal business name
        sig { returns(T.nilable(String)) }
        attr_accessor :legal_name

        # Postal/ZIP code
        sig { returns(T.nilable(String)) }
        attr_accessor :postal_code

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

        # Business website URL
        sig { returns(T.nilable(String)) }
        attr_accessor :url

        # Business details and address information
        sig do
          params(
            city: T.nilable(String),
            country: T.nilable(String),
            country_of_registration: T.nilable(String),
            entity_type: T.nilable(String),
            legal_name: T.nilable(String),
            postal_code: T.nilable(String),
            state: T.nilable(String),
            street: T.nilable(String),
            tax_id: T.nilable(String),
            tax_id_type: T.nilable(String),
            url: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # City
          city: nil,
          # Country code (e.g., US, CA)
          country: nil,
          # Country where the business is registered
          country_of_registration: nil,
          # Business entity type
          entity_type: nil,
          # Legal business name
          legal_name: nil,
          # Postal/ZIP code
          postal_code: nil,
          # State/province code
          state: nil,
          # Street address
          street: nil,
          # Tax ID/EIN number
          tax_id: nil,
          # Type of tax ID (e.g., us_ein, ca_bn)
          tax_id_type: nil,
          # Business website URL
          url: nil
        )
        end

        sig do
          override.returns(
            {
              city: T.nilable(String),
              country: T.nilable(String),
              country_of_registration: T.nilable(String),
              entity_type: T.nilable(String),
              legal_name: T.nilable(String),
              postal_code: T.nilable(String),
              state: T.nilable(String),
              street: T.nilable(String),
              tax_id: T.nilable(String),
              tax_id_type: T.nilable(String),
              url: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class Compliance < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::BrandWithKYC::Compliance, Sentdm::Internal::AnyHash)
          end

        # Brand relationship level with TCR
        sig { returns(T.nilable(Sentdm::TcrBrandRelationship::TaggedSymbol)) }
        attr_accessor :brand_relationship

        # List of destination countries for messaging
        sig { returns(T.nilable(T::Array[Sentdm::DestinationCountry])) }
        attr_reader :destination_countries

        sig do
          params(
            destination_countries: T::Array[Sentdm::DestinationCountry::OrHash]
          ).void
        end
        attr_writer :destination_countries

        # Expected daily messaging volume
        sig { returns(T.nilable(String)) }
        attr_accessor :expected_messaging_volume

        # Whether this is a TCR (Campaign Registry) application
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_tcr_application

        sig { params(is_tcr_application: T::Boolean).void }
        attr_writer :is_tcr_application

        # Additional notes about the business or use case
        sig { returns(T.nilable(String)) }
        attr_accessor :notes

        # Phone number prefix for messaging (e.g., "+1")
        sig { returns(T.nilable(String)) }
        attr_accessor :phone_number_prefix

        # Primary messaging use case description
        sig { returns(T.nilable(String)) }
        attr_accessor :primary_use_case

        # Business vertical/industry category
        sig { returns(T.nilable(Sentdm::TcrVertical::TaggedSymbol)) }
        attr_accessor :vertical

        # Compliance and TCR-related information
        sig do
          params(
            brand_relationship:
              T.nilable(Sentdm::TcrBrandRelationship::OrSymbol),
            destination_countries: T::Array[Sentdm::DestinationCountry::OrHash],
            expected_messaging_volume: T.nilable(String),
            is_tcr_application: T::Boolean,
            notes: T.nilable(String),
            phone_number_prefix: T.nilable(String),
            primary_use_case: T.nilable(String),
            vertical: T.nilable(Sentdm::TcrVertical::OrSymbol)
          ).returns(T.attached_class)
        end
        def self.new(
          # Brand relationship level with TCR
          brand_relationship: nil,
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
          primary_use_case: nil,
          # Business vertical/industry category
          vertical: nil
        )
        end

        sig do
          override.returns(
            {
              brand_relationship:
                T.nilable(Sentdm::TcrBrandRelationship::TaggedSymbol),
              destination_countries: T::Array[Sentdm::DestinationCountry],
              expected_messaging_volume: T.nilable(String),
              is_tcr_application: T::Boolean,
              notes: T.nilable(String),
              phone_number_prefix: T.nilable(String),
              primary_use_case: T.nilable(String),
              vertical: T.nilable(Sentdm::TcrVertical::TaggedSymbol)
            }
          )
        end
        def to_hash
        end
      end

      class Contact < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::BrandWithKYC::Contact, Sentdm::Internal::AnyHash)
          end

        # Business/brand name
        sig { returns(T.nilable(String)) }
        attr_accessor :business_name

        # Contact email address
        sig { returns(T.nilable(String)) }
        attr_accessor :email

        # Primary contact name
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Contact phone number in E.164 format
        sig { returns(T.nilable(String)) }
        attr_accessor :phone

        # Contact phone country code (e.g., "1" for US)
        sig { returns(T.nilable(String)) }
        attr_accessor :phone_country_code

        # Contact's role in the business
        sig { returns(T.nilable(String)) }
        attr_accessor :role

        # Contact information for the brand
        sig do
          params(
            business_name: T.nilable(String),
            email: T.nilable(String),
            name: String,
            phone: T.nilable(String),
            phone_country_code: T.nilable(String),
            role: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Business/brand name
          business_name: nil,
          # Contact email address
          email: nil,
          # Primary contact name
          name: nil,
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
              business_name: T.nilable(String),
              email: T.nilable(String),
              name: String,
              phone: T.nilable(String),
              phone_country_code: T.nilable(String),
              role: T.nilable(String)
            }
          )
        end
        def to_hash
        end
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
