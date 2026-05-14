# typed: strong

module Sentdm
  module Models
    class ProfileUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::ProfileUpdateParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :profile_id

      # Whether contacts are shared across profiles (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_contact_sharing

      # Whether number changes are allowed during onboarding (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_number_change_during_onboarding

      # Whether templates are shared across profiles (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_template_sharing

      # Billing contact information for a profile. Required when billing_model is
      # "profile" or "profile_and_organization".
      sig { returns(T.nilable(Sentdm::ProfileUpdateParams::BillingContact)) }
      attr_reader :billing_contact

      sig do
        params(
          billing_contact:
            T.nilable(Sentdm::ProfileUpdateParams::BillingContact::OrHash)
        ).void
      end
      attr_writer :billing_contact

      # Billing model: profile, organization, or profile_and_organization (optional).
      #
      # - "organization": the organization's billing details are used; no profile-level
      #   billing info needed.
      # - "profile": the profile is billed independently; billing_contact is required.
      # - "profile_and_organization": the profile is billed first with the organization
      #   as fallback; billing_contact is required.
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_model

      # Brand and KYC data grouped into contact, business, and compliance sections
      sig { returns(T.nilable(Sentdm::ProfileUpdateParams::Brand)) }
      attr_reader :brand

      sig do
        params(
          brand: T.nilable(Sentdm::ProfileUpdateParams::Brand::OrHash)
        ).void
      end
      attr_writer :brand

      # Profile description (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Profile icon URL (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :icon

      # Whether this profile inherits contacts from organization (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_contacts

      # Whether this profile inherits TCR brand from organization (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_brand

      # Whether this profile inherits TCR campaign from organization (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_campaign

      # Whether this profile inherits templates from organization (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_templates

      # Profile name (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Payment card details for a profile. Accepted when billing_model is "profile" or
      # "profile_and_organization". These details are not stored on our servers and will
      # be forwarded to the payment processor.
      sig { returns(T.nilable(Sentdm::ProfileUpdateParams::PaymentDetails)) }
      attr_reader :payment_details

      sig do
        params(
          payment_details:
            T.nilable(Sentdm::ProfileUpdateParams::PaymentDetails::OrHash)
        ).void
      end
      attr_writer :payment_details

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      # Direct phone number for SMS sending (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number

      # Reference to another profile to use for SMS/Telnyx configuration (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number_profile_id

      # Reference to another profile to use for WhatsApp configuration (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_whatsapp_number_profile_id

      # Profile short name/abbreviation (optional). Must be 3–11 characters, contain
      # only letters, numbers, and spaces, and include at least one letter. Example:
      # "SALES", "Mkt 2", "Support1".
      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # Direct phone number for WhatsApp sending (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :whatsapp_phone_number

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          profile_id: String,
          allow_contact_sharing: T.nilable(T::Boolean),
          allow_number_change_during_onboarding: T.nilable(T::Boolean),
          allow_template_sharing: T.nilable(T::Boolean),
          billing_contact:
            T.nilable(Sentdm::ProfileUpdateParams::BillingContact::OrHash),
          billing_model: T.nilable(String),
          brand: T.nilable(Sentdm::ProfileUpdateParams::Brand::OrHash),
          description: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T.nilable(T::Boolean),
          inherit_tcr_campaign: T.nilable(T::Boolean),
          inherit_templates: T.nilable(T::Boolean),
          name: T.nilable(String),
          payment_details:
            T.nilable(Sentdm::ProfileUpdateParams::PaymentDetails::OrHash),
          sandbox: T::Boolean,
          sending_phone_number: T.nilable(String),
          sending_phone_number_profile_id: T.nilable(String),
          sending_whatsapp_number_profile_id: T.nilable(String),
          short_name: T.nilable(String),
          whatsapp_phone_number: T.nilable(String),
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        profile_id:,
        # Whether contacts are shared across profiles (optional)
        allow_contact_sharing: nil,
        # Whether number changes are allowed during onboarding (optional)
        allow_number_change_during_onboarding: nil,
        # Whether templates are shared across profiles (optional)
        allow_template_sharing: nil,
        # Billing contact information for a profile. Required when billing_model is
        # "profile" or "profile_and_organization".
        billing_contact: nil,
        # Billing model: profile, organization, or profile_and_organization (optional).
        #
        # - "organization": the organization's billing details are used; no profile-level
        #   billing info needed.
        # - "profile": the profile is billed independently; billing_contact is required.
        # - "profile_and_organization": the profile is billed first with the organization
        #   as fallback; billing_contact is required.
        billing_model: nil,
        # Brand and KYC data grouped into contact, business, and compliance sections
        brand: nil,
        # Profile description (optional)
        description: nil,
        # Profile icon URL (optional)
        icon: nil,
        # Whether this profile inherits contacts from organization (optional)
        inherit_contacts: nil,
        # Whether this profile inherits TCR brand from organization (optional)
        inherit_tcr_brand: nil,
        # Whether this profile inherits TCR campaign from organization (optional)
        inherit_tcr_campaign: nil,
        # Whether this profile inherits templates from organization (optional)
        inherit_templates: nil,
        # Profile name (optional)
        name: nil,
        # Payment card details for a profile. Accepted when billing_model is "profile" or
        # "profile_and_organization". These details are not stored on our servers and will
        # be forwarded to the payment processor.
        payment_details: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        # Direct phone number for SMS sending (optional)
        sending_phone_number: nil,
        # Reference to another profile to use for SMS/Telnyx configuration (optional)
        sending_phone_number_profile_id: nil,
        # Reference to another profile to use for WhatsApp configuration (optional)
        sending_whatsapp_number_profile_id: nil,
        # Profile short name/abbreviation (optional). Must be 3–11 characters, contain
        # only letters, numbers, and spaces, and include at least one letter. Example:
        # "SALES", "Mkt 2", "Support1".
        short_name: nil,
        # Direct phone number for WhatsApp sending (optional)
        whatsapp_phone_number: nil,
        idempotency_key: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            profile_id: String,
            allow_contact_sharing: T.nilable(T::Boolean),
            allow_number_change_during_onboarding: T.nilable(T::Boolean),
            allow_template_sharing: T.nilable(T::Boolean),
            billing_contact:
              T.nilable(Sentdm::ProfileUpdateParams::BillingContact),
            billing_model: T.nilable(String),
            brand: T.nilable(Sentdm::ProfileUpdateParams::Brand),
            description: T.nilable(String),
            icon: T.nilable(String),
            inherit_contacts: T.nilable(T::Boolean),
            inherit_tcr_brand: T.nilable(T::Boolean),
            inherit_tcr_campaign: T.nilable(T::Boolean),
            inherit_templates: T.nilable(T::Boolean),
            name: T.nilable(String),
            payment_details:
              T.nilable(Sentdm::ProfileUpdateParams::PaymentDetails),
            sandbox: T::Boolean,
            sending_phone_number: T.nilable(String),
            sending_phone_number_profile_id: T.nilable(String),
            sending_whatsapp_number_profile_id: T.nilable(String),
            short_name: T.nilable(String),
            whatsapp_phone_number: T.nilable(String),
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class BillingContact < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::ProfileUpdateParams::BillingContact,
              Sentdm::Internal::AnyHash
            )
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

      class Brand < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::ProfileUpdateParams::Brand, Sentdm::Internal::AnyHash)
          end

        # Compliance and TCR information for brand registration
        sig { returns(Sentdm::ProfileUpdateParams::Brand::Compliance) }
        attr_reader :compliance

        sig do
          params(
            compliance: Sentdm::ProfileUpdateParams::Brand::Compliance::OrHash
          ).void
        end
        attr_writer :compliance

        # Contact information for brand KYC
        sig { returns(Sentdm::ProfileUpdateParams::Brand::Contact) }
        attr_reader :contact

        sig do
          params(
            contact: Sentdm::ProfileUpdateParams::Brand::Contact::OrHash
          ).void
        end
        attr_writer :contact

        # Business details and address for brand KYC
        sig { returns(T.nilable(Sentdm::ProfileUpdateParams::Brand::Business)) }
        attr_reader :business

        sig do
          params(
            business:
              T.nilable(Sentdm::ProfileUpdateParams::Brand::Business::OrHash)
          ).void
        end
        attr_writer :business

        # Brand and KYC data grouped into contact, business, and compliance sections
        sig do
          params(
            compliance: Sentdm::ProfileUpdateParams::Brand::Compliance::OrHash,
            contact: Sentdm::ProfileUpdateParams::Brand::Contact::OrHash,
            business:
              T.nilable(Sentdm::ProfileUpdateParams::Brand::Business::OrHash)
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
              compliance: Sentdm::ProfileUpdateParams::Brand::Compliance,
              contact: Sentdm::ProfileUpdateParams::Brand::Contact,
              business: T.nilable(Sentdm::ProfileUpdateParams::Brand::Business)
            }
          )
        end
        def to_hash
        end

        class Compliance < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::ProfileUpdateParams::Brand::Compliance,
                Sentdm::Internal::AnyHash
              )
            end

          sig do
            returns(
              Sentdm::ProfileUpdateParams::Brand::Compliance::BrandRelationship::OrSymbol
            )
          end
          attr_accessor :brand_relationship

          sig do
            returns(
              Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::OrSymbol
            )
          end
          attr_accessor :vertical

          # List of destination countries for messaging
          sig do
            returns(
              T.nilable(
                T::Array[
                  Sentdm::ProfileUpdateParams::Brand::Compliance::DestinationCountry
                ]
              )
            )
          end
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
              brand_relationship:
                Sentdm::ProfileUpdateParams::Brand::Compliance::BrandRelationship::OrSymbol,
              vertical:
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::OrSymbol,
              destination_countries:
                T.nilable(
                  T::Array[
                    Sentdm::ProfileUpdateParams::Brand::Compliance::DestinationCountry::OrHash
                  ]
                ),
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
                brand_relationship:
                  Sentdm::ProfileUpdateParams::Brand::Compliance::BrandRelationship::OrSymbol,
                vertical:
                  Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::OrSymbol,
                destination_countries:
                  T.nilable(
                    T::Array[
                      Sentdm::ProfileUpdateParams::Brand::Compliance::DestinationCountry
                    ]
                  ),
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

          module BrandRelationship
            extend Sentdm::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Sentdm::ProfileUpdateParams::Brand::Compliance::BrandRelationship
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BASIC_ACCOUNT =
              T.let(
                :BASIC_ACCOUNT,
                Sentdm::ProfileUpdateParams::Brand::Compliance::BrandRelationship::TaggedSymbol
              )
            MEDIUM_ACCOUNT =
              T.let(
                :MEDIUM_ACCOUNT,
                Sentdm::ProfileUpdateParams::Brand::Compliance::BrandRelationship::TaggedSymbol
              )
            LARGE_ACCOUNT =
              T.let(
                :LARGE_ACCOUNT,
                Sentdm::ProfileUpdateParams::Brand::Compliance::BrandRelationship::TaggedSymbol
              )
            SMALL_ACCOUNT =
              T.let(
                :SMALL_ACCOUNT,
                Sentdm::ProfileUpdateParams::Brand::Compliance::BrandRelationship::TaggedSymbol
              )
            KEY_ACCOUNT =
              T.let(
                :KEY_ACCOUNT,
                Sentdm::ProfileUpdateParams::Brand::Compliance::BrandRelationship::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Sentdm::ProfileUpdateParams::Brand::Compliance::BrandRelationship::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Vertical
            extend Sentdm::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PROFESSIONAL =
              T.let(
                :PROFESSIONAL,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            REAL_ESTATE =
              T.let(
                :REAL_ESTATE,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            HEALTHCARE =
              T.let(
                :HEALTHCARE,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            HUMAN_RESOURCES =
              T.let(
                :HUMAN_RESOURCES,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            ENERGY =
              T.let(
                :ENERGY,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            ENTERTAINMENT =
              T.let(
                :ENTERTAINMENT,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            RETAIL =
              T.let(
                :RETAIL,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            TRANSPORTATION =
              T.let(
                :TRANSPORTATION,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            AGRICULTURE =
              T.let(
                :AGRICULTURE,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            INSURANCE =
              T.let(
                :INSURANCE,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            POSTAL =
              T.let(
                :POSTAL,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            EDUCATION =
              T.let(
                :EDUCATION,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            HOSPITALITY =
              T.let(
                :HOSPITALITY,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            FINANCIAL =
              T.let(
                :FINANCIAL,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            POLITICAL =
              T.let(
                :POLITICAL,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            GAMBLING =
              T.let(
                :GAMBLING,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            LEGAL =
              T.let(
                :LEGAL,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            CONSTRUCTION =
              T.let(
                :CONSTRUCTION,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            NGO =
              T.let(
                :NGO,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            MANUFACTURING =
              T.let(
                :MANUFACTURING,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            GOVERNMENT =
              T.let(
                :GOVERNMENT,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            TECHNOLOGY =
              T.let(
                :TECHNOLOGY,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )
            COMMUNICATION =
              T.let(
                :COMMUNICATION,
                Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Sentdm::ProfileUpdateParams::Brand::Compliance::Vertical::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class DestinationCountry < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::ProfileUpdateParams::Brand::Compliance::DestinationCountry,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :id

            sig { params(id: String).void }
            attr_writer :id

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :is_main

            sig { params(is_main: T::Boolean).void }
            attr_writer :is_main

            sig do
              params(id: String, is_main: T::Boolean).returns(T.attached_class)
            end
            def self.new(id: nil, is_main: nil)
            end

            sig { override.returns({ id: String, is_main: T::Boolean }) }
            def to_hash
            end
          end
        end

        class Contact < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::ProfileUpdateParams::Brand::Contact,
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

        class Business < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::ProfileUpdateParams::Brand::Business,
                Sentdm::Internal::AnyHash
              )
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
              T.nilable(
                Sentdm::ProfileUpdateParams::Brand::Business::EntityType::OrSymbol
              )
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
                  Sentdm::ProfileUpdateParams::Brand::Business::EntityType::OrSymbol
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
                    Sentdm::ProfileUpdateParams::Brand::Business::EntityType::OrSymbol
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
                T.all(
                  Symbol,
                  Sentdm::ProfileUpdateParams::Brand::Business::EntityType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PRIVATE_PROFIT =
              T.let(
                :PRIVATE_PROFIT,
                Sentdm::ProfileUpdateParams::Brand::Business::EntityType::TaggedSymbol
              )
            PUBLIC_PROFIT =
              T.let(
                :PUBLIC_PROFIT,
                Sentdm::ProfileUpdateParams::Brand::Business::EntityType::TaggedSymbol
              )
            NON_PROFIT =
              T.let(
                :NON_PROFIT,
                Sentdm::ProfileUpdateParams::Brand::Business::EntityType::TaggedSymbol
              )
            SOLE_PROPRIETOR =
              T.let(
                :SOLE_PROPRIETOR,
                Sentdm::ProfileUpdateParams::Brand::Business::EntityType::TaggedSymbol
              )
            GOVERNMENT =
              T.let(
                :GOVERNMENT,
                Sentdm::ProfileUpdateParams::Brand::Business::EntityType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Sentdm::ProfileUpdateParams::Brand::Business::EntityType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class PaymentDetails < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::ProfileUpdateParams::PaymentDetails,
              Sentdm::Internal::AnyHash
            )
          end

        # Card number (digits only, 13–19 characters)
        sig { returns(String) }
        attr_accessor :card_number

        # Card security code (3–4 digits)
        sig { returns(String) }
        attr_accessor :cvc

        # Card expiry date in MM/YY format (e.g. "09/27")
        sig { returns(String) }
        attr_accessor :expiry

        # Billing ZIP / postal code associated with the card
        sig { returns(String) }
        attr_accessor :zip_code

        # Payment card details for a profile. Accepted when billing_model is "profile" or
        # "profile_and_organization". These details are not stored on our servers and will
        # be forwarded to the payment processor.
        sig do
          params(
            card_number: String,
            cvc: String,
            expiry: String,
            zip_code: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Card number (digits only, 13–19 characters)
          card_number:,
          # Card security code (3–4 digits)
          cvc:,
          # Card expiry date in MM/YY format (e.g. "09/27")
          expiry:,
          # Billing ZIP / postal code associated with the card
          zip_code:
        )
        end

        sig do
          override.returns(
            {
              card_number: String,
              cvc: String,
              expiry: String,
              zip_code: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
