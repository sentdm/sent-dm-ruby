# typed: strong

module Sentdm
  module Models
    class BrandsBrandData < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::BrandsBrandData, Sentdm::Internal::AnyHash)
        end

      # Compliance and TCR information for brand registration
      sig { returns(Sentdm::BrandsBrandData::Compliance) }
      attr_reader :compliance

      sig do
        params(compliance: Sentdm::BrandsBrandData::Compliance::OrHash).void
      end
      attr_writer :compliance

      # Contact information for brand KYC
      sig { returns(Sentdm::BrandsBrandData::Contact) }
      attr_reader :contact

      sig { params(contact: Sentdm::BrandsBrandData::Contact::OrHash).void }
      attr_writer :contact

      # Business details and address for brand KYC
      sig { returns(T.nilable(Sentdm::BrandsBrandData::Business)) }
      attr_reader :business

      sig do
        params(
          business: T.nilable(Sentdm::BrandsBrandData::Business::OrHash)
        ).void
      end
      attr_writer :business

      # Brand and KYC data grouped into contact, business, and compliance sections
      sig do
        params(
          compliance: Sentdm::BrandsBrandData::Compliance::OrHash,
          contact: Sentdm::BrandsBrandData::Contact::OrHash,
          business: T.nilable(Sentdm::BrandsBrandData::Business::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Compliance and TCR information for brand registration
        compliance:,
        # Contact information for brand KYC
        contact:,
        # Business details and address for brand KYC
        business: nil
      )
      end

      sig do
        override.returns(
          {
            compliance: Sentdm::BrandsBrandData::Compliance,
            contact: Sentdm::BrandsBrandData::Contact,
            business: T.nilable(Sentdm::BrandsBrandData::Business)
          }
        )
      end
      def to_hash
      end

      class Compliance < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::BrandsBrandData::Compliance,
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

      class Contact < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::BrandsBrandData::Contact, Sentdm::Internal::AnyHash)
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

      class Business < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::BrandsBrandData::Business, Sentdm::Internal::AnyHash)
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

        sig do
          returns(
            T.nilable(Sentdm::BrandsBrandData::Business::EntityType::OrSymbol)
          )
        end
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

        # Business details and address for brand KYC
        sig do
          params(
            city: T.nilable(String),
            country: T.nilable(String),
            country_of_registration: T.nilable(String),
            entity_type:
              T.nilable(
                Sentdm::BrandsBrandData::Business::EntityType::OrSymbol
              ),
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
              entity_type:
                T.nilable(
                  Sentdm::BrandsBrandData::Business::EntityType::OrSymbol
                ),
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

        module EntityType
          extend Sentdm::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Sentdm::BrandsBrandData::Business::EntityType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PRIVATE_PROFIT =
            T.let(
              :PRIVATE_PROFIT,
              Sentdm::BrandsBrandData::Business::EntityType::TaggedSymbol
            )
          PUBLIC_PROFIT =
            T.let(
              :PUBLIC_PROFIT,
              Sentdm::BrandsBrandData::Business::EntityType::TaggedSymbol
            )
          NON_PROFIT =
            T.let(
              :NON_PROFIT,
              Sentdm::BrandsBrandData::Business::EntityType::TaggedSymbol
            )
          SOLE_PROPRIETOR =
            T.let(
              :SOLE_PROPRIETOR,
              Sentdm::BrandsBrandData::Business::EntityType::TaggedSymbol
            )
          GOVERNMENT =
            T.let(
              :GOVERNMENT,
              Sentdm::BrandsBrandData::Business::EntityType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Sentdm::BrandsBrandData::Business::EntityType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
