# frozen_string_literal: true

module SentDm
  module Resources
    class Messages
      # Retrieves the activity log for a specific message. Activities track the message
      # lifecycle including acceptance, processing, sending, delivery, and any errors.
      #
      # @overload retrieve_activities(id, request_options: {})
      #
      # @param id [String] Message ID from route parameter
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::MessageRetrieveActivitiesResponse]
      #
      # @see SentDm::Models::MessageRetrieveActivitiesParams
      def retrieve_activities(id, params = {})
        @client.request(
          method: :get,
          path: ["v3/messages/%1$s/activities", id],
          model: SentDm::Models::MessageRetrieveActivitiesResponse,
          options: params[:request_options]
        )
      end

      # Retrieves the current status and details of a message by ID. Includes delivery
      # status, timestamps, and error information if applicable.
      #
      # @overload retrieve_status(id, request_options: {})
      #
      # @param id [String] Message ID
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::MessageRetrieveStatusResponse]
      #
      # @see SentDm::Models::MessageRetrieveStatusParams
      def retrieve_status(id, params = {})
        @client.request(
          method: :get,
          path: ["v3/messages/%1$s", id],
          model: SentDm::Models::MessageRetrieveStatusResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::MessageSendParams} for more details.
      #
      # Sends a message to one or more recipients using a template. Supports
      # multi-channel broadcast — when multiple channels are specified (e.g. ["sms",
      # "whatsapp"]), a separate message is created for each (recipient, channel) pair.
      # Returns immediately with per-recipient message IDs for async tracking via
      # webhooks or the GET /messages/{id} endpoint.
      #
      # @overload send_(channel: nil, template: nil, test_mode: nil, to: nil, idempotency_key: nil, request_options: {})
      #
      # @param channel [Array<String>, nil] Body param: Channels to broadcast on, e.g. ["whatsapp", "sms"].
      #
      # @param template [SentDm::Models::MessageSendParams::Template] Body param: Template reference (by id or name, with optional parameters)
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param to [Array<String>] Body param: List of recipient phone numbers in E.164 format (multi-recipient fan
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::MessageSendResponse]
      #
      # @see SentDm::Models::MessageSendParams
      def send_(params = {})
        parsed, options = SentDm::MessageSendParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "v3/messages",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::Models::MessageSendResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [SentDm::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
