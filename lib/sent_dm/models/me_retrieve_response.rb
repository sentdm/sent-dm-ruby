# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Me#retrieve
    class MeRetrieveResponse < SentDm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [SentDm::Models::MeRetrieveResponse::Data, nil]
      optional :data, -> { SentDm::Models::MeRetrieveResponse::Data }, nil?: true

      # @!attribute error
      #   Error details (null if successful)
      #
      #   @return [SentDm::Models::APIError, nil]
      optional :error, -> { SentDm::APIError }, nil?: true

      # @!attribute meta
      #   Metadata about the request and response
      #
      #   @return [SentDm::Models::APIMeta, nil]
      optional :meta, -> { SentDm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, SentDm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [SentDm::Models::MeRetrieveResponse::Data, nil] The response data (null if error)
      #
      #   @param error [SentDm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [SentDm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see SentDm::Models::MeRetrieveResponse#data
      class Data < SentDm::Internal::Type::BaseModel
        # @!attribute id
        #   Customer ID (organization or profile)
        #
        #   @return [String, nil]
        optional :id, String

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

        # @!attribute profiles
        #   List of profiles (only for organization type)
        #
        #   @return [Array<SentDm::Models::MeRetrieveResponse::Data::Profile>, nil]
        optional :profiles,
                 -> { SentDm::Internal::Type::ArrayOf[SentDm::Models::MeRetrieveResponse::Data::Profile] },
                 nil?: true

        # @!attribute settings
        #   Profile settings (only for profile type)
        #
        #   @return [SentDm::Models::ProfileSettings, nil]
        optional :settings, -> { SentDm::ProfileSettings }, nil?: true

        # @!attribute status
        #   Profile status (only for profile type): incomplete, pending_review, approved,
        #   etc.
        #
        #   @return [String, nil]
        optional :status, String, nil?: true

        # @!method initialize(id: nil, created_at: nil, description: nil, icon: nil, name: nil, profiles: nil, settings: nil, status: nil)
        #   Some parameter documentations has been truncated, see
        #   {SentDm::Models::MeRetrieveResponse::Data} for more details.
        #
        #   The response data (null if error)
        #
        #   @param id [String] Customer ID (organization or profile)
        #
        #   @param created_at [Time] When the account was created
        #
        #   @param description [String, nil] Account description
        #
        #   @param icon [String, nil] Account icon URL
        #
        #   @param name [String] Account name
        #
        #   @param profiles [Array<SentDm::Models::MeRetrieveResponse::Data::Profile>, nil] List of profiles (only for organization type)
        #
        #   @param settings [SentDm::Models::ProfileSettings, nil] Profile settings (only for profile type)
        #
        #   @param status [String, nil] Profile status (only for profile type): incomplete, pending_review, approved, et

        class Profile < SentDm::Internal::Type::BaseModel
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
          #   @return [SentDm::Models::ProfileSettings, nil]
          optional :settings, -> { SentDm::ProfileSettings }

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
          #   {SentDm::Models::MeRetrieveResponse::Data::Profile} for more details.
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
          #   @param settings [SentDm::Models::ProfileSettings] Profile configuration settings
          #
          #   @param short_name [String, nil] Profile short name (abbreviation)
          #
          #   @param status [String, nil] Profile setup status: incomplete, pending_review, approved, rejected
        end
      end
    end
  end
end
