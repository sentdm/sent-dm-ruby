# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class SMSMarket < Sentdm::Internal::Type::BaseModel
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
        #   @return [Sentdm::Models::Channels::SuppliedCompliance, nil]
        optional :compliance, -> { Sentdm::Channels::SuppliedCompliance }, nil?: true

        # @!attribute country
        #
        #   @return [String, nil]
        optional :country, String, nil?: true

        # @!attribute number_type
        #
        #   @return [String, nil]
        optional :number_type, String, nil?: true

        # @!attribute numbers
        #   Every number this market holds or is still owed, each with its area code and its
        #   own status (ACTIVE once it can send, PROVISIONING while it is still to be
        #   assigned, INACTIVE once it could send and no longer can). One entry for a market
        #   holding one number. US 10DLC numbers are assigned when the campaign is approved,
        #   so they read as owed until then. Read-only.
        #
        #   @return [Array<Sentdm::Models::Channels::SMSNumber>, nil]
        optional :numbers, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Channels::SMSNumber] }

        # @!attribute reason
        #   A sentence for reason_code: this market's own explanation, naming what is
        #   outstanding where that is you. Omitted while ACTIVE.
        #
        #   @return [String, nil]
        optional :reason, String, nil?: true

        # @!attribute reason_code
        #   Why the market is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
        #   such as CHANNEL_001 (something you owe) or CHANNEL_009 (under review). Switch on
        #   this rather than on reason. Omitted while ACTIVE. Read-only; when nothing more
        #   specific is known it is the generic reason for the status.
        #
        #   @return [String, nil]
        optional :reason_code, String, nil?: true

        # @!attribute sender_value
        #   The sender itself. Null until a carrier-assigned number is procured. For a
        #   market holding several numbers, the first active one (the first assigned while
        #   none is active) — every number is in numbers.
        #
        #   @return [String, nil]
        optional :sender_value, String, nil?: true

        # @!attribute status
        #   Where this market's sender stands, in terms of who is holding it up —
        #   PROVISIONING, ACTION_NEEDED, PENDING_REVIEW or ACTIVE. Read-only.
        #
        #   Resolved rather than reported raw: a live sender reads ACTIVE whatever it still
        #   owes, a market with outstanding requirements or an open resubmission request
        #   reads ACTION_NEEDED, and a market that registers with a regime reads
        #   PENDING_REVIEW once its brand exists — filing to The Campaign Registry is ours
        #   to do and need not have happened yet, so a dedicated brand created through this
        #   API reads PENDING_REVIEW from the moment it is stored.
        #
        #   Describes whether the market can send, not each number: a market holding several
        #   numbers reads ACTIVE as soon as one of them is, whatever the others are doing.
        #   Each number's own status is in numbers.
        #
        #   @return [Symbol, Sentdm::Models::Channels::SMSMarket::Status, nil]
        optional :status, enum: -> { Sentdm::Channels::SMSMarket::Status }, nil?: true

        # @!method initialize(compliance: nil, country: nil, number_type: nil, numbers: nil, reason: nil, reason_code: nil, sender_value: nil, status: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::SMSMarket} for more details.
        #
        #   One SMS market the profile sends in — its sender, where that sender stands, and
        #   what the market wants.
        #
        #   A profile may send in several: it is a tenant, not a market. Each carries its
        #   own status, because a profile can be live in one country and mid-registration in
        #   another — and each carries what it still owes, rather than that being reported
        #   in a separate array a caller has to join on.
        #
        #   @param compliance [Sentdm::Models::Channels::SuppliedCompliance, nil] What a market has been given: the identity it registers under, its programme, an
        #
        #   @param country [String, nil]
        #
        #   @param number_type [String, nil]
        #
        #   @param numbers [Array<Sentdm::Models::Channels::SMSNumber>] Every number this market holds or is still owed, each with its area code and its
        #
        #   @param reason [String, nil] A sentence for reason_code: this market's own explanation, naming what is outsta
        #
        #   @param reason_code [String, nil] Why the market is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
        #
        #   @param sender_value [String, nil] The sender itself. Null until a carrier-assigned number is procured. For a marke
        #
        #   @param status [Symbol, Sentdm::Models::Channels::SMSMarket::Status, nil] Where this market's sender stands, in terms of who is holding it up — PROVISIONI

        # Where this market's sender stands, in terms of who is holding it up —
        # PROVISIONING, ACTION_NEEDED, PENDING_REVIEW or ACTIVE. Read-only.
        #
        # Resolved rather than reported raw: a live sender reads ACTIVE whatever it still
        # owes, a market with outstanding requirements or an open resubmission request
        # reads ACTION_NEEDED, and a market that registers with a regime reads
        # PENDING_REVIEW once its brand exists — filing to The Campaign Registry is ours
        # to do and need not have happened yet, so a dedicated brand created through this
        # API reads PENDING_REVIEW from the moment it is stored.
        #
        # Describes whether the market can send, not each number: a market holding several
        # numbers reads ACTIVE as soon as one of them is, whatever the others are doing.
        # Each number's own status is in numbers.
        #
        # @see Sentdm::Models::Channels::SMSMarket#status
        module Status
          extend Sentdm::Internal::Type::Enum

          # We are working on it and there is nothing for you to do — a number is being procured, or a registration is being assembled. Minutes to hours.
          PROVISIONING = :PROVISIONING

          # **Waiting on you.** Something the market asks for has not been supplied, a regulator rejected what was, or we have asked you to correct and resubmit your identity data. Nothing progresses until you act. For an SMS market, `GET /v3/channels/sms/{country}/{type}` names what it wants and `PATCH` on the same path supplies it — compliance values, documents and numbers alike.
          ACTION_NEEDED = :ACTION_NEEDED

          # With a regulator or carrier — filed, or assembled and queued for us to file — and their answer is what moves it, to `ACTIVE` or back to `ACTION_NEEDED`. Nothing on your side changes it. Days for SMS, weeks for RCS.
          PENDING_REVIEW = :PENDING_REVIEW

          # Can carry traffic now. A channel a sender profile runs on its organization's reads `ACTIVE` too — it sends, which is what the field is about.
          ACTIVE = :ACTIVE

          # **It had a working sender and no longer does** — the number was released, or the campaign it carried lapsed. Distinct from `PROVISIONING`, which means it has never sent yet: the same absence of a sender, opposite news. Sends will fail until it returns to `ACTIVE`.
          INACTIVE = :INACTIVE

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
