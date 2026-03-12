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
      #   @return [Sentdm::Models::ErrorDetail, nil]
      optional :error, -> { Sentdm::ErrorDetail }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::APIMeta, nil]
      optional :meta, -> { Sentdm::APIMeta }

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
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
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
        #   @return [Sentdm::Models::ProfileSettings, nil]
        optional :settings, -> { Sentdm::ProfileSettings }, nil?: true

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
        #   @param settings [Sentdm::Models::ProfileSettings, nil] Profile configuration settings
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
          #   @return [Sentdm::Models::ProfileSettings, nil]
          optional :settings, -> { Sentdm::ProfileSettings }

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
          #   @param settings [Sentdm::Models::ProfileSettings] Profile configuration settings
          #
          #   @param short_name [String, nil] Profile short name (abbreviation)
          #
          #   @param status [String, nil] Profile setup status: incomplete, pending_review, approved, rejected
        end
      end
    end
  end
end
