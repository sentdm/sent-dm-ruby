# frozen_string_literal: true

module Sentdm
  module Models
    class ChannelEventPayload < Sentdm::Internal::Type::BaseModel
      # @!attribute country
      #   The market's destination country as an ISO 3166-1 alpha-2 code, for example XK.
      #   Always present, and the property that identifies this payload among the
      #   delivered envelopes — see DeliveredWebhookEvents. Every event in this family
      #   reports one market, and a market has a country.
      #
      #   @return [String]
      required :country, String

      # @!attribute account_id
      #   The account whose market this is, named as on every other family. When an
      #   organization receives an event for one of its sender profiles this is the
      #   profile, so a reseller compares it with its own id and anything different is one
      #   of its profiles.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute channel
      #   The channel this market belongs to: sms, whatsapp, or rcs. Never sent — that
      #   value belongs to message events, where it names the smart-routing brand rather
      #   than a channel that can be provisioned.
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute number_type
      #   The kind of sender the market uses, for example TEN_DLC, LOCAL, or ALPHANUMERIC.
      #   Omitted when the subject has no sender type of its own.
      #
      #   @return [String, nil]
      optional :number_type, String, nil?: true

      # @!attribute reason
      #   Why the market reached this state, when a reason was given — a correction
      #   explained, or a campaign lapse. Free text, passed through from the registry or
      #   carrier that wrote it, so treat it as a message to show a human rather than a
      #   value to branch on.
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute sender_value
      #   The sender itself — a number in E.164, or an alphanumeric sender ID.
      #
      #   Always present, and null until a sender exists. The key is on every delivery so
      #   a subscriber reads one shape rather than branching on whether the field arrived
      #   — the same choice template_id makes on the message payload.
      #
      #   It can carry a value at any point in the lifecycle, not only once the market is
      #   live: a number ordered and not yet active at the carrier is already known during
      #   PROVISIONING, and an alphanumeric sender the customer chose themselves is known
      #   before anything is filed. It is null while the market is still waiting on a
      #   number, which for a US 10DLC registration is every event up to
      #   channel.activated.
      #
      #   @return [String, nil]
      optional :sender_value, String, nil?: true

      # @!attribute status
      #   Where the market stands: PENDING_REVIEW, ACTION_NEEDED, PROVISIONING, ACTIVE or
      #   INACTIVE. PENDING_REVIEW means a registry or a carrier holds it and the wait is
      #   theirs; ACTION_NEEDED means it is yours; PROVISIONING means the verdict is in
      #   and Sent is acquiring the sender; INACTIVE means it had a working sender and no
      #   longer does.
      #
      #   Each event name is the transition into one of these, but the two are separate
      #   fields and may legitimately differ. A resubmission filed against a market whose
      #   sender is already live is channel.submitted carrying ACTIVE: a correction is
      #   with the registry and the sender keeps working. Read both.
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute updated_at
      #   When the transition happened, in UTC (yyyy-MM-ddTHH:mm:ssZ).
      #
      #   @return [String, nil]
      optional :updated_at, String

      # @!method initialize(country:, account_id: nil, channel: nil, number_type: nil, reason: nil, sender_value: nil, status: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ChannelEventPayload} for more details.
      #
      #   Body of a channel event: where one of the customer's channels stands in
      #   provisioning and compliance. Delivered when a milestone moves — a registration
      #   filed, a verdict returned, a resubmission asked for, a sender gone live — so a
      #   customer's own onboarding UI does not have to poll GET /v3/channels.
      #
      #   The subject is one item, never the account. A customer's "SMS channel" has no
      #   status; a market does. Country, NumberType and SenderValue name which one, so a
      #   customer terminating only to Kosovo never receives an event about US 10DLC.
      #
      #   Status is the stable half of the contract. It is the same four-value set GET
      #   /v3/channels publishes, computed through the same code, so an event and a read
      #   of the same market cannot disagree. A subscriber that reads nothing but the
      #   status and the subject fields is a correct subscriber. The sub-type on the
      #   envelope names the specific milestone and is additive — that vocabulary comes
      #   from registries and carriers, which are parties Sent does not control.
      #
      #   Status means provisioning and compliance are complete, not that a send will
      #   succeed right now. An account can be suspended, or a destination blocked by a
      #   routing rule, without either showing up here. Those are separate surfaces and
      #   deliberately not modelled on this payload.
      #
      #   @param country [String] The market's destination country as an ISO 3166-1 alpha-2 code, for example XK.
      #
      #   @param account_id [String] The account whose market this is, named as on every other family. When an organi
      #
      #   @param channel [String] The channel this market belongs to: sms, whatsapp, or rcs. Never
      #
      #   @param number_type [String, nil] The kind of sender the market uses, for example TEN_DLC, LOCAL, or
      #
      #   @param reason [String, nil] Why the market reached this state, when a reason was given — a correction explai
      #
      #   @param sender_value [String, nil] The sender itself — a number in E.164, or an alphanumeric sender ID.
      #
      #   @param status [String] Where the market stands: PENDING_REVIEW, ACTION_NEEDED, PROVISIONING,
      #
      #   @param updated_at [String] When the transition happened, in UTC (yyyy-MM-ddTHH:mm:ssZ).
    end
  end
end
