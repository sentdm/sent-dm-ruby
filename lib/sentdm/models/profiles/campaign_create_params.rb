# frozen_string_literal: true

module Sentdm
  module Models
    module Profiles
      # @see Sentdm::Resources::Profiles::Campaigns#create
      class CampaignCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute profile_id
        #
        #   @return [String]
        required :profile_id, String

        # @!attribute campaign
        #   Campaign data for create or update operation
        #
        #   @return [Sentdm::Models::Profiles::CampaignCreateParams::Campaign]
        required :campaign, -> { Sentdm::Profiles::CampaignCreateParams::Campaign }

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(profile_id:, campaign:, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Profiles::CampaignCreateParams} for more details.
        #
        #   @param profile_id [String]
        #
        #   @param campaign [Sentdm::Models::Profiles::CampaignCreateParams::Campaign] Campaign data for create or update operation
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
        #
        #   @param idempotency_key [String]
        #
        #   @param x_profile_id [String]
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

        class Campaign < Sentdm::Internal::Type::BaseModel
          # @!attribute description
          #   Campaign description
          #
          #   @return [String]
          required :description, String

          # @!attribute name
          #   Campaign name
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #   Campaign type (e.g., "KYC", "App")
          #
          #   @return [String]
          required :type, String

          # @!attribute use_cases
          #   List of use cases with sample messages
          #
          #   @return [Array<Sentdm::Models::Profiles::CampaignCreateParams::Campaign::UseCase>]
          required :use_cases,
                   -> {
                     Sentdm::Internal::Type::ArrayOf[Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase]
                   },
                   api_name: :useCases

          # @!attribute help_keywords
          #   Comma-separated keywords that trigger help message (e.g., "HELP, INFO, SUPPORT")
          #
          #   @return [String, nil]
          optional :help_keywords, String, api_name: :helpKeywords, nil?: true

          # @!attribute help_message
          #   Message sent when user requests help
          #
          #   @return [String, nil]
          optional :help_message, String, api_name: :helpMessage, nil?: true

          # @!attribute message_flow
          #   Description of how messages flow in the campaign
          #
          #   @return [String, nil]
          optional :message_flow, String, api_name: :messageFlow, nil?: true

          # @!attribute optin_keywords
          #   Comma-separated keywords that trigger opt-in (e.g., "YES, START, SUBSCRIBE")
          #
          #   @return [String, nil]
          optional :optin_keywords, String, api_name: :optinKeywords, nil?: true

          # @!attribute optin_message
          #   Message sent when user opts in
          #
          #   @return [String, nil]
          optional :optin_message, String, api_name: :optinMessage, nil?: true

          # @!attribute optout_keywords
          #   Comma-separated keywords that trigger opt-out (e.g., "STOP, UNSUBSCRIBE, END")
          #
          #   @return [String, nil]
          optional :optout_keywords, String, api_name: :optoutKeywords, nil?: true

          # @!attribute optout_message
          #   Message sent when user opts out
          #
          #   @return [String, nil]
          optional :optout_message, String, api_name: :optoutMessage, nil?: true

          # @!attribute privacy_policy_link
          #   URL to privacy policy
          #
          #   @return [String, nil]
          optional :privacy_policy_link, String, api_name: :privacyPolicyLink, nil?: true

          # @!attribute terms_and_conditions_link
          #   URL to terms and conditions
          #
          #   @return [String, nil]
          optional :terms_and_conditions_link, String, api_name: :termsAndConditionsLink, nil?: true

          # @!method initialize(description:, name:, type:, use_cases:, help_keywords: nil, help_message: nil, message_flow: nil, optin_keywords: nil, optin_message: nil, optout_keywords: nil, optout_message: nil, privacy_policy_link: nil, terms_and_conditions_link: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::Profiles::CampaignCreateParams::Campaign} for more details.
          #
          #   Campaign data for create or update operation
          #
          #   @param description [String] Campaign description
          #
          #   @param name [String] Campaign name
          #
          #   @param type [String] Campaign type (e.g., "KYC", "App")
          #
          #   @param use_cases [Array<Sentdm::Models::Profiles::CampaignCreateParams::Campaign::UseCase>] List of use cases with sample messages
          #
          #   @param help_keywords [String, nil] Comma-separated keywords that trigger help message (e.g., "HELP, INFO, SUPPORT")
          #
          #   @param help_message [String, nil] Message sent when user requests help
          #
          #   @param message_flow [String, nil] Description of how messages flow in the campaign
          #
          #   @param optin_keywords [String, nil] Comma-separated keywords that trigger opt-in (e.g., "YES, START, SUBSCRIBE")
          #
          #   @param optin_message [String, nil] Message sent when user opts in
          #
          #   @param optout_keywords [String, nil] Comma-separated keywords that trigger opt-out (e.g., "STOP, UNSUBSCRIBE, END")
          #
          #   @param optout_message [String, nil] Message sent when user opts out
          #
          #   @param privacy_policy_link [String, nil] URL to privacy policy
          #
          #   @param terms_and_conditions_link [String, nil] URL to terms and conditions

          class UseCase < Sentdm::Internal::Type::BaseModel
            # @!attribute messaging_use_case_us
            #
            #   @return [Symbol, Sentdm::Models::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs]
            required :messaging_use_case_us,
                     enum: -> {
                       Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs
                     },
                     api_name: :messagingUseCaseUs

            # @!attribute sample_messages
            #   Sample messages for this use case (1-5 messages, max 1024 characters each)
            #
            #   @return [Array<String>]
            required :sample_messages, Sentdm::Internal::Type::ArrayOf[String], api_name: :sampleMessages

            # @!method initialize(messaging_use_case_us:, sample_messages:)
            #   Campaign use case with sample messages
            #
            #   @param messaging_use_case_us [Symbol, Sentdm::Models::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs]
            #
            #   @param sample_messages [Array<String>] Sample messages for this use case (1-5 messages, max 1024 characters each)

            # @see Sentdm::Models::Profiles::CampaignCreateParams::Campaign::UseCase#messaging_use_case_us
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
      end
    end
  end
end
