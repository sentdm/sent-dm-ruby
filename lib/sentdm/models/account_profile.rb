# frozen_string_literal: true

module Sentdm
  module Models
    class AccountProfile < Sentdm::Internal::Type::BaseModel
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
      #   {Sentdm::Models::AccountProfile} for more details.
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
