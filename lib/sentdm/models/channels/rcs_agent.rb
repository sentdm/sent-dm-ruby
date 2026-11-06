# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class RcsAgent < Sentdm::Internal::Type::BaseModel
        # @!attribute id
        #   The agent record. Stable across the whole approval, and what support will ask
        #   for.
        #
        #   Nullable and omitted when absent: a sender profile with RCS intent records the
        #   channel but has no agent until the order form is submitted, so no id exists to
        #   report. A zero GUID is not a valid id and is worse than the field being absent.
        #
        #   @return [String, nil]
        optional :id, String, nil?: true

        # @!attribute agent_use_case
        #
        #   @return [String, nil]
        optional :agent_use_case, String, nil?: true

        # @!attribute brand_color
        #
        #   @return [String, nil]
        optional :brand_color, String, nil?: true

        # @!attribute brand_email
        #
        #   @return [String, nil]
        optional :brand_email, String, nil?: true

        # @!attribute brand_name
        #
        #   @return [String, nil]
        optional :brand_name, String, nil?: true

        # @!attribute brand_phone_number
        #
        #   @return [String, nil]
        optional :brand_phone_number, String, nil?: true

        # @!attribute brief_company_description
        #
        #   @return [String, nil]
        optional :brief_company_description, String, nil?: true

        # @!attribute company_ein
        #
        #   @return [String, nil]
        optional :company_ein, String, nil?: true

        # @!attribute contact_name_and_title
        #
        #   @return [String, nil]
        optional :contact_name_and_title, String, nil?: true

        # @!attribute created_at
        #   Omitted when no real agent record exists — the intent-only path has no creation
        #   timestamp.
        #
        #   @return [Time, nil]
        optional :created_at, Time, nil?: true

        # @!attribute customer_support_email
        #
        #   @return [String, nil]
        optional :customer_support_email, String, nil?: true

        # @!attribute customer_support_phone_number
        #
        #   @return [String, nil]
        optional :customer_support_phone_number, String, nil?: true

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute display_name
        #
        #   @return [String, nil]
        optional :display_name, String, nil?: true

        # @!attribute entity_type
        #
        #   @return [String, nil]
        optional :entity_type, String, nil?: true

        # @!attribute help_message
        #
        #   @return [String, nil]
        optional :help_message, String, nil?: true

        # @!attribute official_address
        #   The registered address of the company behind the agent.
        #
        #   @return [Sentdm::Models::Channels::RcsAddress, nil]
        optional :official_address, -> { Sentdm::Channels::RcsAddress }, nil?: true

        # @!attribute opt_in_process_description
        #
        #   @return [String, nil]
        optional :opt_in_process_description, String, nil?: true

        # @!attribute phone_number
        #   The number the agent sends from, derived from brand_phone_number.
        #
        #   @return [String, nil]
        optional :phone_number, String, nil?: true

        # @!attribute privacy_policy_url
        #
        #   @return [String, nil]
        optional :privacy_policy_url, String, nil?: true

        # @!attribute reason
        #   A sentence for reason_code, saying what to do where it is yours. Omitted while
        #   ACTIVE.
        #
        #   @return [String, nil]
        optional :reason, String, nil?: true

        # @!attribute reason_code
        #   Why the agent is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
        #   such as CHANNEL_001 (something you owe) or CHANNEL_009 (under review). Switch on
        #   this rather than on reason. Omitted while ACTIVE. Read-only; when nothing more
        #   specific is known it is the generic reason for the status.
        #
        #   @return [String, nil]
        optional :reason_code, String, nil?: true

        # @!attribute sample_messages
        #
        #   @return [Array<String>, nil]
        optional :sample_messages, Sentdm::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute start_message
        #
        #   @return [String, nil]
        optional :start_message, String, nil?: true

        # @!attribute status
        #   Where the agent stands, in terms of who is holding it up — PROVISIONING,
        #   ACTION_NEEDED, PENDING_REVIEW or ACTIVE.
        #
        #   Resolved from both of the provider's axes rather than reported raw: an agent
        #   whose resubmission we have asked for reads ACTION_NEEDED however its carrier
        #   status still reads, and an agent not yet handed over reads PROVISIONING rather
        #   than pending a review nobody has started.
        #
        #   @return [Symbol, Sentdm::Models::Channels::RcsAgent::Status, nil]
        optional :status, enum: -> { Sentdm::Channels::RcsAgent::Status }, nil?: true

        # @!attribute stop_message
        #
        #   @return [String, nil]
        optional :stop_message, String, nil?: true

        # @!attribute terms_and_conditions_url
        #
        #   @return [String, nil]
        optional :terms_and_conditions_url, String, nil?: true

        # @!attribute website_url
        #
        #   @return [String, nil]
        optional :website_url, String, nil?: true

        # @!method initialize(id: nil, agent_use_case: nil, brand_color: nil, brand_email: nil, brand_name: nil, brand_phone_number: nil, brief_company_description: nil, company_ein: nil, contact_name_and_title: nil, created_at: nil, customer_support_email: nil, customer_support_phone_number: nil, description: nil, display_name: nil, entity_type: nil, help_message: nil, official_address: nil, opt_in_process_description: nil, phone_number: nil, privacy_policy_url: nil, reason: nil, reason_code: nil, sample_messages: nil, start_message: nil, status: nil, stop_message: nil, terms_and_conditions_url: nil, website_url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::RcsAgent} for more details.
        #
        #   An RCS agent as its owner sees it: the order form back, plus where the
        #   submission stands.
        #
        #   Not RcsSenderResponse. That one is the admin projection and carries the pipeline
        #   we track about a customer's request — internalStatus, statusReason, isLaunched —
        #   and the S3 keys behind the assets. None of that is the customer's to read: an
        #   internal status is a note to ourselves, and an S3 key is a storage detail that
        #   would become a contract the moment it was published.
        #
        #   What is here is what the caller sent, in the names it sent them under, plus the
        #   three things only we can answer: the record's id, its status, and the number it
        #   sends from. So a read after a write shows the form as stored rather than as
        #   echoed.
        #
        #   @param id [String, nil] The agent record. Stable across the whole approval, and what support will ask fo
        #
        #   @param agent_use_case [String, nil]
        #
        #   @param brand_color [String, nil]
        #
        #   @param brand_email [String, nil]
        #
        #   @param brand_name [String, nil]
        #
        #   @param brand_phone_number [String, nil]
        #
        #   @param brief_company_description [String, nil]
        #
        #   @param company_ein [String, nil]
        #
        #   @param contact_name_and_title [String, nil]
        #
        #   @param created_at [Time, nil] Omitted when no real agent record exists — the intent-only path has no creation
        #
        #   @param customer_support_email [String, nil]
        #
        #   @param customer_support_phone_number [String, nil]
        #
        #   @param description [String, nil]
        #
        #   @param display_name [String, nil]
        #
        #   @param entity_type [String, nil]
        #
        #   @param help_message [String, nil]
        #
        #   @param official_address [Sentdm::Models::Channels::RcsAddress, nil] The registered address of the company behind the agent.
        #
        #   @param opt_in_process_description [String, nil]
        #
        #   @param phone_number [String, nil] The number the agent sends from, derived from brand_phone_number.
        #
        #   @param privacy_policy_url [String, nil]
        #
        #   @param reason [String, nil] A sentence for reason_code, saying what to do where it is yours. Omitted while A
        #
        #   @param reason_code [String, nil] Why the agent is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value s
        #
        #   @param sample_messages [Array<String>, nil]
        #
        #   @param start_message [String, nil]
        #
        #   @param status [Symbol, Sentdm::Models::Channels::RcsAgent::Status, nil] Where the agent stands, in terms of who is holding it up — PROVISIONING,
        #   ACTION\_
        #
        #   @param stop_message [String, nil]
        #
        #   @param terms_and_conditions_url [String, nil]
        #
        #   @param website_url [String, nil]

        # Where the agent stands, in terms of who is holding it up — PROVISIONING,
        # ACTION_NEEDED, PENDING_REVIEW or ACTIVE.
        #
        # Resolved from both of the provider's axes rather than reported raw: an agent
        # whose resubmission we have asked for reads ACTION_NEEDED however its carrier
        # status still reads, and an agent not yet handed over reads PROVISIONING rather
        # than pending a review nobody has started.
        #
        # @see Sentdm::Models::Channels::RcsAgent#status
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
