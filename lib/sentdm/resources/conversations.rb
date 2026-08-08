# frozen_string_literal: true

module Sentdm
  module Resources
    class Conversations
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ConversationListParams} for more details.
      #
      # Retrieves a paginated list of the authenticated customer's messages across all
      # conversations, ordered by created date (most recent first).
      #
      # @overload list(page:, page_size:, x_profile_id: nil, request_options: {})
      #
      # @param page [Integer] Query param
      #
      # @param page_size [Integer] Query param
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfConversationMessagesList]
      #
      # @see Sentdm::Models::ConversationListParams
      def list(params)
        query_params = [:page, :page_size]
        parsed, options = Sentdm::ConversationListParams.dump_request(params)
        query = Sentdm::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :get,
          path: "v3/conversations",
          query: query,
          headers: parsed.except(*query_params).transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::APIResponseOfConversationMessagesList,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ConversationListMessagesParams} for more details.
      #
      # Retrieves a paginated list of the messages in a single conversation (scoped to
      # the authenticated customer), ordered by created date (most recent first).
      #
      # @overload list_messages(id, page:, page_size:, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Path param: Conversation id from the route.
      #
      # @param page [Integer] Query param
      #
      # @param page_size [Integer] Query param
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfConversationMessagesList]
      #
      # @see Sentdm::Models::ConversationListMessagesParams
      def list_messages(id, params)
        query_params = [:page, :page_size]
        parsed, options = Sentdm::ConversationListMessagesParams.dump_request(params)
        query = Sentdm::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :get,
          path: ["v3/conversations/%1$s", id],
          query: query,
          headers: parsed.except(*query_params).transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::APIResponseOfConversationMessagesList,
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
