# frozen_string_literal: true

module SentDm
  module Models
    module Brands
      class TcrCampaignWithUseCases < SentDm::Models::Brands::BaseDto
        # @!attribute billed_date
        #
        #   @return [Time, nil]
        optional :billed_date, Time, api_name: :billedDate, nil?: true

        # @!attribute brand_id
        #
        #   @return [String, nil]
        optional :brand_id, String, api_name: :brandId, nil?: true

        # @!attribute cost
        #
        #   @return [Float, nil]
        optional :cost, Float, nil?: true

        # @!attribute csp_id
        #
        #   @return [String, nil]
        optional :csp_id, String, api_name: :cspId, nil?: true

        # @!attribute customer_id
        #
        #   @return [String, nil]
        optional :customer_id, String, api_name: :customerId

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute help_keywords
        #
        #   @return [String, nil]
        optional :help_keywords, String, api_name: :helpKeywords, nil?: true

        # @!attribute help_message
        #
        #   @return [String, nil]
        optional :help_message, String, api_name: :helpMessage, nil?: true

        # @!attribute kyc_submission_form_id
        #
        #   @return [String, nil]
        optional :kyc_submission_form_id, String, api_name: :kycSubmissionFormId, nil?: true

        # @!attribute message_flow
        #
        #   @return [String, nil]
        optional :message_flow, String, api_name: :messageFlow, nil?: true

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute optin_keywords
        #
        #   @return [String, nil]
        optional :optin_keywords, String, api_name: :optinKeywords, nil?: true

        # @!attribute optin_message
        #
        #   @return [String, nil]
        optional :optin_message, String, api_name: :optinMessage, nil?: true

        # @!attribute optout_keywords
        #
        #   @return [String, nil]
        optional :optout_keywords, String, api_name: :optoutKeywords, nil?: true

        # @!attribute optout_message
        #
        #   @return [String, nil]
        optional :optout_message, String, api_name: :optoutMessage, nil?: true

        # @!attribute privacy_policy_link
        #
        #   @return [String, nil]
        optional :privacy_policy_link, String, api_name: :privacyPolicyLink, nil?: true

        # @!attribute reseller_id
        #
        #   @return [String, nil]
        optional :reseller_id, String, api_name: :resellerId, nil?: true

        # @!attribute sharing_status
        #
        #   @return [Symbol, SentDm::Models::Brands::TcrCampaignWithUseCases::SharingStatus, nil]
        optional :sharing_status,
                 enum: -> { SentDm::Brands::TcrCampaignWithUseCases::SharingStatus },
                 api_name: :sharingStatus,
                 nil?: true

        # @!attribute status
        #
        #   @return [Symbol, SentDm::Models::Brands::TcrCampaignWithUseCases::Status, nil]
        optional :status, enum: -> { SentDm::Brands::TcrCampaignWithUseCases::Status }, nil?: true

        # @!attribute submitted_at
        #
        #   @return [Time, nil]
        optional :submitted_at, Time, api_name: :submittedAt, nil?: true

        # @!attribute submitted_to_tcr
        #
        #   @return [Boolean, nil]
        optional :submitted_to_tcr, SentDm::Internal::Type::Boolean, api_name: :submittedToTCR

        # @!attribute tcr_campaign_id
        #
        #   @return [String, nil]
        optional :tcr_campaign_id, String, api_name: :tcrCampaignId, nil?: true

        # @!attribute tcr_sync_error
        #
        #   @return [String, nil]
        optional :tcr_sync_error, String, api_name: :tcrSyncError, nil?: true

        # @!attribute telnyx_campaign_id
        #
        #   @return [String, nil]
        optional :telnyx_campaign_id, String, api_name: :telnyxCampaignId, nil?: true

        # @!attribute terms_and_conditions_link
        #
        #   @return [String, nil]
        optional :terms_and_conditions_link, String, api_name: :termsAndConditionsLink, nil?: true

        # @!attribute type
        #
        #   @return [String, nil]
        optional :type, String

        # @!attribute upstream_cnp_id
        #
        #   @return [String, nil]
        optional :upstream_cnp_id, String, api_name: :upstreamCnpId, nil?: true

        # @!attribute use_cases
        #
        #   @return [Array<SentDm::Models::Brands::TcrCampaignWithUseCases::UseCase>, nil]
        optional :use_cases,
                 -> { SentDm::Internal::Type::ArrayOf[SentDm::Brands::TcrCampaignWithUseCases::UseCase] },
                 api_name: :useCases

        # @!method initialize(billed_date: nil, brand_id: nil, cost: nil, csp_id: nil, customer_id: nil, description: nil, help_keywords: nil, help_message: nil, kyc_submission_form_id: nil, message_flow: nil, name: nil, optin_keywords: nil, optin_message: nil, optout_keywords: nil, optout_message: nil, privacy_policy_link: nil, reseller_id: nil, sharing_status: nil, status: nil, submitted_at: nil, submitted_to_tcr: nil, tcr_campaign_id: nil, tcr_sync_error: nil, telnyx_campaign_id: nil, terms_and_conditions_link: nil, type: nil, upstream_cnp_id: nil, use_cases: nil)
        #   @param billed_date [Time, nil]
        #   @param brand_id [String, nil]
        #   @param cost [Float, nil]
        #   @param csp_id [String, nil]
        #   @param customer_id [String]
        #   @param description [String]
        #   @param help_keywords [String, nil]
        #   @param help_message [String, nil]
        #   @param kyc_submission_form_id [String, nil]
        #   @param message_flow [String, nil]
        #   @param name [String]
        #   @param optin_keywords [String, nil]
        #   @param optin_message [String, nil]
        #   @param optout_keywords [String, nil]
        #   @param optout_message [String, nil]
        #   @param privacy_policy_link [String, nil]
        #   @param reseller_id [String, nil]
        #   @param sharing_status [Symbol, SentDm::Models::Brands::TcrCampaignWithUseCases::SharingStatus, nil]
        #   @param status [Symbol, SentDm::Models::Brands::TcrCampaignWithUseCases::Status, nil]
        #   @param submitted_at [Time, nil]
        #   @param submitted_to_tcr [Boolean]
        #   @param tcr_campaign_id [String, nil]
        #   @param tcr_sync_error [String, nil]
        #   @param telnyx_campaign_id [String, nil]
        #   @param terms_and_conditions_link [String, nil]
        #   @param type [String]
        #   @param upstream_cnp_id [String, nil]
        #   @param use_cases [Array<SentDm::Models::Brands::TcrCampaignWithUseCases::UseCase>]

        module SharingStatus
          extend SentDm::Internal::Type::Enum

          PENDING = :PENDING
          ACCEPTED = :ACCEPTED
          DECLINED = :DECLINED

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module Status
          extend SentDm::Internal::Type::Enum

          SENT_CREATED = :SENT_CREATED
          ACTIVE = :ACTIVE
          EXPIRED = :EXPIRED

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class UseCase < SentDm::Models::Brands::BaseDto
          # @!attribute campaign_id
          #
          #   @return [String, nil]
          optional :campaign_id, String, api_name: :campaignId

          # @!attribute customer_id
          #
          #   @return [String, nil]
          optional :customer_id, String, api_name: :customerId

          # @!attribute messaging_use_case_us
          #
          #   @return [Symbol, SentDm::Models::Brands::MessagingUseCaseUs, nil]
          optional :messaging_use_case_us,
                   enum: -> { SentDm::Brands::MessagingUseCaseUs },
                   api_name: :messagingUseCaseUs

          # @!attribute sample_messages
          #
          #   @return [Array<String>, nil]
          optional :sample_messages, SentDm::Internal::Type::ArrayOf[String], api_name: :sampleMessages

          # @!method initialize(campaign_id: nil, customer_id: nil, messaging_use_case_us: nil, sample_messages: nil)
          #   @param campaign_id [String]
          #   @param customer_id [String]
          #   @param messaging_use_case_us [Symbol, SentDm::Models::Brands::MessagingUseCaseUs]
          #   @param sample_messages [Array<String>]
        end
      end
    end
  end
end
