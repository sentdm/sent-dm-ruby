# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Me#retrieve
    class MeRetrieveResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [Sentdm::Models::MeRetrieveResponse::Data, nil]
      optional :data, -> { Sentdm::Models::MeRetrieveResponse::Data }, nil?: true

      # @!attribute error
      #   Error details (null if successful)
      #
      #   @return [Sentdm::Models::APIError, nil]
      optional :error, -> { Sentdm::APIError }, nil?: true

      # @!attribute meta
      #   Metadata about the request and response
      #
      #   @return [Sentdm::Models::APIMeta, nil]
      optional :meta, -> { Sentdm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::MeRetrieveResponse::Data, nil] The response data (null if error)
      #
      #   @param error [Sentdm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [Sentdm::Models::APIMeta] Metadata about the request and response
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
        #   Messaging channel configuration
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
        #   Profile settings (only for profile type)
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
        #   The response data (null if error)
        #
        #   @param id [String] Customer ID (organization, account, or profile)
        #
        #   @param channels [Sentdm::Models::MeRetrieveResponse::Data::Channels] Messaging channel configuration
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
        #   @param settings [Sentdm::Models::ProfileSettings, nil] Profile settings (only for profile type)
        #
        #   @param short_name [String, nil] Short name / abbreviation (only for profile type)
        #
        #   @param status [String, nil] Profile status (only for profile type): incomplete, pending_review, approved, et
        #
        #   @param type [String] Account type: "organization" (has profiles), "user" (no profiles), or "profile"

        # @see Sentdm::Models::MeRetrieveResponse::Data#channels
        class Channels < Sentdm::Internal::Type::BaseModel
          # @!attribute rcs
          #   RCS channel (provider: vibes)
          #
          #   @return [Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs, nil]
          optional :rcs, -> { Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs }

          # @!attribute sms
          #   SMS channel (providers: telnyx, sinch)
          #
          #   @return [Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS, nil]
          optional :sms, -> { Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS }

          # @!attribute whatsapp
          #   WhatsApp Business channel (provider: meta)
          #
          #   @return [Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp, nil]
          optional :whatsapp, -> { Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp }

          # @!method initialize(rcs: nil, sms: nil, whatsapp: nil)
          #   Messaging channel configuration
          #
          #   @param rcs [Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs] RCS channel (provider: vibes)
          #
          #   @param sms [Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS] SMS channel (providers: telnyx, sinch)
          #
          #   @param whatsapp [Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp] WhatsApp Business channel (provider: meta)

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
            #   RCS channel (provider: vibes)
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
            #   SMS channel (providers: telnyx, sinch)
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
            #   WhatsApp Business channel (provider: meta)
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
