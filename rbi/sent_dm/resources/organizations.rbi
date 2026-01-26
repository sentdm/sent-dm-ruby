# typed: strong

module SentDm
  module Resources
    class Organizations
      sig { returns(SentDm::Resources::Organizations::Users) }
      attr_reader :users

      # Retrieves all organizations that the authenticated user has access to, including
      # the sender profiles within each organization that the user can access. Returns
      # organization details with nested profiles filtered by user permissions.
      sig do
        params(request_options: SentDm::RequestOptions::OrHash).returns(
          SentDm::Models::OrganizationListResponse
        )
      end
      def list(request_options: {})
      end

      # Retrieves all sender profiles within an organization that the authenticated user
      # has access to. Returns filtered list based on user's permissions.
      sig do
        params(
          org_id: String,
          x_api_key: String,
          x_sender_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::Models::OrganizationRetrieveProfilesResponse)
      end
      def retrieve_profiles(
        org_id,
        x_api_key:,
        x_sender_id:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SentDm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
