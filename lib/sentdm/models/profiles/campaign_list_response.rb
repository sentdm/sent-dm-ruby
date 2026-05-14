# frozen_string_literal: true

module Sentdm
  module Models
    module Profiles
      # @see Sentdm::Resources::Profiles::Campaigns#list
      class CampaignListResponse < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   The response data (null if error)
        #
        #   @return [Array<Sentdm::Models::Profiles::CampaignListResponse::Data>, nil]
        optional :data,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::Profiles::CampaignListResponse::Data] },
                 nil?: true

        # @!attribute error
        #   Error information
        #
        #   @return [Sentdm::Models::Profiles::CampaignListResponse::Error, nil]
        optional :error, -> { Sentdm::Models::Profiles::CampaignListResponse::Error }, nil?: true

        # @!attribute meta
        #   Request and response metadata
        #
        #   @return [Sentdm::Models::Profiles::CampaignListResponse::Meta, nil]
        optional :meta, -> { Sentdm::Models::Profiles::CampaignListResponse::Meta }

        # @!attribute success
        #   Indicates whether the request was successful
        #
        #   @return [Boolean, nil]
        optional :success, Sentdm::Internal::Type::Boolean

        # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
        #   Standard API response envelope for all v3 endpoints
        #
        #   @param data [Array<Sentdm::Models::Profiles::CampaignListResponse::Data>, nil] The response data (null if error)
        #
        #   @param error [Sentdm::Models::Profiles::CampaignListResponse::Error, nil] Error information
        #
        #   @param meta [Sentdm::Models::Profiles::CampaignListResponse::Meta] Request and response metadata
        #
        #   @param success [Boolean] Indicates whether the request was successful

        class Data < Sentdm::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier
          #
          #   @return [String, nil]
          optional :id, String

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

          # @!attribute created_at
          #
          #   @return [Time, nil]
          optional :created_at, Time, api_name: :createdAt

          # @!attribute csp_id
          #
          #   @return [String, nil]
          optional :csp_id, String, api_name: :cspId, nil?: true

          # @!attribute customer_id
          #
          #   @return [String, nil]
          optional :customer_id, String, api_name: :customerId

          # @!attribute dca_elections_complete
          #
          #   @return [Boolean, nil]
          optional :dca_elections_complete, Sentdm::Internal::Type::Boolean, api_name: :dcaElectionsComplete

          # @!attribute dca_elections_completed_at
          #
          #   @return [Time, nil]
          optional :dca_elections_completed_at, Time, api_name: :dcaElectionsCompletedAt, nil?: true

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
          #   @return [Symbol, Sentdm::Models::Profiles::CampaignListResponse::Data::SharingStatus, nil]
          optional :sharing_status,
                   enum: -> { Sentdm::Models::Profiles::CampaignListResponse::Data::SharingStatus },
                   api_name: :sharingStatus,
                   nil?: true

          # @!attribute status
          #
          #   @return [Symbol, Sentdm::Models::Profiles::CampaignListResponse::Data::Status, nil]
          optional :status, enum: -> { Sentdm::Models::Profiles::CampaignListResponse::Data::Status }, nil?: true

          # @!attribute submitted_at
          #
          #   @return [Time, nil]
          optional :submitted_at, Time, api_name: :submittedAt, nil?: true

          # @!attribute submitted_to_tcr
          #
          #   @return [Boolean, nil]
          optional :submitted_to_tcr, Sentdm::Internal::Type::Boolean, api_name: :submittedToTCR

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

          # @!attribute updated_at
          #
          #   @return [Time, nil]
          optional :updated_at, Time, api_name: :updatedAt, nil?: true

          # @!attribute upstream_cnp_id
          #
          #   @return [String, nil]
          optional :upstream_cnp_id, String, api_name: :upstreamCnpId, nil?: true

          # @!attribute use_cases
          #
          #   @return [Array<Sentdm::Models::Profiles::CampaignListResponse::Data::UseCase>, nil]
          optional :use_cases,
                   -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::Profiles::CampaignListResponse::Data::UseCase] },
                   api_name: :useCases

          # @!method initialize(id: nil, billed_date: nil, brand_id: nil, cost: nil, created_at: nil, csp_id: nil, customer_id: nil, dca_elections_complete: nil, dca_elections_completed_at: nil, description: nil, help_keywords: nil, help_message: nil, kyc_submission_form_id: nil, message_flow: nil, name: nil, optin_keywords: nil, optin_message: nil, optout_keywords: nil, optout_message: nil, privacy_policy_link: nil, reseller_id: nil, sharing_status: nil, status: nil, submitted_at: nil, submitted_to_tcr: nil, tcr_campaign_id: nil, tcr_sync_error: nil, telnyx_campaign_id: nil, terms_and_conditions_link: nil, type: nil, updated_at: nil, upstream_cnp_id: nil, use_cases: nil)
          #   @param id [String] Unique identifier
          #
          #   @param billed_date [Time, nil]
          #
          #   @param brand_id [String, nil]
          #
          #   @param cost [Float, nil]
          #
          #   @param created_at [Time]
          #
          #   @param csp_id [String, nil]
          #
          #   @param customer_id [String]
          #
          #   @param dca_elections_complete [Boolean]
          #
          #   @param dca_elections_completed_at [Time, nil]
          #
          #   @param description [String]
          #
          #   @param help_keywords [String, nil]
          #
          #   @param help_message [String, nil]
          #
          #   @param kyc_submission_form_id [String, nil]
          #
          #   @param message_flow [String, nil]
          #
          #   @param name [String]
          #
          #   @param optin_keywords [String, nil]
          #
          #   @param optin_message [String, nil]
          #
          #   @param optout_keywords [String, nil]
          #
          #   @param optout_message [String, nil]
          #
          #   @param privacy_policy_link [String, nil]
          #
          #   @param reseller_id [String, nil]
          #
          #   @param sharing_status [Symbol, Sentdm::Models::Profiles::CampaignListResponse::Data::SharingStatus, nil]
          #
          #   @param status [Symbol, Sentdm::Models::Profiles::CampaignListResponse::Data::Status, nil]
          #
          #   @param submitted_at [Time, nil]
          #
          #   @param submitted_to_tcr [Boolean]
          #
          #   @param tcr_campaign_id [String, nil]
          #
          #   @param tcr_sync_error [String, nil]
          #
          #   @param telnyx_campaign_id [String, nil]
          #
          #   @param terms_and_conditions_link [String, nil]
          #
          #   @param type [String]
          #
          #   @param updated_at [Time, nil]
          #
          #   @param upstream_cnp_id [String, nil]
          #
          #   @param use_cases [Array<Sentdm::Models::Profiles::CampaignListResponse::Data::UseCase>]

          # @see Sentdm::Models::Profiles::CampaignListResponse::Data#sharing_status
          module SharingStatus
            extend Sentdm::Internal::Type::Enum

            PENDING = :PENDING
            ACCEPTED = :ACCEPTED
            DECLINED = :DECLINED

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Sentdm::Models::Profiles::CampaignListResponse::Data#status
          module Status
            extend Sentdm::Internal::Type::Enum

            SENT_CREATED = :SENT_CREATED
            ACTIVE = :ACTIVE
            EXPIRED = :EXPIRED

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class UseCase < Sentdm::Internal::Type::BaseModel
            # @!attribute id
            #   Unique identifier
            #
            #   @return [String, nil]
            optional :id, String

            # @!attribute campaign_id
            #
            #   @return [String, nil]
            optional :campaign_id, String, api_name: :campaignId

            # @!attribute created_at
            #
            #   @return [Time, nil]
            optional :created_at, Time, api_name: :createdAt

            # @!attribute customer_id
            #
            #   @return [String, nil]
            optional :customer_id, String, api_name: :customerId

            # @!attribute messaging_use_case_us
            #
            #   @return [Symbol, Sentdm::Models::Profiles::CampaignListResponse::Data::UseCase::MessagingUseCaseUs, nil]
            optional :messaging_use_case_us,
                     enum: -> { Sentdm::Models::Profiles::CampaignListResponse::Data::UseCase::MessagingUseCaseUs },
                     api_name: :messagingUseCaseUs

            # @!attribute sample_messages
            #
            #   @return [Array<String>, nil]
            optional :sample_messages, Sentdm::Internal::Type::ArrayOf[String], api_name: :sampleMessages

            # @!attribute updated_at
            #
            #   @return [Time, nil]
            optional :updated_at, Time, api_name: :updatedAt, nil?: true

            # @!method initialize(id: nil, campaign_id: nil, created_at: nil, customer_id: nil, messaging_use_case_us: nil, sample_messages: nil, updated_at: nil)
            #   @param id [String] Unique identifier
            #
            #   @param campaign_id [String]
            #
            #   @param created_at [Time]
            #
            #   @param customer_id [String]
            #
            #   @param messaging_use_case_us [Symbol, Sentdm::Models::Profiles::CampaignListResponse::Data::UseCase::MessagingUseCaseUs]
            #
            #   @param sample_messages [Array<String>]
            #
            #   @param updated_at [Time, nil]

            # @see Sentdm::Models::Profiles::CampaignListResponse::Data::UseCase#messaging_use_case_us
            module MessagingUseCaseUs
              extend Sentdm::Internal::Type::Enum

              MARKETING = :MARKETING
              ACCOUNT_NOTIFICATION = :ACCOUNT_NOTIFICATION
              CUSTOMER_CARE = :CUSTOMER_CARE
              FRAUD_ALERT = :FRAUD_ALERT
              TWO_FA = :TWO_FA
              DELIVERY_NOTIFICATION = :DELIVERY_NOTIFICATION
              SECURITY_ALERT = :SECURITY_ALERT
              M2_M = :M2M
              MIXED = :MIXED
              HIGHER_EDUCATION = :HIGHER_EDUCATION
              POLLING_VOTING = :POLLING_VOTING
              PUBLIC_SERVICE_ANNOUNCEMENT = :PUBLIC_SERVICE_ANNOUNCEMENT
              LOW_VOLUME = :LOW_VOLUME

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        # @see Sentdm::Models::Profiles::CampaignListResponse#error
        class Error < Sentdm::Internal::Type::BaseModel
          # @!attribute code
          #   Machine-readable error code (e.g., "RESOURCE_001")
          #
          #   @return [String, nil]
          optional :code, String

          # @!attribute details
          #   Additional validation error details (field-level errors)
          #
          #   @return [Hash{Symbol=>Array<String>}, nil]
          optional :details,
                   Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]],
                   nil?: true

          # @!attribute doc_url
          #   URL to documentation about this error
          #
          #   @return [String, nil]
          optional :doc_url, String, nil?: true

          # @!attribute message
          #   Human-readable error message
          #
          #   @return [String, nil]
          optional :message, String

          # @!method initialize(code: nil, details: nil, doc_url: nil, message: nil)
          #   Error information
          #
          #   @param code [String] Machine-readable error code (e.g., "RESOURCE_001")
          #
          #   @param details [Hash{Symbol=>Array<String>}, nil] Additional validation error details (field-level errors)
          #
          #   @param doc_url [String, nil] URL to documentation about this error
          #
          #   @param message [String] Human-readable error message
        end

        # @see Sentdm::Models::Profiles::CampaignListResponse#meta
        class Meta < Sentdm::Internal::Type::BaseModel
          # @!attribute request_id
          #   Unique identifier for this request (for tracing and support)
          #
          #   @return [String, nil]
          optional :request_id, String

          # @!attribute timestamp
          #   Server timestamp when the response was generated
          #
          #   @return [Time, nil]
          optional :timestamp, Time

          # @!attribute version
          #   API version used for this request
          #
          #   @return [String, nil]
          optional :version, String

          # @!method initialize(request_id: nil, timestamp: nil, version: nil)
          #   Request and response metadata
          #
          #   @param request_id [String] Unique identifier for this request (for tracing and support)
          #
          #   @param timestamp [Time] Server timestamp when the response was generated
          #
          #   @param version [String] API version used for this request
        end
      end
    end
  end
end
