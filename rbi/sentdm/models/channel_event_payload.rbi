# typed: strong

module Sentdm
  module Models
    class ChannelEventPayload < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ChannelEventPayload, Sentdm::Internal::AnyHash)
        end

      # The market's destination country as an ISO 3166-1 alpha-2 code, for example XK.
      # Always present, and the property that identifies this payload among the
      # delivered envelopes — see DeliveredWebhookEvents. Every event in this family
      # reports one market, and a market has a country.
      sig { returns(String) }
      attr_accessor :country

      # The account whose market this is, named as on every other family. When an
      # organization receives an event for one of its sender profiles this is the
      # profile, so a reseller compares it with its own id and anything different is one
      # of its profiles. Matches customer_id on GET /v3/channels and the sender
      # profile's id. Together with channel, country, and number_type, it identifies the
      # market.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      # The channel this market belongs to: sms, whatsapp, or rcs. Never sent — that
      # value belongs to message events, where it names the smart-routing brand rather
      # than a channel that can be provisioned.
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # What a market has been given: the identity it registers under, its programme,
      # and any documents attached.
      #
      # What it does not carry is what the market asks for. That is the subject of GET
      # /v3/compliance/requirements, and it is the same answer for every caller — a
      # description of what a compliance regime wants, not a record of one customer's
      # progress through it. It was reported here as well for a while, which put the
      # same array in six response shapes and left a caller deciding which of two
      # sources to believe.
      #
      # Present on a list read for markets that register (carrying brand and campaign),
      # but with documents absent — documents are not fetched for a list, because a
      # catalog lookup and a document read per market would multiply across a page.
      # Absent documents is distinct from an empty list: absent says they were not
      # fetched; empty says the market has been given none. The parent object is null
      # only when the market registers with nobody and compliance was not computed —
      # nothing to show at all.
      sig { returns(T.nilable(Sentdm::Channels::SuppliedCompliance)) }
      attr_reader :compliance

      sig do
        params(
          compliance: T.nilable(Sentdm::Channels::SuppliedCompliance::OrHash)
        ).void
      end
      attr_writer :compliance

      # The kind of sender the market uses, for example TEN_DLC, LOCAL, or ALPHANUMERIC.
      # Omitted when the subject has no sender type of its own.
      sig { returns(T.nilable(String)) }
      attr_accessor :number_type

      # Why the market reached this state, as a sentence to show a person: the specific
      # explanation when one was given (a correction explained, a campaign lapse),
      # otherwise what reason_code means for this market. Not a value to branch on.
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      # Why the market is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
      # such as CHANNEL_001 (something you owe) or CHANNEL_002 (a correction was
      # requested). The same code the channels resource reports for the market. Switch
      # on this rather than on reason. Omitted while ACTIVE.
      sig { returns(T.nilable(String)) }
      attr_accessor :reason_code

      # The sender itself — a number in E.164, or an alphanumeric sender ID.
      #
      # Always present, and null until a sender exists. The key is on every delivery so
      # a subscriber reads one shape rather than branching on whether the field arrived
      # — the same choice template_id makes on the message payload.
      #
      # It can carry a value at any point in the lifecycle, not only once the market is
      # live: a number ordered and not yet active at the carrier is already known during
      # PROVISIONING, and an alphanumeric sender the customer chose themselves is known
      # before anything is filed. It is null while the market is still waiting on a
      # number, which for a US 10DLC registration is every event up to
      # channel.activated.
      sig { returns(T.nilable(String)) }
      attr_accessor :sender_value

      # Where the market stands: PENDING_REVIEW, ACTION_NEEDED, PROVISIONING, ACTIVE or
      # INACTIVE. PENDING_REVIEW means a registry or a carrier holds it and the wait is
      # theirs; ACTION_NEEDED means it is yours; PROVISIONING means the verdict is in
      # and Sent is acquiring the sender; INACTIVE means it had a working sender and no
      # longer does.
      #
      # Each event name is the transition into one of these, but the two are separate
      # fields and may legitimately differ. A resubmission filed against a market whose
      # sender is already live is channel.submitted carrying ACTIVE: a correction is
      # with the registry and the sender keeps working. Read both.
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # When the transition happened, in UTC (yyyy-MM-ddTHH:mm:ssZ).
      sig { returns(T.nilable(String)) }
      attr_reader :updated_at

      sig { params(updated_at: String).void }
      attr_writer :updated_at

      # Body of a channel event: where one of the customer's channels stands in
      # provisioning and compliance. Delivered when a milestone moves — a registration
      # filed, a verdict returned, a resubmission asked for, a sender gone live — so a
      # customer's own onboarding UI does not have to poll GET /v3/channels.
      #
      # The subject is one item, never the account. A customer's "SMS channel" has no
      # status; a market does. Country, NumberType and SenderValue name which one, so a
      # customer terminating only to Kosovo never receives an event about US 10DLC.
      #
      # Status is the stable half of the contract. It is the same four-value set GET
      # /v3/channels publishes, computed through the same code, so an event and a read
      # of the same market cannot disagree. A subscriber that reads nothing but the
      # status and the subject fields is a correct subscriber. The sub-type on the
      # envelope names the specific milestone and is additive — that vocabulary comes
      # from registries and carriers, which are parties Sent does not control.
      #
      # Status means provisioning and compliance are complete, not that a send will
      # succeed right now. An account can be suspended, or a destination blocked by a
      # routing rule, without either showing up here. Those are separate surfaces and
      # deliberately not modelled on this payload.
      sig do
        params(
          country: String,
          account_id: String,
          channel: String,
          compliance: T.nilable(Sentdm::Channels::SuppliedCompliance::OrHash),
          number_type: T.nilable(String),
          reason: T.nilable(String),
          reason_code: T.nilable(String),
          sender_value: T.nilable(String),
          status: String,
          updated_at: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The market's destination country as an ISO 3166-1 alpha-2 code, for example XK.
        # Always present, and the property that identifies this payload among the
        # delivered envelopes — see DeliveredWebhookEvents. Every event in this family
        # reports one market, and a market has a country.
        country:,
        # The account whose market this is, named as on every other family. When an
        # organization receives an event for one of its sender profiles this is the
        # profile, so a reseller compares it with its own id and anything different is one
        # of its profiles. Matches customer_id on GET /v3/channels and the sender
        # profile's id. Together with channel, country, and number_type, it identifies the
        # market.
        account_id: nil,
        # The channel this market belongs to: sms, whatsapp, or rcs. Never sent — that
        # value belongs to message events, where it names the smart-routing brand rather
        # than a channel that can be provisioned.
        channel: nil,
        # What a market has been given: the identity it registers under, its programme,
        # and any documents attached.
        #
        # What it does not carry is what the market asks for. That is the subject of GET
        # /v3/compliance/requirements, and it is the same answer for every caller — a
        # description of what a compliance regime wants, not a record of one customer's
        # progress through it. It was reported here as well for a while, which put the
        # same array in six response shapes and left a caller deciding which of two
        # sources to believe.
        #
        # Present on a list read for markets that register (carrying brand and campaign),
        # but with documents absent — documents are not fetched for a list, because a
        # catalog lookup and a document read per market would multiply across a page.
        # Absent documents is distinct from an empty list: absent says they were not
        # fetched; empty says the market has been given none. The parent object is null
        # only when the market registers with nobody and compliance was not computed —
        # nothing to show at all.
        compliance: nil,
        # The kind of sender the market uses, for example TEN_DLC, LOCAL, or ALPHANUMERIC.
        # Omitted when the subject has no sender type of its own.
        number_type: nil,
        # Why the market reached this state, as a sentence to show a person: the specific
        # explanation when one was given (a correction explained, a campaign lapse),
        # otherwise what reason_code means for this market. Not a value to branch on.
        reason: nil,
        # Why the market is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
        # such as CHANNEL_001 (something you owe) or CHANNEL_002 (a correction was
        # requested). The same code the channels resource reports for the market. Switch
        # on this rather than on reason. Omitted while ACTIVE.
        reason_code: nil,
        # The sender itself — a number in E.164, or an alphanumeric sender ID.
        #
        # Always present, and null until a sender exists. The key is on every delivery so
        # a subscriber reads one shape rather than branching on whether the field arrived
        # — the same choice template_id makes on the message payload.
        #
        # It can carry a value at any point in the lifecycle, not only once the market is
        # live: a number ordered and not yet active at the carrier is already known during
        # PROVISIONING, and an alphanumeric sender the customer chose themselves is known
        # before anything is filed. It is null while the market is still waiting on a
        # number, which for a US 10DLC registration is every event up to
        # channel.activated.
        sender_value: nil,
        # Where the market stands: PENDING_REVIEW, ACTION_NEEDED, PROVISIONING, ACTIVE or
        # INACTIVE. PENDING_REVIEW means a registry or a carrier holds it and the wait is
        # theirs; ACTION_NEEDED means it is yours; PROVISIONING means the verdict is in
        # and Sent is acquiring the sender; INACTIVE means it had a working sender and no
        # longer does.
        #
        # Each event name is the transition into one of these, but the two are separate
        # fields and may legitimately differ. A resubmission filed against a market whose
        # sender is already live is channel.submitted carrying ACTIVE: a correction is
        # with the registry and the sender keeps working. Read both.
        status: nil,
        # When the transition happened, in UTC (yyyy-MM-ddTHH:mm:ssZ).
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            country: String,
            account_id: String,
            channel: String,
            compliance: T.nilable(Sentdm::Channels::SuppliedCompliance),
            number_type: T.nilable(String),
            reason: T.nilable(String),
            reason_code: T.nilable(String),
            sender_value: T.nilable(String),
            status: String,
            updated_at: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
