# typed: strong

module Sentdm
  module Models
    class LinkEventPayload < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::LinkEventPayload, Sentdm::Internal::AnyHash)
        end

      # The link's public identifier — the eight-character code in the short URL, for
      # example A78B2BU0. Unique across both kinds, and never reused, so it is the
      # stable key to group one link's events by.
      sig { returns(String) }
      attr_accessor :record_id

      # Where the request appeared to come from, as an ISO 3166-1 alpha-2 code. Named
      # separately from the country on a channel event, which is a destination market
      # the customer registered for — this one is a property of a single visitor and is
      # absent when the edge could not resolve it.
      sig { returns(T.nilable(String)) }
      attr_accessor :access_country

      # How the request was served, when the edge recorded it. Free text describing the
      # outcome — show it to a human rather than branching on it.
      sig { returns(T.nilable(String)) }
      attr_accessor :access_outcome

      # The requesting browser family, for example chrome or safari, or unknown. Derived
      # from the user agent.
      sig { returns(T.nilable(String)) }
      attr_accessor :browser

      # How many bytes were served, for a file access. A ranged request reports the
      # bytes in that range, not the size of the file, so several accesses of one file
      # can each report a part.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :bytes_served

      # The channel the message carrying this link went out on: sms, whatsapp, or rcs.
      sig { returns(T.nilable(String)) }
      attr_accessor :channel

      # The organization the link belongs to. Always the parent account, never a sender
      # profile — read SenderProfileId for that.
      #
      # This family publishes the owner as an explicit pair rather than the single
      # account_id the other families use. The pair says which organization and which
      # profile without the subscriber deriving either, which is the trade: one more key
      # against not having to know that account_id silently becomes the profile when one
      # exists.
      sig { returns(T.nilable(String)) }
      attr_reader :customer_id

      sig { params(customer_id: String).void }
      attr_writer :customer_id

      # The requesting device class: mobile, tablet, desktop or unknown. Derived from
      # the user agent.
      sig { returns(T.nilable(String)) }
      attr_accessor :device

      # What the link points at: url for a destination the customer supplied, file for
      # media Sent hosts. Always present, and implied by the event — link.clicked is
      # always url and link.downloaded always file — but published as its own field so a
      # subscriber can branch on the kind without parsing the event name, the same
      # separation the channel family keeps between its event and its status.
      sig { returns(T.nilable(String)) }
      attr_reader :link_kind

      sig { params(link_kind: String).void }
      attr_writer :link_kind

      # The message the link was published in.
      #
      # The event can arrive before the message is readable through GET /v3/messages: a
      # provider may fetch a link within milliseconds of the send, and nothing here
      # waits for the message row. Retry the read rather than treating an unknown id as
      # an error.
      sig { returns(T.nilable(String)) }
      attr_accessor :message_id

      # When the access or lifecycle change actually happened, in UTC
      # (yyyy-MM-ddTHH:mm:ssZ). The envelope's timestamp is when Sent emitted the event;
      # this is when the thing occurred, and the two differ by the ingest delay.
      sig { returns(T.nilable(String)) }
      attr_reader :occurred_at

      sig { params(occurred_at: String).void }
      attr_writer :occurred_at

      # The caller-supplied label tying this link back to a position in the message, for
      # example body:0 for the first link in the body. Present when the link was created
      # with one.
      sig { returns(T.nilable(String)) }
      attr_accessor :reference_key

      # The host of the page that linked here, when the request supplied one. The host
      # only — never a full referring URL.
      sig { returns(T.nilable(String)) }
      attr_accessor :referrer_host

      # The HTTP method of the request that was served, for an access event. Omitted on
      # link.expired and link.revoked, which describe no request.
      sig { returns(T.nilable(String)) }
      attr_accessor :request_method

      # The sender profile that owns the link, or null when the organization owns it
      # directly. Always on the wire so a handler reads one shape rather than branching
      # on whether the key arrived.
      #
      # sender_profile_id, not profile_id: the API already publishes
      # messaging_profile_id and sending_phone_number_profile_id for provider-side
      # profiles, which are a different thing entirely. The unqualified name would read
      # as one of those.
      sig { returns(T.nilable(String)) }
      attr_accessor :sender_profile_id

      # The HTTP status Sent answered the request with: 302 for a link, 200 or 206 for a
      # file. Omitted on lifecycle events.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :status_code

      # A coarse guess at what made the request: likely_human, provider (a messaging
      # platform prefetching the link), bot, or unknown. Derived from the user agent, so
      # it is a hint for filtering noise rather than a fact to bill or report on.
      sig { returns(T.nilable(String)) }
      attr_accessor :traffic_class

      # Body of a link event: something happened to a tracked link Sent published on the
      # customer's behalf. A link points either at a URL the customer supplied or at a
      # file Sent hosts for them; LinkKind says which. Delivered when an eligible
      # request is served, or when a published link reaches the end of its life.
      #
      # A click is a request, not a read receipt. link.clicked means the redirect was
      # served; link.downloaded means bytes went out. Neither proves a person saw
      # anything — messaging providers and link scanners fetch URLs on their own, which
      # is what TrafficClass exists to tell apart. Filter on it before reporting a
      # click-through rate; treat likely_human as a hint, never as delivery
      # confirmation.
      #
      # RecordId identifies the link; the X-Webhook-Event-ID header identifies the
      # delivery. One link is hit many times, so those are the two keys a subscriber
      # needs: group by the first, deduplicate on the second — exactly as on every other
      # family. The payload carries no event identifier of its own, for the same reason
      # none of the others do.
      #
      # Nothing here identifies the visitor. No IP address and no visitor token crosses
      # this boundary. Country, Device and Browser are coarse buckets derived at the
      # edge and are absent whenever the request did not supply enough to derive them.
      sig do
        params(
          record_id: String,
          access_country: T.nilable(String),
          access_outcome: T.nilable(String),
          browser: T.nilable(String),
          bytes_served: T.nilable(Integer),
          channel: T.nilable(String),
          customer_id: String,
          device: T.nilable(String),
          link_kind: String,
          message_id: T.nilable(String),
          occurred_at: String,
          reference_key: T.nilable(String),
          referrer_host: T.nilable(String),
          request_method: T.nilable(String),
          sender_profile_id: T.nilable(String),
          status_code: T.nilable(Integer),
          traffic_class: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The link's public identifier — the eight-character code in the short URL, for
        # example A78B2BU0. Unique across both kinds, and never reused, so it is the
        # stable key to group one link's events by.
        record_id:,
        # Where the request appeared to come from, as an ISO 3166-1 alpha-2 code. Named
        # separately from the country on a channel event, which is a destination market
        # the customer registered for — this one is a property of a single visitor and is
        # absent when the edge could not resolve it.
        access_country: nil,
        # How the request was served, when the edge recorded it. Free text describing the
        # outcome — show it to a human rather than branching on it.
        access_outcome: nil,
        # The requesting browser family, for example chrome or safari, or unknown. Derived
        # from the user agent.
        browser: nil,
        # How many bytes were served, for a file access. A ranged request reports the
        # bytes in that range, not the size of the file, so several accesses of one file
        # can each report a part.
        bytes_served: nil,
        # The channel the message carrying this link went out on: sms, whatsapp, or rcs.
        channel: nil,
        # The organization the link belongs to. Always the parent account, never a sender
        # profile — read SenderProfileId for that.
        #
        # This family publishes the owner as an explicit pair rather than the single
        # account_id the other families use. The pair says which organization and which
        # profile without the subscriber deriving either, which is the trade: one more key
        # against not having to know that account_id silently becomes the profile when one
        # exists.
        customer_id: nil,
        # The requesting device class: mobile, tablet, desktop or unknown. Derived from
        # the user agent.
        device: nil,
        # What the link points at: url for a destination the customer supplied, file for
        # media Sent hosts. Always present, and implied by the event — link.clicked is
        # always url and link.downloaded always file — but published as its own field so a
        # subscriber can branch on the kind without parsing the event name, the same
        # separation the channel family keeps between its event and its status.
        link_kind: nil,
        # The message the link was published in.
        #
        # The event can arrive before the message is readable through GET /v3/messages: a
        # provider may fetch a link within milliseconds of the send, and nothing here
        # waits for the message row. Retry the read rather than treating an unknown id as
        # an error.
        message_id: nil,
        # When the access or lifecycle change actually happened, in UTC
        # (yyyy-MM-ddTHH:mm:ssZ). The envelope's timestamp is when Sent emitted the event;
        # this is when the thing occurred, and the two differ by the ingest delay.
        occurred_at: nil,
        # The caller-supplied label tying this link back to a position in the message, for
        # example body:0 for the first link in the body. Present when the link was created
        # with one.
        reference_key: nil,
        # The host of the page that linked here, when the request supplied one. The host
        # only — never a full referring URL.
        referrer_host: nil,
        # The HTTP method of the request that was served, for an access event. Omitted on
        # link.expired and link.revoked, which describe no request.
        request_method: nil,
        # The sender profile that owns the link, or null when the organization owns it
        # directly. Always on the wire so a handler reads one shape rather than branching
        # on whether the key arrived.
        #
        # sender_profile_id, not profile_id: the API already publishes
        # messaging_profile_id and sending_phone_number_profile_id for provider-side
        # profiles, which are a different thing entirely. The unqualified name would read
        # as one of those.
        sender_profile_id: nil,
        # The HTTP status Sent answered the request with: 302 for a link, 200 or 206 for a
        # file. Omitted on lifecycle events.
        status_code: nil,
        # A coarse guess at what made the request: likely_human, provider (a messaging
        # platform prefetching the link), bot, or unknown. Derived from the user agent, so
        # it is a hint for filtering noise rather than a fact to bill or report on.
        traffic_class: nil
      )
      end

      sig do
        override.returns(
          {
            record_id: String,
            access_country: T.nilable(String),
            access_outcome: T.nilable(String),
            browser: T.nilable(String),
            bytes_served: T.nilable(Integer),
            channel: T.nilable(String),
            customer_id: String,
            device: T.nilable(String),
            link_kind: String,
            message_id: T.nilable(String),
            occurred_at: String,
            reference_key: T.nilable(String),
            referrer_host: T.nilable(String),
            request_method: T.nilable(String),
            sender_profile_id: T.nilable(String),
            status_code: T.nilable(Integer),
            traffic_class: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
