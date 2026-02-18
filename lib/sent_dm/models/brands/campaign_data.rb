# frozen_string_literal: true

module SentDm
  module Models
    module Brands
      class CampaignData < SentDm::Internal::Type::BaseModel
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
        #   @return [Array<SentDm::Models::Brands::CampaignData::UseCase>]
        required :use_cases,
                 -> { SentDm::Internal::Type::ArrayOf[SentDm::Brands::CampaignData::UseCase] },
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
        #   {SentDm::Models::Brands::CampaignData} for more details.
        #
        #   Campaign data for create or update operation
        #
        #   @param description [String] Campaign description
        #
        #   @param name [String] Campaign name
        #
        #   @param type [String] Campaign type (e.g., "KYC", "App")
        #
        #   @param use_cases [Array<SentDm::Models::Brands::CampaignData::UseCase>] List of use cases with sample messages
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

        class UseCase < SentDm::Internal::Type::BaseModel
          # @!attribute messaging_use_case_us
          #   US messaging use case category
          #
          #   @return [Symbol, SentDm::Models::Brands::MessagingUseCaseUs]
          required :messaging_use_case_us,
                   enum: -> { SentDm::Brands::MessagingUseCaseUs },
                   api_name: :messagingUseCaseUs

          # @!attribute sample_messages
          #   Sample messages for this use case (1-5 messages, max 1024 characters each)
          #
          #   @return [Array<String>]
          required :sample_messages, SentDm::Internal::Type::ArrayOf[String], api_name: :sampleMessages

          # @!method initialize(messaging_use_case_us:, sample_messages:)
          #   Campaign use case with sample messages
          #
          #   @param messaging_use_case_us [Symbol, SentDm::Models::Brands::MessagingUseCaseUs] US messaging use case category
          #
          #   @param sample_messages [Array<String>] Sample messages for this use case (1-5 messages, max 1024 characters each)
        end
      end
    end
  end
end
