# typed: strong

module Sentdm
  module Models
    class MessageSendParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageSendParams, Sentdm::Internal::AnyHash)
        end

      # Channels to broadcast on, e.g. ["whatsapp", "sms"]. Each channel produces a
      # separate message per recipient. "sent" = auto-detect. Defaults to ["sent"]
      # (auto-detect) if omitted.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :channel

      # Which of your own numbers to send from, keyed by channel, each channel holding a
      # list of entries: {"sms": [{"country": "US", "from": ["+12125550000",
      # "+14155550000"]}, {"from": ["+447700800001"]}]}. Any real channel may be a key;
      # sent, which is auto-detect rather than a channel, is rejected. country and
      # strategy are accepted and stored but not acted on yet: every entry's numbers
      # apply to every recipient on that channel.
      #
      # This does not choose channels — Channel does, and the two combine: "channel":
      # ["sms"] with an sms list sends on SMS from those numbers. Each list only narrows
      # which of its own channel's routes may win, so with Channel left at auto-detect a
      # recipient best served by a channel with no list still goes out on it. Routing
      # itself is unchanged: the same rules are scored and ranked the same way, with
      # routes pinned to numbers you did not list removed from the running.
      #
      # Every number must be an active sender on your account. The request itself is
      # still accepted (202) if one is not — like every other send-time rule, that is
      # decided per message, so each affected message is recorded BLOCKED with error
      # code BUSINESS_029 and reported on GET /v3/messages and the status webhook.
      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T::Array[Sentdm::MessageSendParams::Channel]]
          )
        )
      end
      attr_accessor :channels

      # Attachments for this send, as publicly fetchable https URLs. Used by the MMS
      # channel and ignored by every other one.
      #
      # Supplying these replaces the media on the template's mms body rather than adding
      # to it, so a template can hold a default creative while a caller still sends
      # something recipient-specific.
      #
      # Their presence is also what makes a message eligible for MMS on an auto-detect
      # send: a message with nothing attached is delivered as SMS, because an MMS with
      # no media is a more expensive text message.
      #
      # The recipient's carrier fetches each URL after the send is accepted, so it must
      # stay publicly reachable — a link that expires, or one behind auth, arrives as a
      # failed message.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :media_urls

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      # Optional future send time as an ISO-8601 timestamp with an explicit UTC offset,
      # e.g. 2026-10-01T09:00:00+02:00 or 2026-10-01T07:00:00Z. A value without an
      # offset is rejected (400) rather than read in the server's zone. The offset only
      # fixes the instant: it is stored and echoed in UTC as scheduled_at. Omit to send
      # now. Must be at least one minute ahead and at most 30 days ahead. Accepted
      # messages report SCHEDULED and are released for delivery at this time. Quiet
      # hours, balance and template approval are evaluated at release, not at
      # acceptance: a message whose time falls inside a recipient's protected
      # quiet-hours window is moved to the next allowed time and a second
      # message.scheduled webhook reports the new scheduled_at.
      sig { returns(T.nilable(Time)) }
      attr_accessor :scheduled_at

      # Subject line for this send, overriding the template's. MMS only; ignored on
      # every other channel. Most handsets render it above the body, some ignore it
      # entirely.
      sig { returns(T.nilable(String)) }
      attr_accessor :subject

      # SDK-style template reference: resolve by ID or by name, with optional
      # parameters.
      sig { returns(T.nilable(Sentdm::MessageSendParams::Template)) }
      attr_reader :template

      sig do
        params(
          template: T.nilable(Sentdm::MessageSendParams::Template::OrHash)
        ).void
      end
      attr_writer :template

      # Plain-text (free-form) message body. Provide either Template or this.
      sig { returns(T.nilable(String)) }
      attr_accessor :text

      # List of recipient phone numbers in E.164 format (multi-recipient fan-out)
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :to

      sig { params(to: T::Array[String]).void }
      attr_writer :to

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          channel: T.nilable(T::Array[String]),
          channels:
            T.nilable(
              T::Hash[
                Symbol,
                T::Array[Sentdm::MessageSendParams::Channel::OrHash]
              ]
            ),
          media_urls: T.nilable(T::Array[String]),
          sandbox: T::Boolean,
          scheduled_at: T.nilable(Time),
          subject: T.nilable(String),
          template: T.nilable(Sentdm::MessageSendParams::Template::OrHash),
          text: T.nilable(String),
          to: T::Array[String],
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Channels to broadcast on, e.g. ["whatsapp", "sms"]. Each channel produces a
        # separate message per recipient. "sent" = auto-detect. Defaults to ["sent"]
        # (auto-detect) if omitted.
        channel: nil,
        # Which of your own numbers to send from, keyed by channel, each channel holding a
        # list of entries: {"sms": [{"country": "US", "from": ["+12125550000",
        # "+14155550000"]}, {"from": ["+447700800001"]}]}. Any real channel may be a key;
        # sent, which is auto-detect rather than a channel, is rejected. country and
        # strategy are accepted and stored but not acted on yet: every entry's numbers
        # apply to every recipient on that channel.
        #
        # This does not choose channels — Channel does, and the two combine: "channel":
        # ["sms"] with an sms list sends on SMS from those numbers. Each list only narrows
        # which of its own channel's routes may win, so with Channel left at auto-detect a
        # recipient best served by a channel with no list still goes out on it. Routing
        # itself is unchanged: the same rules are scored and ranked the same way, with
        # routes pinned to numbers you did not list removed from the running.
        #
        # Every number must be an active sender on your account. The request itself is
        # still accepted (202) if one is not — like every other send-time rule, that is
        # decided per message, so each affected message is recorded BLOCKED with error
        # code BUSINESS_029 and reported on GET /v3/messages and the status webhook.
        channels: nil,
        # Attachments for this send, as publicly fetchable https URLs. Used by the MMS
        # channel and ignored by every other one.
        #
        # Supplying these replaces the media on the template's mms body rather than adding
        # to it, so a template can hold a default creative while a caller still sends
        # something recipient-specific.
        #
        # Their presence is also what makes a message eligible for MMS on an auto-detect
        # send: a message with nothing attached is delivered as SMS, because an MMS with
        # no media is a more expensive text message.
        #
        # The recipient's carrier fetches each URL after the send is accepted, so it must
        # stay publicly reachable — a link that expires, or one behind auth, arrives as a
        # failed message.
        media_urls: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        # Optional future send time as an ISO-8601 timestamp with an explicit UTC offset,
        # e.g. 2026-10-01T09:00:00+02:00 or 2026-10-01T07:00:00Z. A value without an
        # offset is rejected (400) rather than read in the server's zone. The offset only
        # fixes the instant: it is stored and echoed in UTC as scheduled_at. Omit to send
        # now. Must be at least one minute ahead and at most 30 days ahead. Accepted
        # messages report SCHEDULED and are released for delivery at this time. Quiet
        # hours, balance and template approval are evaluated at release, not at
        # acceptance: a message whose time falls inside a recipient's protected
        # quiet-hours window is moved to the next allowed time and a second
        # message.scheduled webhook reports the new scheduled_at.
        scheduled_at: nil,
        # Subject line for this send, overriding the template's. MMS only; ignored on
        # every other channel. Most handsets render it above the body, some ignore it
        # entirely.
        subject: nil,
        # SDK-style template reference: resolve by ID or by name, with optional
        # parameters.
        template: nil,
        # Plain-text (free-form) message body. Provide either Template or this.
        text: nil,
        # List of recipient phone numbers in E.164 format (multi-recipient fan-out)
        to: nil,
        idempotency_key: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            channel: T.nilable(T::Array[String]),
            channels:
              T.nilable(
                T::Hash[Symbol, T::Array[Sentdm::MessageSendParams::Channel]]
              ),
            media_urls: T.nilable(T::Array[String]),
            sandbox: T::Boolean,
            scheduled_at: T.nilable(Time),
            subject: T.nilable(String),
            template: T.nilable(Sentdm::MessageSendParams::Template),
            text: T.nilable(String),
            to: T::Array[String],
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Channel < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::MessageSendParams::Channel, Sentdm::Internal::AnyHash)
          end

        # Recipient country this entry is meant for (ISO 3166-1 alpha-2, e.g. US).
        # Optional. Accepted and stored, not acted on yet.
        sig { returns(T.nilable(String)) }
        attr_accessor :country

        # Sender numbers in E.164. Each must be an active sender on your account for this
        # channel. That is account state rather than request shape, so it is decided per
        # message: the request is accepted with 202 and a message naming an unusable
        # number is recorded BLOCKED with error code BUSINESS_029.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :from

        # How to pick a number from From, e.g. sticky or geo. Optional. Accepted and
        # stored, not acted on yet.
        sig { returns(T.nilable(String)) }
        attr_accessor :strategy

        # One entry of a channel's list in Channels, e.g. {"country": "US", "from":
        # ["+15559990002", "+15559990003"], "strategy": "sticky"}.
        sig do
          params(
            country: T.nilable(String),
            from: T.nilable(T::Array[String]),
            strategy: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Recipient country this entry is meant for (ISO 3166-1 alpha-2, e.g. US).
          # Optional. Accepted and stored, not acted on yet.
          country: nil,
          # Sender numbers in E.164. Each must be an active sender on your account for this
          # channel. That is account state rather than request shape, so it is decided per
          # message: the request is accepted with 202 and a message naming an unusable
          # number is recorded BLOCKED with error code BUSINESS_029.
          from: nil,
          # How to pick a number from From, e.g. sticky or geo. Optional. Accepted and
          # stored, not acted on yet.
          strategy: nil
        )
        end

        sig do
          override.returns(
            {
              country: T.nilable(String),
              from: T.nilable(T::Array[String]),
              strategy: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class Template < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::MessageSendParams::Template,
              Sentdm::Internal::AnyHash
            )
          end

        # Template ID (mutually exclusive with name)
        sig { returns(T.nilable(String)) }
        attr_accessor :id

        # Template name (mutually exclusive with id)
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # Template variable parameters for personalization, keyed by variable name.
        #
        # Every variable the template declares is required; GET /v3/templates/{id} lists
        # them. Supplying a key the template does not declare is ignored.
        #
        # Media headers. A template whose header is an image (designed in WhatsApp Manager
        # and imported into Sent) declares a reserved header_image key. Its value is a
        # publicly reachable https URL that Meta fetches at send time — Sent does not host
        # the asset, and the sample approved with the template is not reused. The key is
        # derived from the header's media type, so header_video and header_document follow
        # the same shape when those formats ship.
        #
        # "parameters": { "header_image": "https://cdn.example.com/banner.jpg", "name":
        # "John Doe" }
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_accessor :parameters

        # SDK-style template reference: resolve by ID or by name, with optional
        # parameters.
        sig do
          params(
            id: T.nilable(String),
            name: T.nilable(String),
            parameters: T.nilable(T::Hash[Symbol, String])
          ).returns(T.attached_class)
        end
        def self.new(
          # Template ID (mutually exclusive with name)
          id: nil,
          # Template name (mutually exclusive with id)
          name: nil,
          # Template variable parameters for personalization, keyed by variable name.
          #
          # Every variable the template declares is required; GET /v3/templates/{id} lists
          # them. Supplying a key the template does not declare is ignored.
          #
          # Media headers. A template whose header is an image (designed in WhatsApp Manager
          # and imported into Sent) declares a reserved header_image key. Its value is a
          # publicly reachable https URL that Meta fetches at send time — Sent does not host
          # the asset, and the sample approved with the template is not reused. The key is
          # derived from the header's media type, so header_video and header_document follow
          # the same shape when those formats ship.
          #
          # "parameters": { "header_image": "https://cdn.example.com/banner.jpg", "name":
          # "John Doe" }
          parameters: nil
        )
        end

        sig do
          override.returns(
            {
              id: T.nilable(String),
              name: T.nilable(String),
              parameters: T.nilable(T::Hash[Symbol, String])
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
