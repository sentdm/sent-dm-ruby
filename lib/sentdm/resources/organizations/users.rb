# frozen_string_literal: true

module Sentdm
  module Resources
    class Organizations
      class Users
        # Retrieves a specific user by their ID. Requires appropriate permissions. The
        # customerId can be either an organization ID or a profile ID.
        #
        # @overload retrieve(user_id, customer_id:, request_options: {})
        #
        # @param user_id [String]
        # @param customer_id [String]
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Organizations::CustomerUser]
        #
        # @see Sentdm::Models::Organizations::UserRetrieveParams
        def retrieve(user_id, params)
          parsed, options = Sentdm::Organizations::UserRetrieveParams.dump_request(params)
          customer_id =
            parsed.delete(:customer_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v2/organizations/%1$s/users/%2$s", customer_id, user_id],
            model: Sentdm::Organizations::CustomerUser,
            options: options
          )
        end

        # Retrieves all users associated with an organization or sender profile. Requires
        # appropriate permissions. Supports pagination.
        #
        # @overload list(customer_id, page:, page_size:, request_options: {})
        #
        # @param customer_id [String]
        # @param page [Integer]
        # @param page_size [Integer]
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Organizations::UserListResponse]
        #
        # @see Sentdm::Models::Organizations::UserListParams
        def list(customer_id, params)
          parsed, options = Sentdm::Organizations::UserListParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v2/organizations/%1$s/users", customer_id],
            query: parsed.transform_keys(page_size: "pageSize"),
            model: Sentdm::Models::Organizations::UserListResponse,
            options: options
          )
        end

        # Removes a user from an organization or sender profile. Requires admin
        # permissions. This action permanently deletes the user association.
        #
        # @overload delete(user_id, customer_id:, request_options: {})
        #
        # @param user_id [String]
        # @param customer_id [String]
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Sentdm::Models::Organizations::UserDeleteParams
        def delete(user_id, params)
          parsed, options = Sentdm::Organizations::UserDeleteParams.dump_request(params)
          customer_id =
            parsed.delete(:customer_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v2/organizations/%1$s/users/%2$s", customer_id, user_id],
            model: NilClass,
            options: options
          )
        end

        # Invites a user to an organization or sender profile with a specified role.
        # Requires appropriate permissions. The customerId can be either an organization
        # ID or a profile ID.
        #
        # @overload invite(customer_id, email: nil, invited_by: nil, name: nil, role: nil, request_options: {})
        #
        # @param customer_id [String]
        # @param email [String]
        # @param invited_by [String, nil]
        # @param name [String]
        # @param role [String]
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Organizations::CustomerUser]
        #
        # @see Sentdm::Models::Organizations::UserInviteParams
        def invite(customer_id, params = {})
          parsed, options = Sentdm::Organizations::UserInviteParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v2/organizations/%1$s/users", customer_id],
            body: parsed,
            model: Sentdm::Organizations::CustomerUser,
            options: options
          )
        end

        # Updates a user's role within an organization or sender profile. Requires admin
        # permissions. Valid roles are: admin, billing, developer.
        #
        # @overload update_role(user_id, customer_id:, role: nil, request_options: {})
        #
        # @param user_id [String] Path param
        #
        # @param customer_id [String] Path param
        #
        # @param role [String] Body param
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Organizations::CustomerUser]
        #
        # @see Sentdm::Models::Organizations::UserUpdateRoleParams
        def update_role(user_id, params)
          parsed, options = Sentdm::Organizations::UserUpdateRoleParams.dump_request(params)
          customer_id =
            parsed.delete(:customer_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["v2/organizations/%1$s/users/%2$s", customer_id, user_id],
            body: parsed,
            model: Sentdm::Organizations::CustomerUser,
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
end
