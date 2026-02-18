# frozen_string_literal: true

module Sentdm
  module Resources
    class Users
      # Retrieves detailed information about a specific user in an organization or
      # profile. Requires developer role or higher.
      #
      # @overload retrieve(user_id, request_options: {})
      #
      # @param user_id [String]
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfUser]
      #
      # @see Sentdm::Models::UserRetrieveParams
      def retrieve(user_id, params = {})
        @client.request(
          method: :get,
          path: ["v3/users/%1$s", user_id],
          model: Sentdm::APIResponseOfUser,
          options: params[:request_options]
        )
      end

      # Retrieves all users who have access to the organization or profile identified by
      # the API key, including their roles and status. Shows invited users (pending
      # acceptance) and active users. Requires developer role or higher.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::UserListResponse]
      #
      # @see Sentdm::Models::UserListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v3/users",
          model: Sentdm::Models::UserListResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::UserInviteParams} for more details.
      #
      # Sends an invitation to a user to join the organization or profile with a
      # specific role. Requires admin role. The user will receive an invitation email
      # with a token to accept. Invitation tokens expire after 7 days.
      #
      # @overload invite(email: nil, name: nil, role: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param email [String] Body param: User email address (required)
      #
      # @param name [String] Body param: User full name (required)
      #
      # @param role [String] Body param: User role: admin, billing, or developer (required)
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfUser]
      #
      # @see Sentdm::Models::UserInviteParams
      def invite(params = {})
        parsed, options = Sentdm::UserInviteParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
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
      # @overload remove(path_user_id, test_mode: nil, body_user_id: nil, request_options: {})
      #
      # @param path_user_id [String]
      #
      # @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      # @param body_user_id [String] User ID from route parameter
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Sentdm::Models::UserRemoveParams
      def remove(path_user_id, params = {})
        parsed, options = Sentdm::UserRemoveParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v3/users/%1$s", path_user_id],
          headers: {"content-type" => "*/*"},
          body: parsed,
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
      # @overload update_role(path_user_id, role: nil, test_mode: nil, body_user_id: nil, idempotency_key: nil, request_options: {})
      #
      # @param path_user_id [String] Path param
      #
      # @param role [String] Body param: User role: admin, billing, or developer (required)
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param body_user_id [String] Body param: User ID from route parameter
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfUser]
      #
      # @see Sentdm::Models::UserUpdateRoleParams
      def update_role(path_user_id, params = {})
        parsed, options = Sentdm::UserUpdateRoleParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :patch,
          path: ["v3/users/%1$s", path_user_id],
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
