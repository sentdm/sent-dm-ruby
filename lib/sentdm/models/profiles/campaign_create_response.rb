# frozen_string_literal: true

module Sentdm
  module Models
    module Profiles
      # @see Sentdm::Resources::Profiles::Campaigns#create
      class CampaignCreateResponse < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   A 10DLC campaign registered for a brand.
        #
        #   @return [Sentdm::Models::Profiles::CampaignCreateResponse::Data, nil]
        optional :data, -> { Sentdm::Models::Profiles::CampaignCreateResponse::Data }, nil?: true

        # @!attribute error
        #   Error information
        #
        #   @return [Sentdm::Models::ErrorDetail, nil]
        optional :error, -> { Sentdm::ErrorDetail }, nil?: true

        # @!attribute meta
        #   Request and response metadata
        #
        #   @return [Sentdm::Models::APIMeta, nil]
        optional :meta, -> { Sentdm::APIMeta }

        # @!attribute success
        #   Indicates whether the request was successful
        #
        #   @return [Boolean, nil]
        optional :success, Sentdm::Internal::Type::Boolean

        # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
        #   Standard API response envelope for all v3 endpoints
        #
        #   @param data [Sentdm::Models::Profiles::CampaignCreateResponse::Data, nil] A 10DLC campaign registered for a brand.
        #
        #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
        #
        #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
        #
        #   @param success [Boolean] Indicates whether the request was successful

        # @see Sentdm::Models::Profiles::CampaignCreateResponse#data
        class Data < Sentdm::Internal::Type::BaseModel
          # @!attribute id
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

          # @!attribute customer_id
          #
          #   @return [String, nil]
          optional :customer_id, String, api_name: :customerId

          # @!attribute dca_elections_complete
          #   True once every carrier has completed its DCA election and the campaign is
          #   operationally ready for traffic.
          #
          #   @return [Boolean, nil]
          optional :dca_elections_complete,
                   Sentdm::Internal::Type::Boolean,
                   api_name: :dcaElectionsComplete,
                   nil?: true

          # @!attribute dca_elections_completed_at
          #
          #   @return [Time, nil]
          optional :dca_elections_completed_at, Time, api_name: :dcaElectionsCompletedAt, nil?: true

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute has_submission_transaction
          #   True when the one-time campaign submission fee has already been charged.
          #
          #   @return [Boolean, nil]
          optional :has_submission_transaction,
                   Sentdm::Internal::Type::Boolean,
                   api_name: :hasSubmissionTransaction

          # @!attribute help_keywords
          #
          #   @return [String, nil]
          optional :help_keywords, String, api_name: :helpKeywords, nil?: true

          # @!attribute help_message
          #
          #   @return [String, nil]
          optional :help_message, String, api_name: :helpMessage, nil?: true

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

          # @!attribute status
          #
          #   @return [Symbol, Sentdm::Models::Profiles::CampaignCreateResponse::Data::Status, nil]
          optional :status, enum: -> { Sentdm::Models::Profiles::CampaignCreateResponse::Data::Status }, nil?: true

          # @!attribute submitted_at
          #
          #   @return [Time, nil]
          optional :submitted_at, Time, api_name: :submittedAt, nil?: true

          # @!attribute submitted_to_tcr
          #
          #   @return [Boolean, nil]
          optional :submitted_to_tcr, Sentdm::Internal::Type::Boolean, api_name: :submittedToTCR

          # @!attribute tcr_campaign_id
          #   The Campaign Registry identifier, once the campaign has been accepted.
          #
          #   @return [String, nil]
          optional :tcr_campaign_id, String, api_name: :tcrCampaignId, nil?: true

          # @!attribute tcr_sync_error
          #   Surfaced so customers can see why a submission did not reach the registry.
          #
          #   @return [String, nil]
          optional :tcr_sync_error, String, api_name: :tcrSyncError, nil?: true

          # @!attribute terms_and_conditions_link
          #
          #   @return [String, nil]
          optional :terms_and_conditions_link, String, api_name: :termsAndConditionsLink, nil?: true

          # @!attribute type
          #   Campaign type (for example KYC or App).
          #
          #   @return [String, nil]
          optional :type, String

          # @!attribute updated_at
          #
          #   @return [Time, nil]
          optional :updated_at, Time, api_name: :updatedAt, nil?: true

          # @!attribute use_cases
          #
          #   @return [Array<Sentdm::Models::Profiles::CampaignCreateResponse::Data::UseCase>, nil]
          optional :use_cases,
                   -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::Profiles::CampaignCreateResponse::Data::UseCase] },
                   api_name: :useCases

          # @!attribute volume
          #   Expected messaging volume for this campaign — customer-supplied on
          #   create/update, and the input to both the TCR usecase classification (LOW_VOLUME
          #   vs MIXED/specific) and the campaign fee tier. Surfaced so customers can read
          #   back the value they set.
          #
          #   @return [String, nil]
          optional :volume, String, nil?: true

          # @!method initialize(id: nil, billed_date: nil, brand_id: nil, cost: nil, created_at: nil, customer_id: nil, dca_elections_complete: nil, dca_elections_completed_at: nil, description: nil, has_submission_transaction: nil, help_keywords: nil, help_message: nil, message_flow: nil, name: nil, optin_keywords: nil, optin_message: nil, optout_keywords: nil, optout_message: nil, privacy_policy_link: nil, status: nil, submitted_at: nil, submitted_to_tcr: nil, tcr_campaign_id: nil, tcr_sync_error: nil, terms_and_conditions_link: nil, type: nil, updated_at: nil, use_cases: nil, volume: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::Profiles::CampaignCreateResponse::Data} for more details.
          #
          #   A 10DLC campaign registered for a brand.
          #
          #   @param id [String]
          #
          #   @param billed_date [Time, nil]
          #
          #   @param brand_id [String, nil]
          #
          #   @param cost [Float, nil]
          #
          #   @param created_at [Time]
          #
          #   @param customer_id [String]
          #
          #   @param dca_elections_complete [Boolean, nil] True once every carrier has completed its DCA election and the campaign is
          #
          #   @param dca_elections_completed_at [Time, nil]
          #
          #   @param description [String]
          #
          #   @param has_submission_transaction [Boolean] True when the one-time campaign submission fee has already been charged.
          #
          #   @param help_keywords [String, nil]
          #
          #   @param help_message [String, nil]
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
          #   @param status [Symbol, Sentdm::Models::Profiles::CampaignCreateResponse::Data::Status, nil]
          #
          #   @param submitted_at [Time, nil]
          #
          #   @param submitted_to_tcr [Boolean]
          #
          #   @param tcr_campaign_id [String, nil] The Campaign Registry identifier, once the campaign has been accepted.
          #
          #   @param tcr_sync_error [String, nil] Surfaced so customers can see why a submission did not reach the registry.
          #
          #   @param terms_and_conditions_link [String, nil]
          #
          #   @param type [String] Campaign type (for example KYC or App).
          #
          #   @param updated_at [Time, nil]
          #
          #   @param use_cases [Array<Sentdm::Models::Profiles::CampaignCreateResponse::Data::UseCase>]
          #
          #   @param volume [String, nil] Expected messaging volume for this campaign — customer-supplied on create/update

          # @see Sentdm::Models::Profiles::CampaignCreateResponse::Data#status
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
            #   @return [Symbol, Sentdm::Models::Profiles::MessagingUseCaseUs, nil]
            optional :messaging_use_case_us,
                     enum: -> { Sentdm::Profiles::MessagingUseCaseUs },
                     api_name: :messagingUseCaseUs

            # @!attribute sample_messages
            #   Sample messages submitted to the registry for this use case.
            #
            #   @return [Array<String>, nil]
            optional :sample_messages, Sentdm::Internal::Type::ArrayOf[String], api_name: :sampleMessages

            # @!attribute updated_at
            #
            #   @return [Time, nil]
            optional :updated_at, Time, api_name: :updatedAt, nil?: true

            # @!method initialize(id: nil, campaign_id: nil, created_at: nil, customer_id: nil, messaging_use_case_us: nil, sample_messages: nil, updated_at: nil)
            #   Customer-facing use-case representation for the public v3 campaign contract.
            #   Exists for the same reason as BrandCampaignV3Response: nesting the
            #   TcrCampaignUseCase database entity in a public response means any column added
            #   to that table silently becomes part of the customer-facing contract. This DTO is
            #   an explicit allowlist, so a new column stays invisible until it is added here on
            #   purpose. This mirrors exactly the fields the entity already serialized, so it
            #   removes nothing from the current response shape. It only closes the future-leak
            #   path.
            #
            #   @param id [String]
            #
            #   @param campaign_id [String]
            #
            #   @param created_at [Time]
            #
            #   @param customer_id [String]
            #
            #   @param messaging_use_case_us [Symbol, Sentdm::Models::Profiles::MessagingUseCaseUs]
            #
            #   @param sample_messages [Array<String>] Sample messages submitted to the registry for this use case.
            #
            #   @param updated_at [Time, nil]
          end
        end
      end
    end
  end
end
