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
      #   of its profiles. Matches customer_id on GET /v3/channels and the sender
      #   profile's id. Together with channel, country, and number_type, it identifies the
      #   market.
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

      # @!attribute compliance
      #   What a market has been given: the identity it registers under, its programme,
      #   and any documents attached.
      #
      #   What it does not carry is what the market asks for. That is the subject of GET
      #   /v3/compliance/requirements, and it is the same answer for every caller — a
      #   description of what a compliance regime wants, not a record of one customer's
      #   progress through it. It was reported here as well for a while, which put the
      #   same array in six response shapes and left a caller deciding which of two
      #   sources to believe.
      #
      #   Present on a list read for markets that register (carrying brand and campaign),
      #   but with documents absent — documents are not fetched for a list, because a
      #   catalog lookup and a document read per market would multiply across a page.
      #   Absent documents is distinct from an empty list: absent says they were not
      #   fetched; empty says the market has been given none. The parent object is null
      #   only when the market registers with nobody and compliance was not computed —
      #   nothing to show at all.
      #
      #   @return [Sentdm::Models::ChannelEventPayload::Compliance, nil]
      optional :compliance, -> { Sentdm::ChannelEventPayload::Compliance }, nil?: true

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

      # @!method initialize(country:, account_id: nil, channel: nil, compliance: nil, number_type: nil, reason: nil, sender_value: nil, status: nil, updated_at: nil)
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
      #   @param compliance [Sentdm::Models::ChannelEventPayload::Compliance, nil] What a market has been given: the identity it registers under, its programme, an
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

      # @see Sentdm::Models::ChannelEventPayload#compliance
      class Compliance < Sentdm::Internal::Type::BaseModel
        # @!attribute brand
        #   The identity this market registers under, with inherit saying whose it is.
        #
        #   Reported here rather than on the profile because it belongs to the registration
        #   this market files, and only one market files one. It was a top-level block for a
        #   while, which put a per-registration value beside a list of markets and left a
        #   caller to work out which market it belonged to.
        #
        #   Absent for a market that registers with nobody — such a market asks for no
        #   identity, so there is none to report. Absent and null mean different things:
        #   absent says this market does not ask, null would say it asks and nothing was
        #   supplied.
        #
        #   Untyped, like the request side, because its members are declared by the market's
        #   own schema rather than by a C# class. A typed pair here would be a second
        #   definition of what a market wants, free to drift from the one that validates.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :brand, Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::Unknown], nil?: true

        # @!attribute campaign
        #   The programme this market registers, with inherit saying whose it is.
        #
        #   One, not a list. TcrCampaigns permits several and an account built on the admin
        #   side may hold them, but this surface offers one — which is what lets the
        #   market's PATCH be an upsert rather than a collection with an addressable create
        #   behind it. An account holding several is reported as its first and refused on
        #   write, rather than half-edited.
        #
        #   Carries no id. Nothing addresses a campaign, and an undeclared key would be
        #   refused if the caller sent this object back — which it is meant to be able to
        #   do.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :campaign, Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::Unknown], nil?: true

        # @!attribute documents
        #   What has been supplied for this market.
        #
        #   Files, not values — the declared halves above carry the values. A document
        #   cannot be a JSON value, so it is sent as multipart on the channel call and
        #   reported here as a reference.
        #
        #   Absent on a list read, which fetches identity but does not compute compliance
        #   documents per market. Absent and empty mean different things: absent says the
        #   documents were not fetched; empty says the market has been given none.
        #
        #   @return [Array<Sentdm::Models::ChannelEventPayload::Compliance::Document>, nil]
        optional :documents,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ChannelEventPayload::Compliance::Document] },
                 nil?: true

        # @!method initialize(brand: nil, campaign: nil, documents: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::ChannelEventPayload::Compliance} for more details.
        #
        #   What a market has been given: the identity it registers under, its programme,
        #   and any documents attached.
        #
        #   What it does not carry is what the market asks for. That is the subject of GET
        #   /v3/compliance/requirements, and it is the same answer for every caller — a
        #   description of what a compliance regime wants, not a record of one customer's
        #   progress through it. It was reported here as well for a while, which put the
        #   same array in six response shapes and left a caller deciding which of two
        #   sources to believe.
        #
        #   Present on a list read for markets that register (carrying brand and campaign),
        #   but with documents absent — documents are not fetched for a list, because a
        #   catalog lookup and a document read per market would multiply across a page.
        #   Absent documents is distinct from an empty list: absent says they were not
        #   fetched; empty says the market has been given none. The parent object is null
        #   only when the market registers with nobody and compliance was not computed —
        #   nothing to show at all.
        #
        #   @param brand [Hash{Symbol=>Object}, nil] The identity this market registers under, with inherit saying whose it is.
        #
        #   @param campaign [Hash{Symbol=>Object}, nil] The programme this market registers, with inherit saying whose it is.
        #
        #   @param documents [Array<Sentdm::Models::ChannelEventPayload::Compliance::Document>, nil] What has been supplied for this market.

        class Document < Sentdm::Internal::Type::BaseModel
          # @!attribute document_id
          #   Identifier of the upload, for fetching it back through the documents endpoints.
          #
          #   @return [String, nil]
          optional :document_id, String, nil?: true

          # @!attribute file_name
          #
          #   @return [String, nil]
          optional :file_name, String, nil?: true

          # @!attribute key
          #   The catalog's name for this document, matching the requirement it satisfies.
          #
          #   @return [String, nil]
          optional :key, String

          # @!method initialize(document_id: nil, file_name: nil, key: nil)
          #   A document a market asked for and has been given.
          #
          #   @param document_id [String, nil] Identifier of the upload, for fetching it back through the documents endpoints.
          #
          #   @param file_name [String, nil]
          #
          #   @param key [String] The catalog's name for this document, matching the requirement it satisfies.
        end
      end
    end
  end
end
