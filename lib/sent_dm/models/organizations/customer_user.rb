# frozen_string_literal: true

module SentDm
  module Models
    module Organizations
      # @see SentDm::Resources::Organizations::Users#retrieve
      class CustomerUser < SentDm::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :createdAt

        # @!attribute customer_id
        #
        #   @return [String, nil]
        optional :customer_id, String, api_name: :customerId

        # @!attribute email
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute invitation_sent_at
        #
        #   @return [Time, nil]
        optional :invitation_sent_at, Time, api_name: :invitationSentAt, nil?: true

        # @!attribute invitation_token
        #
        #   @return [String, nil]
        optional :invitation_token, String, api_name: :invitationToken, nil?: true

        # @!attribute invitation_token_expires_at
        #
        #   @return [Time, nil]
        optional :invitation_token_expires_at, Time, api_name: :invitationTokenExpiresAt, nil?: true

        # @!attribute last_login_at
        #
        #   @return [Time, nil]
        optional :last_login_at, Time, api_name: :lastLoginAt, nil?: true

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute role
        #
        #   @return [String, nil]
        optional :role, String

        # @!attribute status
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, api_name: :updatedAt, nil?: true

        # @!method initialize(id: nil, created_at: nil, customer_id: nil, email: nil, invitation_sent_at: nil, invitation_token: nil, invitation_token_expires_at: nil, last_login_at: nil, name: nil, role: nil, status: nil, updated_at: nil)
        #   @param id [String] Unique identifier
        #
        #   @param created_at [Time]
        #
        #   @param customer_id [String]
        #
        #   @param email [String]
        #
        #   @param invitation_sent_at [Time, nil]
        #
        #   @param invitation_token [String, nil]
        #
        #   @param invitation_token_expires_at [Time, nil]
        #
        #   @param last_login_at [Time, nil]
        #
        #   @param name [String]
        #
        #   @param role [String]
        #
        #   @param status [String]
        #
        #   @param updated_at [Time, nil]
      end
    end
  end
end
