# frozen_string_literal: true

module Sentdm
  module Models
    class LinkEventPayload < Sentdm::Internal::Type::BaseModel
      # @!attribute record_id
      #   The link's public identifier — the eight-character code in the short URL, for
      #   example A78B2BU0. Unique across both kinds, and never reused, so it is the
      #   stable key to group one link's events by.
      #
      #   @return [String]
      required :record_id, String

      # @!attribute access_country
      #   Where the request appeared to come from, as an ISO 3166-1 alpha-2 code. Named
      #   separately from the country on a channel event, which is a destination market
      #   the customer registered for — this one is a property of a single visitor and is
      #   absent when the edge could not resolve it.
      #
      #   @return [String, nil]
      optional :access_country, String, nil?: true

      # @!attribute access_outcome
      #   How the request was served, when the edge recorded it. Free text describing the
      #   outcome — show it to a human rather than branching on it.
      #
      #   @return [String, nil]
      optional :access_outcome, String, nil?: true

      # @!attribute browser
      #   The requesting browser family, for example chrome or safari, or unknown. Derived
      #   from the user agent.
      #
      #   @return [String, nil]
      optional :browser, String, nil?: true

      # @!attribute bytes_served
      #   How many bytes were served, for a file access. A ranged request reports the
      #   bytes in that range, not the size of the file, so several accesses of one file
      #   can each report a part.
      #
      #   @return [Integer, nil]
      optional :bytes_served, Integer, nil?: true

      # @!attribute channel
      #   The channel the message carrying this link went out on: sms, whatsapp, or rcs.
      #
      #   @return [String, nil]
      optional :channel, String, nil?: true

      # @!attribute customer_id
      #   The organization the link belongs to. Always the parent account, never a sender
      #   profile — read SenderProfileId for that.
      #
      #   This family publishes the owner as an explicit pair rather than the single
      #   account_id the other families use. The pair says which organization and which
      #   profile without the subscriber deriving either, which is the trade: one more key
      #   against not having to know that account_id silently becomes the profile when one
      #   exists.
      #
      #   @return [String, nil]
      optional :customer_id, String

      # @!attribute device
      #   The requesting device class: mobile, tablet, desktop or unknown. Derived from
      #   the user agent.
      #
      #   @return [String, nil]
      optional :device, String, nil?: true

      # @!attribute link_kind
      #   What the link points at: url for a destination the customer supplied, file for
      #   media Sent hosts. Always present, and implied by the event — link.clicked is
      #   always url and link.downloaded always file — but published as its own field so a
      #   subscriber can branch on the kind without parsing the event name, the same
      #   separation the channel family keeps between its event and its status.
      #
      #   @return [String, nil]
      optional :link_kind, String

      # @!attribute message_id
      #   The message the link was published in.
      #
      #   The event can arrive before the message is readable through GET /v3/messages: a
      #   provider may fetch a link within milliseconds of the send, and nothing here
      #   waits for the message row. Retry the read rather than treating an unknown id as
      #   an error.
      #
      #   @return [String, nil]
      optional :message_id, String, nil?: true

      # @!attribute occurred_at
      #   When the access or lifecycle change actually happened, in UTC
      #   (yyyy-MM-ddTHH:mm:ssZ). The envelope's timestamp is when Sent emitted the event;
      #   this is when the thing occurred, and the two differ by the ingest delay.
      #
      #   @return [String, nil]
      optional :occurred_at, String

      # @!attribute reference_key
      #   The caller-supplied label tying this link back to a position in the message, for
      #   example body:0 for the first link in the body. Present when the link was created
      #   with one.
      #
      #   @return [String, nil]
      optional :reference_key, String, nil?: true

      # @!attribute referrer_host
      #   The host of the page that linked here, when the request supplied one. The host
      #   only — never a full referring URL.
      #
      #   @return [String, nil]
      optional :referrer_host, String, nil?: true

      # @!attribute request_method
      #   The HTTP method of the request that was served, for an access event. Omitted on
      #   link.expired and link.revoked, which describe no request.
      #
      #   @return [String, nil]
      optional :request_method, String, nil?: true

      # @!attribute sender_profile_id
      #   The sender profile that owns the link, or null when the organization owns it
      #   directly. Always on the wire so a handler reads one shape rather than branching
      #   on whether the key arrived.
      #
      #   sender_profile_id, not profile_id: the API already publishes
      #   messaging_profile_id and sending_phone_number_profile_id for provider-side
      #   profiles, which are a different thing entirely. The unqualified name would read
      #   as one of those.
      #
      #   @return [String, nil]
      optional :sender_profile_id, String, nil?: true

      # @!attribute status_code
      #   The HTTP status Sent answered the request with: 302 for a link, 200 or 206 for a
      #   file. Omitted on lifecycle events.
      #
      #   @return [Integer, nil]
      optional :status_code, Integer, nil?: true

      # @!attribute traffic_class
      #   A coarse guess at what made the request: likely_human, provider (a messaging
      #   platform prefetching the link), bot, or unknown. Derived from the user agent, so
      #   it is a hint for filtering noise rather than a fact to bill or report on.
      #
      #   @return [String, nil]
      optional :traffic_class, String, nil?: true

      # @!method initialize(record_id:, access_country: nil, access_outcome: nil, browser: nil, bytes_served: nil, channel: nil, customer_id: nil, device: nil, link_kind: nil, message_id: nil, occurred_at: nil, reference_key: nil, referrer_host: nil, request_method: nil, sender_profile_id: nil, status_code: nil, traffic_class: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::LinkEventPayload} for more details.
      #
      #   Body of a link event: something happened to a tracked link Sent published on the
      #   customer's behalf. A link points either at a URL the customer supplied or at a
      #   file Sent hosts for them; LinkKind says which. Delivered when an eligible
      #   request is served, or when a published link reaches the end of its life.
      #
      #   A click is a request, not a read receipt. link.clicked means the redirect was
      #   served; link.downloaded means bytes went out. Neither proves a person saw
      #   anything — messaging providers and link scanners fetch URLs on their own, which
      #   is what TrafficClass exists to tell apart. Filter on it before reporting a
      #   click-through rate; treat likely_human as a hint, never as delivery
      #   confirmation.
      #
      #   RecordId identifies the link; the X-Webhook-Event-ID header identifies the
      #   delivery. One link is hit many times, so those are the two keys a subscriber
      #   needs: group by the first, deduplicate on the second — exactly as on every other
      #   family. The payload carries no event identifier of its own, for the same reason
      #   none of the others do.
      #
      #   Nothing here identifies the visitor. No IP address and no visitor token crosses
      #   this boundary. Country, Device and Browser are coarse buckets derived at the
      #   edge and are absent whenever the request did not supply enough to derive them.
      #
      #   @param record_id [String] The link's public identifier — the eight-character code in the short URL, for ex
      #
      #   @param access_country [String, nil] Where the request appeared to come from, as an ISO 3166-1 alpha-2 code. Named se
      #
      #   @param access_outcome [String, nil] How the request was served, when the edge recorded it. Free text describing the
      #
      #   @param browser [String, nil] The requesting browser family, for example chrome or safari, or
      #
      #   @param bytes_served [Integer, nil] How many bytes were served, for a file access. A ranged request reports the byte
      #
      #   @param channel [String, nil] The channel the message carrying this link went out on: sms, whatsapp, or
      #
      #   @param customer_id [String] The organization the link belongs to. Always the parent account, never a sender
      #
      #   @param device [String, nil] The requesting device class: mobile, tablet, desktop or
      #
      #   @param link_kind [String] What the link points at: url for a destination the customer supplied, file for
      #
      #   @param message_id [String, nil] The message the link was published in.
      #
      #   @param occurred_at [String] When the access or lifecycle change actually happened, in UTC
      #
      #   @param reference_key [String, nil] The caller-supplied label tying this link back to a position in the message, for
      #
      #   @param referrer_host [String, nil] The host of the page that linked here, when the request supplied one. The host o
      #
      #   @param request_method [String, nil] The HTTP method of the request that was served, for an access event. Omitted on
      #
      #   @param sender_profile_id [String, nil] The sender profile that owns the link, or null when the organization owns it dir
      #
      #   @param status_code [Integer, nil] The HTTP status Sent answered the request with: 302 for a link, 200 or
      #
      #   @param traffic_class [String, nil] A coarse guess at what made the request: likely_human, provider (a messaging
    end
  end
end
