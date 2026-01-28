# typed: strong

module Sentdm
  module Resources
    class Organizations
      class Users
        # Retrieves a specific user by their ID. Requires appropriate permissions. The
        # customerId can be either an organization ID or a profile ID.
        sig do
          params(
            user_id: String,
            customer_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Organizations::CustomerUser)
        end
        def retrieve(user_id, customer_id:, request_options: {})
        end

        # Retrieves all users associated with an organization or sender profile. Requires
        # appropriate permissions. Supports pagination.
        sig do
          params(
            customer_id: String,
            page: Integer,
            page_size: Integer,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Models::Organizations::UserListResponse)
        end
        def list(customer_id, page:, page_size:, request_options: {})
        end

        # Removes a user from an organization or sender profile. Requires admin
        # permissions. This action permanently deletes the user association.
        sig do
          params(
            user_id: String,
            customer_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).void
        end
        def delete(user_id, customer_id:, request_options: {})
        end

        # Invites a user to an organization or sender profile with a specified role.
        # Requires appropriate permissions. The customerId can be either an organization
        # ID or a profile ID.
        sig do
          params(
            customer_id: String,
            email: String,
            invited_by: T.nilable(String),
            name: String,
            role: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Organizations::CustomerUser)
        end
        def invite(
          customer_id,
          email: nil,
          invited_by: nil,
          name: nil,
          role: nil,
          request_options: {}
        )
        end

        # Updates a user's role within an organization or sender profile. Requires admin
        # permissions. Valid roles are: admin, billing, developer.
        sig do
          params(
            user_id: String,
            customer_id: String,
            role: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Organizations::CustomerUser)
        end
        def update_role(
          # Path param
          user_id,
          # Path param
          customer_id:,
          # Body param
          role: nil,
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
end
