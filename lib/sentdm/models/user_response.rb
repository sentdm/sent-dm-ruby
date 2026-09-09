# frozen_string_literal: true

module Sentdm
  module Models
    class UserResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   User unique identifier
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute created_at
      #   When the user was added to the organization
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute customer_id
      #   Which customer owns this — the key's own, or the profile named in x-profile-id.
      #   Says whose resource this is, which the resource's own id does not.
      #
      #   @return [String, nil]
      optional :customer_id, String

      # @!attribute email
      #   User email address
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute invited_at
      #   When the user was invited
      #
      #   @return [Time, nil]
      optional :invited_at, Time, nil?: true

      # @!attribute last_login_at
      #   When the user last logged in
      #
      #   @return [Time, nil]
      optional :last_login_at, Time, nil?: true

      # @!attribute name
      #   User full name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute role
      #   User role in the organization: admin, billing, developer
      #
      #   @return [String, nil]
      optional :role, String

      # @!attribute status
      #   User status: active, invited, suspended, rejected
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute updated_at
      #   When the user record was last updated
      #
      #   @return [Time, nil]
      optional :updated_at, Time, nil?: true

      # @!method initialize(id: nil, created_at: nil, customer_id: nil, email: nil, invited_at: nil, last_login_at: nil, name: nil, role: nil, status: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::UserResponse} for more details.
      #
      #   User response for v3 API
      #
      #   @param id [String] User unique identifier
      #
      #   @param created_at [Time] When the user was added to the organization
      #
      #   @param customer_id [String] Which customer owns this — the key's own, or the profile named in x-profile-id.
      #
      #   @param email [String] User email address
      #
      #   @param invited_at [Time, nil] When the user was invited
      #
      #   @param last_login_at [Time, nil] When the user last logged in
      #
      #   @param name [String] User full name
      #
      #   @param role [String] User role in the organization: admin, billing, developer
      #
      #   @param status [String] User status: active, invited, suspended, rejected
      #
      #   @param updated_at [Time, nil] When the user record was last updated
    end
  end
end
