# frozen_string_literal: true

module Sentdm
  module Resources
    class Organizations
      # @return [Sentdm::Resources::Organizations::Users]
      attr_reader :users

      # Retrieves all organizations that the authenticated user has access to, including
      # the sender profiles within each organization that the user can access. Returns
      # organization details with nested profiles filtered by user permissions.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::OrganizationListResponse]
      #
      # @see Sentdm::Models::OrganizationListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v2/organizations",
          model: Sentdm::Models::OrganizationListResponse,
          options: params[:request_options]
        )
      end

      # Retrieves all sender profiles within an organization that the authenticated user
      # has access to. Returns filtered list based on user's permissions.
      #
      # @overload retrieve_profiles(org_id, request_options: {})
      #
      # @param org_id [String]
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::OrganizationRetrieveProfilesResponse]
      #
      # @see Sentdm::Models::OrganizationRetrieveProfilesParams
      def retrieve_profiles(org_id, params = {})
        @client.request(
          method: :get,
          path: ["v2/organizations/%1$s/profiles", org_id],
          model: Sentdm::Models::OrganizationRetrieveProfilesResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Sentdm::Client]
      def initialize(client:)
        @client = client
        @users = Sentdm::Resources::Organizations::Users.new(client: client)
      end
    end
  end
end
