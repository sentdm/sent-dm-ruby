# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Me#retrieve
    class MeRetrieveResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Account response for GET /v3/me endpoint. Returns organization (with profiles),
      #   user (standalone), or profile (child of an organization) data depending on the
      #   API key type. Always includes messaging channel configuration.
      #
      #   @return [Sentdm::Models::MeRetrieveResponse::Data, nil]
      optional :data, -> { Sentdm::Models::MeRetrieveResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::MeRetrieveResponse::Error, nil]
      optional :error, -> { Sentdm::Models::MeRetrieveResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::MeRetrieveResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::MeRetrieveResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MeRetrieveResponse} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::MeRetrieveResponse::Data, nil] Account response for GET /v3/me endpoint.
      #
      #   @param error [Sentdm::Models::MeRetrieveResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::MeRetrieveResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::MeRetrieveResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute id
        #   Customer ID (organization, account, or profile)
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute channels
        #   Messaging channel configuration. All three channels are always present. Each
        #   channel has a "configured" flag; configured channels expose additional details.
        #
        #   @return [Sentdm::Models::MeRetrieveResponse::Data::Channels, nil]
        optional :channels, -> { Sentdm::Models::MeRetrieveResponse::Data::Channels }

        # @!attribute created_at
        #   When the account was created
        #
        #   @return [Time, nil]
        optional :created_at, Time

        # @!attribute description
        #   Account description
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute email
        #   Contact email address
        #
        #   @return [String, nil]
        optional :email, String, nil?: true

        # @!attribute icon
        #   Account icon URL
        #
        #   @return [String, nil]
        optional :icon, String, nil?: true

        # @!attribute name
        #   Account name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute organization_id
        #   Organization ID (only for profile type — the parent organization)
        #
        #   @return [String, nil]
        optional :organization_id, String, nil?: true

        # @!attribute profiles
        #   List of profiles (populated for organization type, empty for user and profile
        #   types)
        #
        #   @return [Array<Sentdm::Models::MeRetrieveResponse::Data::Profile>, nil]
        optional :profiles,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::MeRetrieveResponse::Data::Profile] }

        # @!attribute settings
        #   Profile configuration settings
        #
        #   @return [Sentdm::Models::MeRetrieveResponse::Data::Settings, nil]
        optional :settings, -> { Sentdm::Models::MeRetrieveResponse::Data::Settings }, nil?: true

        # @!attribute short_name
        #   Short name / abbreviation (only for profile type)
        #
        #   @return [String, nil]
        optional :short_name, String, nil?: true

        # @!attribute status
        #   Profile status (only for profile type): incomplete, pending_review, approved,
        #   etc.
        #
        #   @return [String, nil]
        optional :status, String, nil?: true

        # @!attribute type
        #   Account type: "organization" (has profiles), "user" (no profiles), or "profile"
        #   (child of an organization)
        #
        #   @return [String, nil]
        optional :type, String

        # @!method initialize(id: nil, channels: nil, created_at: nil, description: nil, email: nil, icon: nil, name: nil, organization_id: nil, profiles: nil, settings: nil, short_name: nil, status: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::MeRetrieveResponse::Data} for more details.
        #
        #   Account response for GET /v3/me endpoint. Returns organization (with profiles),
        #   user (standalone), or profile (child of an organization) data depending on the
        #   API key type. Always includes messaging channel configuration.
        #
        #   @param id [String] Customer ID (organization, account, or profile)
        #
        #   @param channels [Sentdm::Models::MeRetrieveResponse::Data::Channels] Messaging channel configuration. All three channels are always present.
        #
        #   @param created_at [Time] When the account was created
        #
        #   @param description [String, nil] Account description
        #
        #   @param email [String, nil] Contact email address
        #
        #   @param icon [String, nil] Account icon URL
        #
        #   @param name [String] Account name
        #
        #   @param organization_id [String, nil] Organization ID (only for profile type — the parent organization)
        #
        #   @param profiles [Array<Sentdm::Models::MeRetrieveResponse::Data::Profile>] List of profiles (populated for organization type, empty for user and profile ty
        #
        #   @param settings [Sentdm::Models::MeRetrieveResponse::Data::Settings, nil] Profile configuration settings
        #
        #   @param short_name [String, nil] Short name / abbreviation (only for profile type)
        #
        #   @param status [String, nil] Profile status (only for profile type): incomplete, pending_review, approved, et
        #
        #   @param type [String] Account type: "organization" (has profiles), "user" (no profiles), or "profile"

        # @see Sentdm::Models::MeRetrieveResponse::Data#channels
        class Channels < Sentdm::Internal::Type::BaseModel
          # @!attribute rcs
          #   RCS channel configuration. When configured, includes the RCS phone number.
          #
          #   @return [Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs, nil]
          optional :rcs, -> { Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs }

          # @!attribute sms
          #   SMS channel configuration. When configured, includes the sending phone number.
          #
          #   @return [Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS, nil]
          optional :sms, -> { Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS }

          # @!attribute whatsapp
          #   WhatsApp Business channel configuration. When configured, includes the WhatsApp
          #   phone number and business name.
          #
          #   @return [Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp, nil]
          optional :whatsapp, -> { Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp }

          # @!method initialize(rcs: nil, sms: nil, whatsapp: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::MeRetrieveResponse::Data::Channels} for more details.
          #
          #   Messaging channel configuration. All three channels are always present. Each
          #   channel has a "configured" flag; configured channels expose additional details.
          #
          #   @param rcs [Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs] RCS channel configuration. When configured, includes the RCS phone number.
          #
          #   @param sms [Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS] SMS channel configuration. When configured, includes the sending phone number.
          #
          #   @param whatsapp [Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp] WhatsApp Business channel configuration. When configured, includes the WhatsApp

          # @see Sentdm::Models::MeRetrieveResponse::Data::Channels#rcs
          class Rcs < Sentdm::Internal::Type::BaseModel
            # @!attribute configured
            #   Whether RCS is configured for this account
            #
            #   @return [Boolean, nil]
            optional :configured, Sentdm::Internal::Type::Boolean

            # @!attribute phone_number
            #   RCS-enabled phone number in E.164 format
            #
            #   @return [String, nil]
            optional :phone_number, String, nil?: true

            # @!method initialize(configured: nil, phone_number: nil)
            #   RCS channel configuration. When configured, includes the RCS phone number.
            #
            #   @param configured [Boolean] Whether RCS is configured for this account
            #
            #   @param phone_number [String, nil] RCS-enabled phone number in E.164 format
          end

          # @see Sentdm::Models::MeRetrieveResponse::Data::Channels#sms
          class SMS < Sentdm::Internal::Type::BaseModel
            # @!attribute configured
            #   Whether SMS is configured for this account
            #
            #   @return [Boolean, nil]
            optional :configured, Sentdm::Internal::Type::Boolean

            # @!attribute phone_number
            #   Sending phone number in E.164 format
            #
            #   @return [String, nil]
            optional :phone_number, String, nil?: true

            # @!method initialize(configured: nil, phone_number: nil)
            #   SMS channel configuration. When configured, includes the sending phone number.
            #
            #   @param configured [Boolean] Whether SMS is configured for this account
            #
            #   @param phone_number [String, nil] Sending phone number in E.164 format
          end

          # @see Sentdm::Models::MeRetrieveResponse::Data::Channels#whatsapp
          class Whatsapp < Sentdm::Internal::Type::BaseModel
            # @!attribute business_name
            #   WhatsApp Business display name
            #
            #   @return [String, nil]
            optional :business_name, String, nil?: true

            # @!attribute configured
            #   Whether WhatsApp is configured for this account
            #
            #   @return [Boolean, nil]
            optional :configured, Sentdm::Internal::Type::Boolean

            # @!attribute phone_number
            #   WhatsApp phone number in E.164 format
            #
            #   @return [String, nil]
            optional :phone_number, String, nil?: true

            # @!method initialize(business_name: nil, configured: nil, phone_number: nil)
            #   WhatsApp Business channel configuration. When configured, includes the WhatsApp
            #   phone number and business name.
            #
            #   @param business_name [String, nil] WhatsApp Business display name
            #
            #   @param configured [Boolean] Whether WhatsApp is configured for this account
            #
            #   @param phone_number [String, nil] WhatsApp phone number in E.164 format
          end
        end

        class Profile < Sentdm::Internal::Type::BaseModel
          # @!attribute id
          #   Profile unique identifier
          #
          #   @return [String, nil]
          optional :id, String

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

          # @!attribute icon
          #   Profile icon URL
          #
          #   @return [String, nil]
          optional :icon, String, nil?: true

          # @!attribute name
          #   Profile name
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute role
          #   User's role in this profile: admin, billing, developer (inherited from
          #   organization if not explicitly set)
          #
          #   @return [String, nil]
          optional :role, String, nil?: true

          # @!attribute settings
          #   Profile configuration settings
          #
          #   @return [Sentdm::Models::MeRetrieveResponse::Data::Profile::Settings, nil]
          optional :settings, -> { Sentdm::Models::MeRetrieveResponse::Data::Profile::Settings }

          # @!attribute short_name
          #   Profile short name (abbreviation)
          #
          #   @return [String, nil]
          optional :short_name, String, nil?: true

          # @!attribute status
          #   Profile setup status: incomplete, pending_review, approved, rejected
          #
          #   @return [String, nil]
          optional :status, String, nil?: true

          # @!method initialize(id: nil, created_at: nil, description: nil, icon: nil, name: nil, role: nil, settings: nil, short_name: nil, status: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::MeRetrieveResponse::Data::Profile} for more details.
          #
          #   Profile (sender profile) response for v3 API
          #
          #   @param id [String] Profile unique identifier
          #
          #   @param created_at [Time] When the profile was created
          #
          #   @param description [String, nil] Profile description
          #
          #   @param icon [String, nil] Profile icon URL
          #
          #   @param name [String] Profile name
          #
          #   @param role [String, nil] User's role in this profile: admin, billing, developer (inherited from organizat
          #
          #   @param settings [Sentdm::Models::MeRetrieveResponse::Data::Profile::Settings] Profile configuration settings
          #
          #   @param short_name [String, nil] Profile short name (abbreviation)
          #
          #   @param status [String, nil] Profile setup status: incomplete, pending_review, approved, rejected

          # @see Sentdm::Models::MeRetrieveResponse::Data::Profile#settings
          class Settings < Sentdm::Internal::Type::BaseModel
            # @!attribute allow_contact_sharing
            #   Whether contacts are shared across profiles in the organization
            #
            #   @return [Boolean, nil]
            optional :allow_contact_sharing, Sentdm::Internal::Type::Boolean, nil?: true

            # @!attribute allow_template_sharing
            #   Whether templates are shared across profiles in the organization
            #
            #   @return [Boolean, nil]
            optional :allow_template_sharing, Sentdm::Internal::Type::Boolean, nil?: true

            # @!attribute billing_model
            #   Billing model: profile, organization, or profile_and_organization
            #
            #   @return [String, nil]
            optional :billing_model, String, nil?: true

            # @!attribute inherit_contacts
            #   Whether this profile inherits contacts from the organization
            #
            #   @return [Boolean, nil]
            optional :inherit_contacts, Sentdm::Internal::Type::Boolean, nil?: true

            # @!attribute inherit_tcr_brand
            #   Whether this profile inherits TCR brand from the organization
            #
            #   @return [Boolean, nil]
            optional :inherit_tcr_brand, Sentdm::Internal::Type::Boolean, nil?: true

            # @!attribute inherit_tcr_campaign
            #   Whether this profile inherits TCR campaign from the organization
            #
            #   @return [Boolean, nil]
            optional :inherit_tcr_campaign, Sentdm::Internal::Type::Boolean, nil?: true

            # @!attribute inherit_templates
            #   Whether this profile inherits templates from the organization
            #
            #   @return [Boolean, nil]
            optional :inherit_templates, Sentdm::Internal::Type::Boolean, nil?: true

            # @!method initialize(allow_contact_sharing: nil, allow_template_sharing: nil, billing_model: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil)
            #   Profile configuration settings
            #
            #   @param allow_contact_sharing [Boolean, nil] Whether contacts are shared across profiles in the organization
            #
            #   @param allow_template_sharing [Boolean, nil] Whether templates are shared across profiles in the organization
            #
            #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization
            #
            #   @param inherit_contacts [Boolean, nil] Whether this profile inherits contacts from the organization
            #
            #   @param inherit_tcr_brand [Boolean, nil] Whether this profile inherits TCR brand from the organization
            #
            #   @param inherit_tcr_campaign [Boolean, nil] Whether this profile inherits TCR campaign from the organization
            #
            #   @param inherit_templates [Boolean, nil] Whether this profile inherits templates from the organization
          end
        end

        # @see Sentdm::Models::MeRetrieveResponse::Data#settings
        class Settings < Sentdm::Internal::Type::BaseModel
          # @!attribute allow_contact_sharing
          #   Whether contacts are shared across profiles in the organization
          #
          #   @return [Boolean, nil]
          optional :allow_contact_sharing, Sentdm::Internal::Type::Boolean, nil?: true

          # @!attribute allow_template_sharing
          #   Whether templates are shared across profiles in the organization
          #
          #   @return [Boolean, nil]
          optional :allow_template_sharing, Sentdm::Internal::Type::Boolean, nil?: true

          # @!attribute billing_model
          #   Billing model: profile, organization, or profile_and_organization
          #
          #   @return [String, nil]
          optional :billing_model, String, nil?: true

          # @!attribute inherit_contacts
          #   Whether this profile inherits contacts from the organization
          #
          #   @return [Boolean, nil]
          optional :inherit_contacts, Sentdm::Internal::Type::Boolean, nil?: true

          # @!attribute inherit_tcr_brand
          #   Whether this profile inherits TCR brand from the organization
          #
          #   @return [Boolean, nil]
          optional :inherit_tcr_brand, Sentdm::Internal::Type::Boolean, nil?: true

          # @!attribute inherit_tcr_campaign
          #   Whether this profile inherits TCR campaign from the organization
          #
          #   @return [Boolean, nil]
          optional :inherit_tcr_campaign, Sentdm::Internal::Type::Boolean, nil?: true

          # @!attribute inherit_templates
          #   Whether this profile inherits templates from the organization
          #
          #   @return [Boolean, nil]
          optional :inherit_templates, Sentdm::Internal::Type::Boolean, nil?: true

          # @!method initialize(allow_contact_sharing: nil, allow_template_sharing: nil, billing_model: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil)
          #   Profile configuration settings
          #
          #   @param allow_contact_sharing [Boolean, nil] Whether contacts are shared across profiles in the organization
          #
          #   @param allow_template_sharing [Boolean, nil] Whether templates are shared across profiles in the organization
          #
          #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization
          #
          #   @param inherit_contacts [Boolean, nil] Whether this profile inherits contacts from the organization
          #
          #   @param inherit_tcr_brand [Boolean, nil] Whether this profile inherits TCR brand from the organization
          #
          #   @param inherit_tcr_campaign [Boolean, nil] Whether this profile inherits TCR campaign from the organization
          #
          #   @param inherit_templates [Boolean, nil] Whether this profile inherits templates from the organization
        end
      end

      # @see Sentdm::Models::MeRetrieveResponse#error
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

      # @see Sentdm::Models::MeRetrieveResponse#meta
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
