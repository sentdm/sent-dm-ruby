# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class WhatsappChannel < Sentdm::Internal::Type::BaseModel
        # @!attribute owner_business_id
        #   Derived from the organization's shared-account listing, like SolutionId.
        #
        #   @return [String, nil]
        optional :owner_business_id, String, nil?: true

        # @!attribute phone_number_id
        #   The Meta phone-number id the profile sends from, or null when the account is
        #   connected but no number has been named yet — which is what a provisioning status
        #   means here.
        #
        #   @return [String, nil]
        optional :phone_number_id, String, nil?: true

        # @!attribute reason
        #   A sentence for reason_code, saying what to do where it is yours. Omitted while
        #   ACTIVE.
        #
        #   @return [String, nil]
        optional :reason, String, nil?: true

        # @!attribute reason_code
        #   Why the account is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
        #   such as CHANNEL_001 (something you owe) or CHANNEL_009 (under review). Switch on
        #   this rather than on reason. Omitted while ACTIVE. Read-only; when nothing more
        #   specific is known it is the generic reason for the status.
        #
        #   @return [String, nil]
        optional :reason_code, String, nil?: true

        # @!attribute solution_id
        #   Derived, not echoed. The request no longer accepts this — it is read off the
        #   organization's shared-account listing at connect time and reported back so a
        #   caller can see which partnership the account actually arrived through.
        #
        #   @return [String, nil]
        optional :solution_id, String, nil?: true

        # @!attribute status
        #   Read-only. Never carries a token — the row holds that and it is not returned.
        #   ACTION_NEEDED when no account is connected or the account has no phone number:
        #   both are yours to do.
        #
        #   @return [Symbol, Sentdm::Models::Channels::WhatsappChannel::Status, nil]
        optional :status, enum: -> { Sentdm::Channels::WhatsappChannel::Status }, nil?: true

        # @!attribute waba_id
        #
        #   @return [String, nil]
        optional :waba_id, String, nil?: true

        # @!method initialize(owner_business_id: nil, phone_number_id: nil, reason: nil, reason_code: nil, solution_id: nil, status: nil, waba_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::WhatsappChannel} for more details.
        #
        #   The profile's WhatsApp account. Its status is Meta's verification state.
        #
        #   @param owner_business_id [String, nil] Derived from the organization's shared-account listing, like SolutionId.
        #
        #   @param phone_number_id [String, nil] The Meta phone-number id the profile sends from, or null when the account is con
        #
        #   @param reason [String, nil] A sentence for reason_code, saying what to do where it is yours. Omitted while A
        #
        #   @param reason_code [String, nil] Why the account is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
        #
        #   @param solution_id [String, nil] Derived, not echoed. The request no longer accepts this — it is read off the org
        #
        #   @param status [Symbol, Sentdm::Models::Channels::WhatsappChannel::Status, nil] Read-only. Never carries a token — the row holds that and it is not returned. AC
        #
        #   @param waba_id [String, nil]

        # Read-only. Never carries a token — the row holds that and it is not returned.
        # ACTION_NEEDED when no account is connected or the account has no phone number:
        # both are yours to do.
        #
        # @see Sentdm::Models::Channels::WhatsappChannel#status
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

    WhatsappChannel = Channels::WhatsappChannel
  end
end
