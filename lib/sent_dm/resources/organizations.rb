# frozen_string_literal: true

module SentDm
  module Resources
    class Organizations
      # @return [SentDm::Resources::Organizations::Users]
      attr_reader :users

      # Retrieves all organizations that the authenticated user has access to, including
      # the sender profiles within each organization that the user can access. Returns
      # organization details with nested profiles filtered by user permissions.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::OrganizationListResponse]
      #
      # @see SentDm::Models::OrganizationListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v2/organizations",
          model: SentDm::Models::OrganizationListResponse,
          options: params[:request_options]
        )
      end

      # Retrieves all sender profiles within an organization that the authenticated user
      # has access to. Returns filtered list based on user's permissions.
      #
      # @overload retrieve_profiles(org_id, x_api_key:, x_sender_id:, request_options: {})
      #
      # @param org_id [String]
      # @param x_api_key [String]
      # @param x_sender_id [String]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::OrganizationRetrieveProfilesResponse]
      #
      # @see SentDm::Models::OrganizationRetrieveProfilesParams
      def retrieve_profiles(org_id, params)
        parsed, options = SentDm::OrganizationRetrieveProfilesParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v2/organizations/%1$s/profiles", org_id],
          headers: parsed.transform_keys(x_api_key: "x-api-key", x_sender_id: "x-sender-id"),
          model: SentDm::Models::OrganizationRetrieveProfilesResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [SentDm::Client]
      def initialize(client:)
        @client = client
        @users = SentDm::Resources::Organizations::Users.new(client: client)
      end
    end
  end
end
