# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#list
    class ProfileListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The profiles in the organization.
      #
      #   @return [Sentdm::Models::ProfileListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ProfileListResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ProfileListResponse::Error, nil]
      optional :error, -> { Sentdm::Models::ProfileListResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::ProfileListResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::ProfileListResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ProfileListResponse::Data, nil] The profiles in the organization.
      #
      #   @param error [Sentdm::Models::ProfileListResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::ProfileListResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ProfileListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::ProfileListResponse::Data::Pagination, nil]
        optional :pagination, -> { Sentdm::Models::ProfileListResponse::Data::Pagination }

        # @!attribute profiles
        #   The profiles on this page.
        #
        #   @return [Array<Sentdm::Models::ProfileListResponse::Data::Profile>, nil]
        optional :profiles,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::ProfileListResponse::Data::Profile] }

        # @!method initialize(pagination: nil, profiles: nil)
        #   The profiles in the organization.
        #
        #   @param pagination [Sentdm::Models::ProfileListResponse::Data::Pagination] Pagination metadata for list responses
        #
        #   @param profiles [Array<Sentdm::Models::ProfileListResponse::Data::Profile>] The profiles on this page.

        # @see Sentdm::Models::ProfileListResponse::Data#pagination
        class Pagination < Sentdm::Internal::Type::BaseModel
          # @!attribute cursors
          #   @deprecated
          #
          #   Cursor-based pagination. Never populated — see Cursors.
          #
          #   @return [Sentdm::Models::ProfileListResponse::Data::Pagination::Cursors, nil]
          optional :cursors, -> { Sentdm::Models::ProfileListResponse::Data::Pagination::Cursors }, nil?: true

          # @!attribute has_more
          #   Whether there are more pages after this one
          #
          #   @return [Boolean, nil]
          optional :has_more, Sentdm::Internal::Type::Boolean

          # @!attribute page
          #   Current page number (1-indexed)
          #
          #   @return [Integer, nil]
          optional :page, Integer

          # @!attribute page_size
          #   Number of items per page
          #
          #   @return [Integer, nil]
          optional :page_size, Integer

          # @!attribute total_count
          #   Total number of items across all pages
          #
          #   @return [Integer, nil]
          optional :total_count, Integer

          # @!attribute total_pages
          #   Total number of pages
          #
          #   @return [Integer, nil]
          optional :total_pages, Integer

          # @!method initialize(cursors: nil, has_more: nil, page: nil, page_size: nil, total_count: nil, total_pages: nil)
          #   Pagination metadata for list responses
          #
          #   @param cursors [Sentdm::Models::ProfileListResponse::Data::Pagination::Cursors, nil] Cursor-based pagination. Never populated — see Cursors.
          #
          #   @param has_more [Boolean] Whether there are more pages after this one
          #
          #   @param page [Integer] Current page number (1-indexed)
          #
          #   @param page_size [Integer] Number of items per page
          #
          #   @param total_count [Integer] Total number of items across all pages
          #
          #   @param total_pages [Integer] Total number of pages

          # @deprecated
          #
          # @see Sentdm::Models::ProfileListResponse::Data::Pagination#cursors
          class Cursors < Sentdm::Internal::Type::BaseModel
            # @!attribute after
            #   Cursor to fetch the next page.
            #
            #   @return [String, nil]
            optional :after, String, nil?: true

            # @!attribute before
            #   Cursor to fetch the previous page.
            #
            #   @return [String, nil]
            optional :before, String, nil?: true

            # @!method initialize(after: nil, before: nil)
            #   Cursor-based pagination. Never populated — see Cursors.
            #
            #   @param after [String, nil] Cursor to fetch the next page.
            #
            #   @param before [String, nil] Cursor to fetch the previous page.
          end
        end

        class Profile < Sentdm::Internal::Type::BaseModel
          # @!attribute id
          #   Profile unique identifier
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute allow_contact_sharing
          #   @deprecated
          #
          #   Always false. A profile no longer shares contacts with sibling profiles — it
          #   sees only what it owns. Retained so existing v3 clients reading
          #   allow_contact_sharing keep deserializing; it carries no information.
          #
          #   @return [Boolean, nil]
          optional :allow_contact_sharing, Sentdm::Internal::Type::Boolean, nil?: true

          # @!attribute allow_number_change_during_onboarding
          #   Whether number changes are allowed during onboarding
          #
          #   @return [Boolean, nil]
          optional :allow_number_change_during_onboarding, Sentdm::Internal::Type::Boolean, nil?: true

          # @!attribute allow_template_sharing
          #   @deprecated
          #
          #   Always false. A profile no longer shares templates with sibling profiles.
          #   Retained so existing v3 clients reading allow_template_sharing keep
          #   deserializing; it carries no information.
          #
          #   @return [Boolean, nil]
          optional :allow_template_sharing, Sentdm::Internal::Type::Boolean, nil?: true

          # @!attribute billing_contact
          #   Billing contact info returned in profile responses
          #
          #   @return [Sentdm::Models::ProfileListResponse::Data::Profile::BillingContact, nil]
          optional :billing_contact,
                   -> { Sentdm::Models::ProfileListResponse::Data::Profile::BillingContact },
                   nil?: true

          # @!attribute billing_model
          #   Billing model: profile, organization, or profile_and_organization
          #
          #   @return [String, nil]
          optional :billing_model, String

          # @!attribute brand
          #   Brand response with nested contact, business, and compliance sections — mirrors
          #   the request structure.
          #
          #   @return [Sentdm::Models::ProfileListResponse::Data::Profile::Brand, nil]
          optional :brand, -> { Sentdm::Models::ProfileListResponse::Data::Profile::Brand }, nil?: true

          # @!attribute created_at
          #   When the profile was created
          #
          #   @return [Time, nil]
          optional :created_at, Time

          # @!attribute description
          #   Profile description
          #
          #   @return [String, nil]
          optional :description, String, nil?: true

          # @!attribute email
          #   Profile email (inherited from organization)
          #
          #   @return [String, nil]
          optional :email, String, nil?: true

          # @!attribute icon
          #   Profile icon URL
          #
          #   @return [String, nil]
          optional :icon, String, nil?: true

          # @!attribute inherit_contacts
          #   @deprecated
          #
          #   Always false. A profile no longer inherits its organization's contacts. Retained
          #   so existing v3 clients reading inherit_contacts keep deserializing; it carries
          #   no information.
          #
          #   @return [Boolean, nil]
          optional :inherit_contacts, Sentdm::Internal::Type::Boolean, nil?: true

          # @!attribute inherit_tcr_brand
          #   Whether this profile inherits TCR brand from the organization
          #
          #   @return [Boolean, nil]
          optional :inherit_tcr_brand, Sentdm::Internal::Type::Boolean

          # @!attribute inherit_tcr_campaign
          #   Whether this profile inherits TCR campaign from the organization
          #
          #   @return [Boolean, nil]
          optional :inherit_tcr_campaign, Sentdm::Internal::Type::Boolean

          # @!attribute inherit_templates
          #   @deprecated
          #
          #   Always false. A profile no longer inherits its organization's templates.
          #   Retained so existing v3 clients reading inherit_templates keep deserializing; it
          #   carries no information.
          #
          #   @return [Boolean, nil]
          optional :inherit_templates, Sentdm::Internal::Type::Boolean, nil?: true

          # @!attribute name
          #   Profile name
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute organization_id
          #   Parent organization ID
          #
          #   @return [String, nil]
          optional :organization_id, String, nil?: true

          # @!attribute sending_phone_number
          #   Direct SMS phone number
          #
          #   @return [String, nil]
          optional :sending_phone_number, String, nil?: true

          # @!attribute sending_phone_number_profile_id
          #   @deprecated
          #
          #   Deprecated. Always null. Sender borrowing is gone: a profile no longer points at
          #   another profile for its SMS sender, and every profile owns the sender it sends
          #   from.
          #
          #   Kept on the wire, and never populated, because those are two different promises.
          #   Removing the key changes the response's shape — a generated client loses the
          #   property and stops compiling on the next regenerate, for a value that is now
          #   null for every profile in existence. Keeping it null costs a key and breaks
          #   nobody, and null is the honest answer rather than a placeholder: there is no
          #   borrowing left to report.
          #
          #   Nothing could populate it. Migration 260813161500 dropped the column and copied
          #   each borrower its own channel-provider row; its Down() says outright that the
          #   borrower-to-lender pairing is not recoverable. The only surviving trace is a
          #   notes string on the copied row.
          #
          #   @return [String, nil]
          optional :sending_phone_number_profile_id, String, nil?: true

          # @!attribute sending_whatsapp_number_profile_id
          #   @deprecated
          #
          #   @return [String, nil]
          optional :sending_whatsapp_number_profile_id, String, nil?: true

          # @!attribute short_name
          #   Profile short name/abbreviation. 3–11 characters: letters, numbers, and spaces
          #   only, with at least one letter.
          #
          #   @return [String, nil]
          optional :short_name, String, nil?: true

          # @!attribute status
          #   Profile setup status: incomplete, pending_review, approved, rejected
          #
          #   @return [String, nil]
          optional :status, String

          # @!attribute updated_at
          #   When the profile was last updated
          #
          #   @return [Time, nil]
          optional :updated_at, Time, nil?: true

          # @!attribute waba_id
          #   WhatsApp Business Account ID associated with this profile. Present whether the
          #   WABA is inherited from the organization or configured directly.
          #
          #   @return [String, nil]
          optional :waba_id, String, nil?: true

          # @!attribute whatsapp_phone_number
          #   Direct WhatsApp phone number
          #
          #   @return [String, nil]
          optional :whatsapp_phone_number, String, nil?: true

          # @!method initialize(id: nil, allow_contact_sharing: nil, allow_number_change_during_onboarding: nil, allow_template_sharing: nil, billing_contact: nil, billing_model: nil, brand: nil, created_at: nil, description: nil, email: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, organization_id: nil, sending_phone_number: nil, sending_phone_number_profile_id: nil, sending_whatsapp_number_profile_id: nil, short_name: nil, status: nil, updated_at: nil, waba_id: nil, whatsapp_phone_number: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::ProfileListResponse::Data::Profile} for more details.
          #
          #   Detailed profile response for v3 API
          #
          #   @param id [String] Profile unique identifier
          #
          #   @param allow_contact_sharing [Boolean, nil] Always false. A profile no longer shares contacts with sibling profiles — it see
          #
          #   @param allow_number_change_during_onboarding [Boolean, nil] Whether number changes are allowed during onboarding
          #
          #   @param allow_template_sharing [Boolean, nil] Always false. A profile no longer shares templates with sibling profiles. Retain
          #
          #   @param billing_contact [Sentdm::Models::ProfileListResponse::Data::Profile::BillingContact, nil] Billing contact info returned in profile responses
          #
          #   @param billing_model [String] Billing model: profile, organization, or profile_and_organization
          #
          #   @param brand [Sentdm::Models::ProfileListResponse::Data::Profile::Brand, nil] Brand response with nested contact, business, and compliance sections — mirrors
          #
          #   @param created_at [Time] When the profile was created
          #
          #   @param description [String, nil] Profile description
          #
          #   @param email [String, nil] Profile email (inherited from organization)
          #
          #   @param icon [String, nil] Profile icon URL
          #
          #   @param inherit_contacts [Boolean, nil] Always false. A profile no longer inherits its organization's contacts. Retained
          #
          #   @param inherit_tcr_brand [Boolean] Whether this profile inherits TCR brand from the organization
          #
          #   @param inherit_tcr_campaign [Boolean] Whether this profile inherits TCR campaign from the organization
          #
          #   @param inherit_templates [Boolean, nil] Always false. A profile no longer inherits its organization's templates. Retaine
          #
          #   @param name [String] Profile name
          #
          #   @param organization_id [String, nil] Parent organization ID
          #
          #   @param sending_phone_number [String, nil] Direct SMS phone number
          #
          #   @param sending_phone_number_profile_id [String, nil] Deprecated. Always null. Sender borrowing is gone: a profile no longer points at
          #
          #   @param sending_whatsapp_number_profile_id [String, nil]
          #
          #   @param short_name [String, nil] Profile short name/abbreviation. 3–11 characters: letters, numbers, and spaces o
          #
          #   @param status [String] Profile setup status: incomplete, pending_review, approved, rejected
          #
          #   @param updated_at [Time, nil] When the profile was last updated
          #
          #   @param waba_id [String, nil] WhatsApp Business Account ID associated with this profile.
          #
          #   @param whatsapp_phone_number [String, nil] Direct WhatsApp phone number

          # @see Sentdm::Models::ProfileListResponse::Data::Profile#billing_contact
          class BillingContact < Sentdm::Internal::Type::BaseModel
            # @!attribute address
            #
            #   @return [String, nil]
            optional :address, String, nil?: true

            # @!attribute email
            #
            #   @return [String, nil]
            optional :email, String, nil?: true

            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String, nil?: true

            # @!attribute phone
            #
            #   @return [String, nil]
            optional :phone, String, nil?: true

            # @!method initialize(address: nil, email: nil, name: nil, phone: nil)
            #   Billing contact info returned in profile responses
            #
            #   @param address [String, nil]
            #   @param email [String, nil]
            #   @param name [String, nil]
            #   @param phone [String, nil]
          end

          # @see Sentdm::Models::ProfileListResponse::Data::Profile#brand
          class Brand < Sentdm::Internal::Type::BaseModel
            # @!attribute id
            #   Unique identifier for the brand
            #
            #   @return [String, nil]
            optional :id, String

            # @!attribute business
            #   Business details and address information
            #
            #   @return [Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Business, nil]
            optional :business, -> { Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Business }, nil?: true

            # @!attribute compliance
            #   Compliance and TCR-related information
            #
            #   @return [Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Compliance, nil]
            optional :compliance,
                     -> { Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Compliance },
                     nil?: true

            # @!attribute contact
            #   Contact information for the brand
            #
            #   @return [Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Contact, nil]
            optional :contact, -> { Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Contact }, nil?: true

            # @!attribute created_at
            #   When the brand was created
            #
            #   @return [Time, nil]
            optional :created_at, Time

            # @!attribute csp_id
            #   @deprecated
            #
            #   Deprecated and scheduled for removal. Identifies the Campaign Service Provider
            #   that registered the brand, which is Sent, so the value is the same for every
            #   brand and every account. Nothing on your side can act on it and there is no
            #   replacement. Stop reading it.
            #
            #   @return [String, nil]
            optional :csp_id, String, nil?: true

            # @!attribute identity_status
            #
            #   @return [Symbol, Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus, nil]
            optional :identity_status,
                     enum: -> { Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus },
                     nil?: true

            # @!attribute is_inherited
            #   Whether this brand is inherited from the parent organization
            #
            #   @return [Boolean, nil]
            optional :is_inherited, Sentdm::Internal::Type::Boolean

            # @!attribute status
            #
            #   @return [Symbol, Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status, nil]
            optional :status,
                     enum: -> { Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status },
                     nil?: true

            # @!attribute submitted_at
            #   When the brand was submitted to TCR
            #
            #   @return [Time, nil]
            optional :submitted_at, Time, nil?: true

            # @!attribute submitted_to_tcr
            #   Whether this brand has been submitted to TCR
            #
            #   @return [Boolean, nil]
            optional :submitted_to_tcr, Sentdm::Internal::Type::Boolean

            # @!attribute tcr_brand_id
            #   TCR brand ID (populated after TCR submission)
            #
            #   @return [String, nil]
            optional :tcr_brand_id, String, nil?: true

            # @!attribute universal_ein
            #   Universal EIN from TCR
            #
            #   @return [String, nil]
            optional :universal_ein, String, nil?: true

            # @!attribute updated_at
            #   When the brand was last updated
            #
            #   @return [Time, nil]
            optional :updated_at, Time, nil?: true

            # @!method initialize(id: nil, business: nil, compliance: nil, contact: nil, created_at: nil, csp_id: nil, identity_status: nil, is_inherited: nil, status: nil, submitted_at: nil, submitted_to_tcr: nil, tcr_brand_id: nil, universal_ein: nil, updated_at: nil)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::ProfileListResponse::Data::Profile::Brand} for more details.
            #
            #   Brand response with nested contact, business, and compliance sections — mirrors
            #   the request structure.
            #
            #   @param id [String] Unique identifier for the brand
            #
            #   @param business [Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Business, nil] Business details and address information
            #
            #   @param compliance [Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Compliance, nil] Compliance and TCR-related information
            #
            #   @param contact [Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Contact, nil] Contact information for the brand
            #
            #   @param created_at [Time] When the brand was created
            #
            #   @param csp_id [String, nil] Deprecated and scheduled for removal. Identifies the Campaign Service Provider t
            #
            #   @param identity_status [Symbol, Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus, nil]
            #
            #   @param is_inherited [Boolean] Whether this brand is inherited from the parent organization
            #
            #   @param status [Symbol, Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status, nil]
            #
            #   @param submitted_at [Time, nil] When the brand was submitted to TCR
            #
            #   @param submitted_to_tcr [Boolean] Whether this brand has been submitted to TCR
            #
            #   @param tcr_brand_id [String, nil] TCR brand ID (populated after TCR submission)
            #
            #   @param universal_ein [String, nil] Universal EIN from TCR
            #
            #   @param updated_at [Time, nil] When the brand was last updated

            # @see Sentdm::Models::ProfileListResponse::Data::Profile::Brand#business
            class Business < Sentdm::Internal::Type::BaseModel
              # @!attribute city
              #   City
              #
              #   @return [String, nil]
              optional :city, String, nil?: true

              # @!attribute country
              #   Country code (e.g., US, CA)
              #
              #   @return [String, nil]
              optional :country, String, nil?: true

              # @!attribute country_of_registration
              #   Country where the business is registered
              #
              #   @return [String, nil]
              optional :country_of_registration, String, nil?: true

              # @!attribute entity_type
              #   Business entity type
              #
              #   @return [String, nil]
              optional :entity_type, String, nil?: true

              # @!attribute legal_name
              #   Legal business name
              #
              #   @return [String, nil]
              optional :legal_name, String, nil?: true

              # @!attribute postal_code
              #   Postal/ZIP code
              #
              #   @return [String, nil]
              optional :postal_code, String, nil?: true

              # @!attribute state
              #   State/province code
              #
              #   @return [String, nil]
              optional :state, String, nil?: true

              # @!attribute street
              #   Street address
              #
              #   @return [String, nil]
              optional :street, String, nil?: true

              # @!attribute tax_id
              #   Tax ID/EIN number
              #
              #   @return [String, nil]
              optional :tax_id, String, nil?: true

              # @!attribute tax_id_type
              #   Type of tax ID (e.g., us_ein, ca_bn)
              #
              #   @return [String, nil]
              optional :tax_id_type, String, nil?: true

              # @!attribute url
              #   Business website URL
              #
              #   @return [String, nil]
              optional :url, String, nil?: true

              # @!method initialize(city: nil, country: nil, country_of_registration: nil, entity_type: nil, legal_name: nil, postal_code: nil, state: nil, street: nil, tax_id: nil, tax_id_type: nil, url: nil)
              #   Business details and address information
              #
              #   @param city [String, nil] City
              #
              #   @param country [String, nil] Country code (e.g., US, CA)
              #
              #   @param country_of_registration [String, nil] Country where the business is registered
              #
              #   @param entity_type [String, nil] Business entity type
              #
              #   @param legal_name [String, nil] Legal business name
              #
              #   @param postal_code [String, nil] Postal/ZIP code
              #
              #   @param state [String, nil] State/province code
              #
              #   @param street [String, nil] Street address
              #
              #   @param tax_id [String, nil] Tax ID/EIN number
              #
              #   @param tax_id_type [String, nil] Type of tax ID (e.g., us_ein, ca_bn)
              #
              #   @param url [String, nil] Business website URL
            end

            # @see Sentdm::Models::ProfileListResponse::Data::Profile::Brand#compliance
            class Compliance < Sentdm::Internal::Type::BaseModel
              # @!attribute brand_relationship
              #
              #   @return [Symbol, Sentdm::Models::TcrBrandRelationship, nil]
              optional :brand_relationship, enum: -> { Sentdm::TcrBrandRelationship }, nil?: true

              # @!attribute destination_countries
              #   List of destination countries for messaging
              #
              #   @return [Array<Sentdm::Models::DestinationCountry>, nil]
              optional :destination_countries, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::DestinationCountry] }

              # @!attribute is_tcr_application
              #   Whether this is a TCR (Campaign Registry) application
              #
              #   @return [Boolean, nil]
              optional :is_tcr_application, Sentdm::Internal::Type::Boolean

              # @!attribute notes
              #   Additional notes about the business or use case
              #
              #   @return [String, nil]
              optional :notes, String, nil?: true

              # @!attribute phone_number_prefix
              #   Phone number prefix for messaging (e.g., "+1")
              #
              #   @return [String, nil]
              optional :phone_number_prefix, String, nil?: true

              # @!attribute primary_use_case
              #   @deprecated
              #
              #   Always null. The brand's free-text primary use case is no longer stored: it
              #   reached neither TCR nor any decision, and its column is dropped with no
              #   backfill, because the values were prose and the typed equivalent is the
              #   campaign's MessagingUseCaseUS.
              #
              #   Retained so existing v3 clients reading primary_use_case keep deserializing.
              #   Unlike the profile sharing flags, which can answer false truthfully, there is no
              #   value to report here — the field is present and empty rather than present and
              #   wrong.
              #
              #   @return [String, nil]
              optional :primary_use_case, String, nil?: true

              # @!attribute vertical
              #
              #   @return [Symbol, Sentdm::Models::TcrVertical, nil]
              optional :vertical, enum: -> { Sentdm::TcrVertical }, nil?: true

              # @!method initialize(brand_relationship: nil, destination_countries: nil, is_tcr_application: nil, notes: nil, phone_number_prefix: nil, primary_use_case: nil, vertical: nil)
              #   Some parameter documentations has been truncated, see
              #   {Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Compliance} for more
              #   details.
              #
              #   Compliance and TCR-related information
              #
              #   @param brand_relationship [Symbol, Sentdm::Models::TcrBrandRelationship, nil]
              #
              #   @param destination_countries [Array<Sentdm::Models::DestinationCountry>] List of destination countries for messaging
              #
              #   @param is_tcr_application [Boolean] Whether this is a TCR (Campaign Registry) application
              #
              #   @param notes [String, nil] Additional notes about the business or use case
              #
              #   @param phone_number_prefix [String, nil] Phone number prefix for messaging (e.g., "+1")
              #
              #   @param primary_use_case [String, nil] Always null. The brand's free-text primary use case is no longer stored: it reac
              #
              #   @param vertical [Symbol, Sentdm::Models::TcrVertical, nil]
            end

            # @see Sentdm::Models::ProfileListResponse::Data::Profile::Brand#contact
            class Contact < Sentdm::Internal::Type::BaseModel
              # @!attribute business_name
              #   Business/brand name
              #
              #   @return [String, nil]
              optional :business_name, String, nil?: true

              # @!attribute email
              #   Contact email address
              #
              #   @return [String, nil]
              optional :email, String, nil?: true

              # @!attribute name
              #   Primary contact name
              #
              #   @return [String, nil]
              optional :name, String

              # @!attribute phone
              #   Contact phone number in E.164 format
              #
              #   @return [String, nil]
              optional :phone, String, nil?: true

              # @!attribute phone_country_code
              #   Contact phone country code (e.g., "1" for US)
              #
              #   @return [String, nil]
              optional :phone_country_code, String, nil?: true

              # @!attribute role
              #   Contact's role in the business
              #
              #   @return [String, nil]
              optional :role, String, nil?: true

              # @!method initialize(business_name: nil, email: nil, name: nil, phone: nil, phone_country_code: nil, role: nil)
              #   Contact information for the brand
              #
              #   @param business_name [String, nil] Business/brand name
              #
              #   @param email [String, nil] Contact email address
              #
              #   @param name [String] Primary contact name
              #
              #   @param phone [String, nil] Contact phone number in E.164 format
              #
              #   @param phone_country_code [String, nil] Contact phone country code (e.g., "1" for US)
              #
              #   @param role [String, nil] Contact's role in the business
            end

            # @see Sentdm::Models::ProfileListResponse::Data::Profile::Brand#identity_status
            module IdentityStatus
              extend Sentdm::Internal::Type::Enum

              SELF_DECLARED = :SELF_DECLARED
              UNVERIFIED = :UNVERIFIED
              VERIFIED = :VERIFIED
              VETTED_VERIFIED = :VETTED_VERIFIED

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Sentdm::Models::ProfileListResponse::Data::Profile::Brand#status
            module Status
              extend Sentdm::Internal::Type::Enum

              ACTIVE = :ACTIVE
              INACTIVE = :INACTIVE
              SUSPENDED = :SUSPENDED

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end

      # @see Sentdm::Models::ProfileListResponse#error
      class Error < Sentdm::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @return [String, nil]
        optional :code, String

        # @!attribute details
        #   Additional validation error details (field-level errors)
        #
        #   @return [Hash{Symbol=>Array<String>}, nil]
        optional :details, Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]], nil?: true

        # @!attribute doc_url
        #   URL to documentation about this error
        #
        #   @return [String, nil]
        optional :doc_url, String, nil?: true

        # @!attribute message
        #   Human-readable error message
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(code: nil, details: nil, doc_url: nil, message: nil)
        #   Error information
        #
        #   @param code [String] Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @param details [Hash{Symbol=>Array<String>}, nil] Additional validation error details (field-level errors)
        #
        #   @param doc_url [String, nil] URL to documentation about this error
        #
        #   @param message [String] Human-readable error message
      end

      # @see Sentdm::Models::ProfileListResponse#meta
      class Meta < Sentdm::Internal::Type::BaseModel
        # @!attribute request_id
        #   Unique identifier for this request (for tracing and support)
        #
        #   @return [String, nil]
        optional :request_id, String

        # @!attribute timestamp
        #   Server timestamp when the response was generated
        #
        #   @return [Time, nil]
        optional :timestamp, Time

        # @!attribute version
        #   API version used for this request
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(request_id: nil, timestamp: nil, version: nil)
        #   Request and response metadata
        #
        #   @param request_id [String] Unique identifier for this request (for tracing and support)
        #
        #   @param timestamp [Time] Server timestamp when the response was generated
        #
        #   @param version [String] API version used for this request
      end
    end
  end
end
