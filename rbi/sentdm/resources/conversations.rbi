# typed: strong

module Sentdm
  module Resources
    class Conversations
      # Retrieves a paginated list of the authenticated customer's messages across all
      # conversations, ordered by created date (most recent first).
      sig do
        params(
          page: Integer,
          page_size: Integer,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfConversationMessagesList)
      end
      def list(
        # Query param
        page:,
        # Query param
        page_size:,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Retrieves a paginated list of the messages in a single conversation (scoped to
      # the authenticated customer), ordered by created date (most recent first).
      sig do
        params(
          id: String,
          page: Integer,
          page_size: Integer,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfConversationMessagesList)
      end
      def list_messages(
        # Path param: Conversation id from the route.
        id,
        # Query param
        page:,
        # Query param
        page_size:,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
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
