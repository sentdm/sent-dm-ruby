# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      module SMS
        # @see Sentdm::Resources::Channels::SMS::TenDlc#add_campaign
        class TenDlcAddCampaignParams < Sentdm::Internal::Type::BaseModel
          extend Sentdm::Internal::Type::RequestParameters::Converter
          include Sentdm::Internal::Type::RequestParameters

          # @!attribute description
          #   What this programme sends. TCR description: what recipients will get and why, in
          #   a sentence. The only one of these TCR takes verbatim as a description of the
          #   programme, which is why it is asked for rather than derived from the customer's
          #   name. Required when `compliance.campaign.inherit != true`.
          #
          #   @return [String]
          required :description, String

          # @!attribute help_keywords
          #   Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [String]
          required :help_keywords, String

          # @!attribute help_message
          #   Help reply. TCR helpMessage. Its presence is what sets subscriberHelp. Required
          #   when `compliance.campaign.inherit != true`.
          #
          #   @return [String]
          required :help_message, String

          # @!attribute message_flow
          #   Consent narrative. TCR messageFlow: how recipients opt in, in prose. Under 40
          #   characters is refused, and carriers reject vague descriptions — say where opt-in
          #   happens, that the box is unchecked by default, and that consent is not a
          #   condition of purchase. Required when `compliance.campaign.inherit != true`.
          #
          #   @return [String]
          required :message_flow, String

          # @!attribute opt_in_keywords
          #   Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES. Required
          #   when `compliance.campaign.inherit != true`.
          #
          #   @return [String]
          required :opt_in_keywords, String

          # @!attribute opt_in_message
          #   Opt-in confirmation. TCR optinMessage. Should state message frequency and that
          #   rates may apply. Its presence is what sets subscriberOptin. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [String]
          required :opt_in_message, String

          # @!attribute opt_out_keywords
          #   Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END, CANCEL,
          #   UNSUBSCRIBE and QUIT are honoured regardless of what is declared. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [String]
          required :opt_out_keywords, String

          # @!attribute opt_out_message
          #   Opt-out confirmation. TCR optoutMessage. Its presence is what sets
          #   subscriberOptout. Required when `compliance.campaign.inherit != true`.
          #
          #   @return [String]
          required :opt_out_message, String

          # @!attribute privacy_policy_link
          #   Privacy policy URL. TCR privacyPolicyLink. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [String]
          required :privacy_policy_link, String

          # @!attribute terms_and_conditions_link
          #   Terms and conditions URL. TCR termsAndConditionsLink. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [String]
          required :terms_and_conditions_link, String

          # @!attribute use_cases
          #   Use cases. What the campaign sends, and an example of each. One to five entries;
          #   how they register is decided by volume, never declared. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [Array<Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams::UseCase>]
          required :use_cases,
                   -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Channels::SMS::TenDlcAddCampaignParams::UseCase] }

          # @!attribute volume
          #   Expected monthly volume. Required whenever the campaign's fields are written. A
          #   whole number of messages, e.g. 1000 or 10000. Decides how the campaign registers
          #   and which fee tier applies: below the low-volume threshold it registers as
          #   LOW_VOLUME with sub-use-cases, above it as a single use case or MIXED. Omitting
          #   it registers the campaign at the higher-fee standard tier. Required when
          #   `compliance.campaign.inherit != true`, whenever its block is written.
          #
          #   @return [String]
          required :volume, String

          # @!attribute idempotency_key
          #
          #   @return [String]
          required :idempotency_key, String

          # @!attribute sandbox
          #   Sandbox flag - when true, the operation is simulated without side effects Useful
          #   for testing integrations without actual execution
          #
          #   @return [Boolean, nil]
          optional :sandbox, Sentdm::Internal::Type::Boolean

          # @!attribute x_profile_id
          #
          #   @return [String, nil]
          optional :x_profile_id, String

          # @!method initialize(description:, help_keywords:, help_message:, message_flow:, opt_in_keywords:, opt_in_message:, opt_out_keywords:, opt_out_message:, privacy_policy_link:, terms_and_conditions_link:, use_cases:, volume:, idempotency_key:, sandbox: nil, x_profile_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams} for more details.
          #
          #   @param description [String] What this programme sends. TCR description: what recipients will get and why, in
          #
          #   @param help_keywords [String] Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO. Required when
          #
          #   @param help_message [String] Help reply. TCR helpMessage. Its presence is what sets subscriberHelp. Required
          #
          #   @param message_flow [String] Consent narrative. TCR messageFlow: how recipients opt in, in prose. Under 40 ch
          #
          #   @param opt_in_keywords [String] Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES. Required wh
          #
          #   @param opt_in_message [String] Opt-in confirmation. TCR optinMessage. Should state message frequency and that r
          #
          #   @param opt_out_keywords [String] Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END, CANCEL, UNSUBS
          #
          #   @param opt_out_message [String] Opt-out confirmation. TCR optoutMessage. Its presence is what sets subscriberOpt
          #
          #   @param privacy_policy_link [String] Privacy policy URL. TCR privacyPolicyLink. Required when `compliance.campaign.in
          #
          #   @param terms_and_conditions_link [String] Terms and conditions URL. TCR termsAndConditionsLink. Required when `compliance.
          #
          #   @param use_cases [Array<Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams::UseCase>] Use cases. What the campaign sends, and an example of each. One to five entries;
          #
          #   @param volume [String] Expected monthly volume. Required whenever the campaign's fields are written. A
          #
          #   @param idempotency_key [String]
          #
          #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
          #
          #   @param x_profile_id [String]
          #
          #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

          class UseCase < Sentdm::Internal::Type::BaseModel
            # @!attribute sample_messages
            #   Sample messages. TCR sample1..sample5 for this use case. One to five, each 20 to
            #   1024 characters and carrying the brand name and an opt-out instruction. At most
            #   five across the campaign, and at least two when a high-volume campaign has a
            #   single use case.
            #
            #   @return [Array<Object>]
            required :sample_messages, Sentdm::Internal::Type::ArrayOf[Sentdm::Internal::Type::Unknown]

            # @!attribute use_case
            #   Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
            #   decides those.
            #
            #   @return [Symbol, Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams::UseCase::UseCase]
            required :use_case, enum: -> { Sentdm::Channels::SMS::TenDlcAddCampaignParams::UseCase::UseCase }

            # @!method initialize(sample_messages:, use_case:)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams::UseCase} for more
            #   details.
            #
            #   @param sample_messages [Array<Object>] Sample messages. TCR sample1..sample5 for this use case. One to five, each 20 to
            #
            #   @param use_case [Symbol, Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams::UseCase::UseCase] Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume decid

            # Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
            # decides those.
            #
            # @see Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams::UseCase#use_case
            module UseCase
              extend Sentdm::Internal::Type::Enum

              MARKETING = :MARKETING
              ACCOUNT_NOTIFICATION = :ACCOUNT_NOTIFICATION
              CUSTOMER_CARE = :CUSTOMER_CARE
              FRAUD_ALERT = :FRAUD_ALERT
              USE_CASE_2_FA = :"2FA"
              DELIVERY_NOTIFICATION = :DELIVERY_NOTIFICATION
              SECURITY_ALERT = :SECURITY_ALERT
              M2_M = :M2M
              HIGHER_EDUCATION = :HIGHER_EDUCATION
              POLLING_VOTING = :POLLING_VOTING
              PUBLIC_SERVICE_ANNOUNCEMENT = :PUBLIC_SERVICE_ANNOUNCEMENT

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
