# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#send_
    class MessageSendParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute channel
      #   Channels to broadcast on, e.g. ["whatsapp", "sms"]. Each channel produces a
      #   separate message per recipient. "sent" = auto-detect. Defaults to ["sent"]
      #   (auto-detect) if omitted.
      #
      #   @return [Array<String>, nil]
      optional :channel, Sentdm::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute channels
      #   Which of your own numbers to send from, keyed by channel, each channel holding a
      #   list of entries: {"sms": [{"country": "US", "from": ["+12125550000",
      #   "+14155550000"]}, {"from": ["+447700800001"]}]}. Any real channel may be a key;
      #   sent, which is auto-detect rather than a channel, is rejected. country and
      #   strategy are accepted and stored but not acted on yet: every entry's numbers
      #   apply to every recipient on that channel.
      #
      #   This does not choose channels — Channel does, and the two combine: "channel":
      #   ["sms"] with an sms list sends on SMS from those numbers. Each list only narrows
      #   which of its own channel's routes may win, so with Channel left at auto-detect a
      #   recipient best served by a channel with no list still goes out on it. Routing
      #   itself is unchanged: the same rules are scored and ranked the same way, with
      #   routes pinned to numbers you did not list removed from the running.
      #
      #   Every number must be an active sender on your account. The request itself is
      #   still accepted (202) if one is not — like every other send-time rule, that is
      #   decided per message, so each affected message is recorded BLOCKED with error
      #   code BUSINESS_029 and reported on GET /v3/messages and the status webhook.
      #
      #   @return [Hash{Symbol=>Array<Sentdm::Models::MessageSendParams::Channel>}, nil]
      optional :channels,
               -> {
                 Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[Sentdm::MessageSendParams::Channel]]
               },
               nil?: true

      # @!attribute media_urls
      #   Attachments for this send, as publicly fetchable https URLs. Used by the MMS
      #   channel and ignored by every other one.
      #
      #   Supplying these replaces the media on the template's mms body rather than adding
      #   to it, so a template can hold a default creative while a caller still sends
      #   something recipient-specific.
      #
      #   Their presence is also what makes a message eligible for MMS on an auto-detect
      #   send: a message with nothing attached is delivered as SMS, because an MMS with
      #   no media is a more expensive text message.
      #
      #   The recipient's carrier fetches each URL after the send is accepted, so it must
      #   stay publicly reachable — a link that expires, or one behind auth, arrives as a
      #   failed message.
      #
      #   @return [Array<String>, nil]
      optional :media_urls, Sentdm::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute scheduled_at
      #   Optional future send time as an ISO-8601 timestamp with an explicit UTC offset,
      #   e.g. 2026-10-01T09:00:00+02:00 or 2026-10-01T07:00:00Z. A value without an
      #   offset is rejected (400) rather than read in the server's zone. The offset only
      #   fixes the instant: it is stored and echoed in UTC as scheduled_at. Omit to send
      #   now. Must be at least one minute ahead and at most 30 days ahead. Accepted
      #   messages report SCHEDULED and are released for delivery at this time. Quiet
      #   hours, balance and template approval are evaluated at release, not at
      #   acceptance: a message whose time falls inside a recipient's protected
      #   quiet-hours window is moved to the next allowed time and a second
      #   message.scheduled webhook reports the new scheduled_at.
      #
      #   @return [Time, nil]
      optional :scheduled_at, Time, nil?: true

      # @!attribute subject
      #   Subject line for this send, overriding the template's. MMS only; ignored on
      #   every other channel. Most handsets render it above the body, some ignore it
      #   entirely.
      #
      #   @return [String, nil]
      optional :subject, String, nil?: true

      # @!attribute template
      #   SDK-style template reference: resolve by ID or by name, with optional
      #   parameters.
      #
      #   @return [Sentdm::Models::MessageSendParams::Template, nil]
      optional :template, -> { Sentdm::MessageSendParams::Template }, nil?: true

      # @!attribute text
      #   Plain-text (free-form) message body. Provide either Template or this.
      #
      #   @return [String, nil]
      optional :text, String, nil?: true

      # @!attribute to
      #   List of recipient phone numbers in E.164 format (multi-recipient fan-out)
      #
      #   @return [Array<String>, nil]
      optional :to, Sentdm::Internal::Type::ArrayOf[String]

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(channel: nil, channels: nil, media_urls: nil, sandbox: nil, scheduled_at: nil, subject: nil, template: nil, text: nil, to: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageSendParams} for more details.
      #
      #   @param channel [Array<String>, nil] Channels to broadcast on, e.g. ["whatsapp", "sms"].
      #
      #   @param channels [Hash{Symbol=>Array<Sentdm::Models::MessageSendParams::Channel>}, nil] Which of your own numbers to send from, keyed by channel, each channel holding a
      #
      #   @param media_urls [Array<String>, nil] Attachments for this send, as publicly fetchable https URLs. Used by the MMS cha
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param scheduled_at [Time, nil] Optional future send time as an ISO-8601 timestamp with an explicit UTC offset,
      #
      #   @param subject [String, nil] Subject line for this send, overriding the template's. MMS only; ignored on ever
      #
      #   @param template [Sentdm::Models::MessageSendParams::Template, nil] SDK-style template reference: resolve by ID or by name, with optional parameters
      #
      #   @param text [String, nil] Plain-text (free-form) message body. Provide either Template or this.
      #
      #   @param to [Array<String>] List of recipient phone numbers in E.164 format (multi-recipient fan-out)
      #
      #   @param idempotency_key [String]
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

      class Channel < Sentdm::Internal::Type::BaseModel
        # @!attribute country
        #   Recipient country this entry is meant for (ISO 3166-1 alpha-2, e.g. US).
        #   Optional. Accepted and stored, not acted on yet.
        #
        #   @return [String, nil]
        optional :country, String, nil?: true

        # @!attribute from
        #   Sender numbers in E.164. Each must be an active sender on your account for this
        #   channel. That is account state rather than request shape, so it is decided per
        #   message: the request is accepted with 202 and a message naming an unusable
        #   number is recorded BLOCKED with error code BUSINESS_029.
        #
        #   @return [Array<String>, nil]
        optional :from, Sentdm::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute strategy
        #   How to pick a number from From, e.g. sticky or geo. Optional. Accepted and
        #   stored, not acted on yet.
        #
        #   @return [String, nil]
        optional :strategy, String, nil?: true

        # @!method initialize(country: nil, from: nil, strategy: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::MessageSendParams::Channel} for more details.
        #
        #   One entry of a channel's list in Channels, e.g. {"country": "US", "from":
        #   ["+15559990002", "+15559990003"], "strategy": "sticky"}.
        #
        #   @param country [String, nil] Recipient country this entry is meant for (ISO 3166-1 alpha-2, e.g. US). Optiona
        #
        #   @param from [Array<String>, nil] Sender numbers in E.164. Each must be an active sender on your account for this
        #
        #   @param strategy [String, nil] How to pick a number from From, e.g. sticky or geo. Optional. Accepted
      end

      class Template < Sentdm::Internal::Type::BaseModel
        # @!attribute id
        #   Template ID (mutually exclusive with name)
        #
        #   @return [String, nil]
        optional :id, String, nil?: true

        # @!attribute name
        #   Template name (mutually exclusive with id)
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute parameters
        #   Template variable parameters for personalization, keyed by variable name.
        #
        #   Every variable the template declares is required; GET /v3/templates/{id} lists
        #   them. Supplying a key the template does not declare is ignored.
        #
        #   Media headers. A template whose header is an image (designed in WhatsApp Manager
        #   and imported into Sent) declares a reserved header_image key. Its value is a
        #   publicly reachable https URL that Meta fetches at send time — Sent does not host
        #   the asset, and the sample approved with the template is not reused. The key is
        #   derived from the header's media type, so header_video and header_document follow
        #   the same shape when those formats ship.
        #
        #   "parameters": { "header_image": "https://cdn.example.com/banner.jpg", "name":
        #   "John Doe" }
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :parameters, Sentdm::Internal::Type::HashOf[String], nil?: true

        # @!method initialize(id: nil, name: nil, parameters: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::MessageSendParams::Template} for more details.
        #
        #   SDK-style template reference: resolve by ID or by name, with optional
        #   parameters.
        #
        #   @param id [String, nil] Template ID (mutually exclusive with name)
        #
        #   @param name [String, nil] Template name (mutually exclusive with id)
        #
        #   @param parameters [Hash{Symbol=>String}, nil] Template variable parameters for personalization, keyed by variable name.
      end
    end
  end
end
