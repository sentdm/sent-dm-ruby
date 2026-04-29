# frozen_string_literal: true

module Sentdm
  module Resources
    # Invite, update, and manage organization users and roles
    class Users
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::UserRetrieveParams} for more details.
      #
      # Retrieves detailed information about a specific user in an organization or
      # profile. Requires developer role or higher.
      #
      # @overload retrieve(user_id, x_profile_id: nil, request_options: {})
      #
      # @param user_id [String]
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfUser]
      #
      # @see Sentdm::Models::UserRetrieveParams
      def retrieve(user_id, params = {})
        parsed, options = Sentdm::UserRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/users/%1$s", user_id],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::APIResponseOfUser,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::UserListParams} for more details.
      #
      # Retrieves all users who have access to the organization or profile identified by
      # the API key, including their roles and status. Shows invited users (pending
      # acceptance) and active users. Requires developer role or higher.
      #
      # @overload list(x_profile_id: nil, request_options: {})
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::UserListResponse]
      #
      # @see Sentdm::Models::UserListParams
      def list(params = {})
        parsed, options = Sentdm::UserListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v3/users",
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::UserListResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::UserInviteParams} for more details.
      #
      # Sends an invitation to a user to join the organization or profile with a
      # specific role. Requires admin role. The user will receive an invitation email
      # with a token to accept. Invitation tokens expire after 7 days.
      #
      # @overload invite(email: nil, name: nil, role: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param email [String] Body param: User email address (required)
      #
      # @param name [String] Body param: User full name (required)
      #
      # @param role [String] Body param: User role: admin, billing, or developer (required)
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfUser]
      #
      # @see Sentdm::Models::UserInviteParams
      def invite(params = {})
        parsed, options = Sentdm::UserInviteParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: "v3/users",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseOfUser,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::UserRemoveParams} for more details.
      #
      # Removes a user's access to an organization or profile. Requires admin role. You
      # cannot remove yourself or remove the last admin.
      #
      # @overload remove(user_id, sandbox: nil, x_profile_id: nil, request_options: {})
      #
      # @param user_id [String] Path param
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Sentdm::Models::UserRemoveParams
      def remove(user_id, params = {})
        parsed, options = Sentdm::UserRemoveParams.dump_request(params)
        header_params = {x_profile_id: "x-profile-id"}
        @client.request(
          method: :delete,
          path: ["v3/users/%1$s", user_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::UserUpdateRoleParams} for more details.
      #
      # Updates a user's role in the organization or profile. Requires admin role. You
      # cannot change your own role or demote the last admin.
      #
      # @overload update_role(user_id, role: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param user_id [String] Path param
      #
      # @param role [String] Body param: User role: admin, billing, or developer (required)
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfUser]
      #
      # @see Sentdm::Models::UserUpdateRoleParams
      def update_role(user_id, params = {})
        parsed, options = Sentdm::UserUpdateRoleParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :patch,
          path: ["v3/users/%1$s", user_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseOfUser,
          options: options
        )
      end

      # @api private
      #
      # @param client [Sentdm::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
