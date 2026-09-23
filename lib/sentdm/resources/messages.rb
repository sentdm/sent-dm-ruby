# frozen_string_literal: true

module Sentdm
  module Resources
    # Send a message and follow what happened to it.
    #
    # One endpoint sends on any channel: pass `channel: "sent"` and we pick between
    # SMS, WhatsApp and RCS per recipient using your routing rules, or name a channel
    # to pin it. A send is accepted asynchronously — `POST /v3/messages` returns an
    # id, and delivery is reported through `GET /v3/messages/{id}`, its activities, or
    # a webhook.
    #
    # **A message needs a sender.** What you can send, where, and at what cost is
    # decided by the markets under **Channels** — so a recipient in a country you hold
    # no sender for is refused here rather than queued.
    #
    # **A message can be resent on its id.** `POST /v3/messages/{id}/resend` puts a
    # finished message — typically one BLOCKED for insufficient balance — back through
    # the send pipeline. It is a new attempt, not a free retry: every policy runs
    # again, the message is billed again, and its status webhooks fire again. A
    # FILTERED message is never resendable.
    class Messages
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::MessageRetrieveActivitiesParams} for more details.
      #
      # Retrieves the activity log for a specific message. Activities track the message
      # lifecycle including acceptance, processing, sending, delivery, and any errors. A
      # SCHEDULED entry carries scheduled_at, the release instant in UTC as it stood at
      # that moment. Other entries have no scheduled_at key.
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
      # status, timestamps, and error information if applicable. A message that is or
      # was held for a later time (a send you scheduled with scheduled_at, or a
      # quiet-hours hold) is returned as a ScheduledMessageResponse: the same fields
      # plus scheduled_at, the release instant in UTC. A message sent immediately has no
      # scheduled_at key.
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
      # webhooks or the GET /messages/{id} endpoint. Sends gated before any delivery
      # attempt do not reject the request — an account-level precondition such as
      # insufficient balance, a template not approved for sending, or free-form content
      # with no open conversation with the contact. The send is accepted with 202 and
      # the affected messages are reported as BLOCKED on GET /messages/{id} and the
      # message.blocked webhook. To send later, set scheduled_at (ISO-8601 with an
      # explicit UTC offset; a value without one is rejected) between 1 minute and 30
      # days ahead: the response is a ScheduledSendMessageResponse (the same fields plus
      # scheduled_at; status is still QUEUED), each message then moves to SCHEDULED, is
      # held and released at that time (within a few minutes), and a message.scheduled
      # webhook fires once it is held. Balance and template approval are evaluated at
      # release, not at acceptance. Quiet hours are not checked when the request is
      # accepted: if the time falls inside a legally protected quiet-hours window for a
      # recipient, that message is moved to the next allowed time at release and a
      # second message.scheduled webhook reports the new scheduled_at. An account may
      # hold at most 1,000,000 scheduled messages at once (429 LIMIT_001).
      #
      # @overload send_(channel: nil, media_urls: nil, sandbox: nil, scheduled_at: nil, subject: nil, template: nil, text: nil, to: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param channel [Array<String>, nil] Body param: Channels to broadcast on, e.g. ["whatsapp", "sms"].
      #
      # @param media_urls [Array<String>, nil] Body param: Attachments for this send, as publicly fetchable https URLs. Used by
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param scheduled_at [Time, nil] Body param: Optional future send time as an ISO-8601 timestamp with an explicit
      #
      # @param subject [String, nil] Body param: Subject line for this send, overriding the template's. MMS only; ign
      #
      # @param template [Sentdm::Models::MessageSendParams::Template, nil] Body param: SDK-style template reference: resolve by ID or by name, with optiona
      #
      # @param text [String, nil] Body param: Plain-text (free-form) message body. Provide either Template or this
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
