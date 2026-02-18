# typed: strong

module Sentdm
  module Resources
    class Users
      # Retrieves detailed information about a specific user in an organization or
      # profile. Requires developer role or higher.
      sig do
        params(
          user_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfUser)
      end
      def retrieve(user_id, request_options: {})
      end

      # Retrieves all users who have access to the organization or profile identified by
      # the API key, including their roles and status. Shows invited users (pending
      # acceptance) and active users. Requires developer role or higher.
      sig do
        params(request_options: Sentdm::RequestOptions::OrHash).returns(
          Sentdm::Models::UserListResponse
        )
      end
      def list(request_options: {})
      end

      # Sends an invitation to a user to join the organization or profile with a
      # specific role. Requires admin role. The user will receive an invitation email
      # with a token to accept. Invitation tokens expire after 7 days.
      sig do
        params(
          email: String,
          name: String,
          role: String,
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfUser)
      end
      def invite(
        # Body param: User email address (required)
        email: nil,
        # Body param: User full name (required)
        name: nil,
        # Body param: User role: admin, billing, or developer (required)
        role: nil,
        # Body param: Test mode flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        test_mode: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # Removes a user's access to an organization or profile. Requires admin role. You
      # cannot remove yourself or remove the last admin.
      sig do
        params(
          path_user_id: String,
          test_mode: T::Boolean,
          body_user_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).void
      end
      def remove(
        path_user_id,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        # User ID from route parameter
        body_user_id: nil,
        request_options: {}
      )
      end

      # Updates a user's role in the organization or profile. Requires admin role. You
      # cannot change your own role or demote the last admin.
      sig do
        params(
          path_user_id: String,
          role: String,
          test_mode: T::Boolean,
          body_user_id: String,
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfUser)
      end
      def update_role(
        # Path param
        path_user_id,
        # Body param: User role: admin, billing, or developer (required)
        role: nil,
        # Body param: Test mode flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        test_mode: nil,
        # Body param: User ID from route parameter
        body_user_id: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Sentdm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
