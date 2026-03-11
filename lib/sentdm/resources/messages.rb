# frozen_string_literal: true

module Sentdm
  module Resources
    # Send and track SMS and WhatsApp messages
    class Messages
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::MessageRetrieveActivitiesParams} for more details.
      #
      # Retrieves the activity log for a specific message. Activities track the message
      # lifecycle including acceptance, processing, sending, delivery, and any errors.
      #
      # @overload retrieve_activities(id, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Message ID from route parameter
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::MessageRetrieveActivitiesResponse]
      #
      # @see Sentdm::Models::MessageRetrieveActivitiesParams
      def retrieve_activities(id, params = {})
        parsed, options = Sentdm::MessageRetrieveActivitiesParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/messages/%1$s/activities", id],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::MessageRetrieveActivitiesResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::MessageRetrieveStatusParams} for more details.
      #
      # Retrieves the current status and details of a message by ID. Includes delivery
      # status, timestamps, and error information if applicable.
      #
      # @overload retrieve_status(id, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Message ID
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::MessageRetrieveStatusResponse]
      #
      # @see Sentdm::Models::MessageRetrieveStatusParams
      def retrieve_status(id, params = {})
        parsed, options = Sentdm::MessageRetrieveStatusParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/messages/%1$s", id],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::MessageRetrieveStatusResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::MessageSendParams} for more details.
      #
      # Sends a message to one or more recipients using a template. Supports
      # multi-channel broadcast — when multiple channels are specified (e.g. ["sms",
      # "whatsapp"]), a separate message is created for each (recipient, channel) pair.
      # Returns immediately with per-recipient message IDs for async tracking via
      # webhooks or the GET /messages/{id} endpoint.
      #
      # @overload send_(channel: nil, sandbox: nil, template: nil, to: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param channel [Array<String>, nil] Body param: Channels to broadcast on, e.g. ["whatsapp", "sms"].
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param template [Sentdm::Models::MessageSendParams::Template] Body param: Template reference (by id or name, with optional parameters)
      #
      # @param to [Array<String>] Body param: List of recipient phone numbers in E.164 format (multi-recipient fan
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::MessageSendResponse]
      #
      # @see Sentdm::Models::MessageSendParams
      def send_(params = {})
        parsed, options = Sentdm::MessageSendParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: "v3/messages",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::Models::MessageSendResponse,
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
