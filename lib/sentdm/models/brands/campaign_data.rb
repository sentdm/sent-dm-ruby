# frozen_string_literal: true

module Sentdm
  module Models
    module Brands
      class CampaignData < Sentdm::Internal::Type::BaseModel
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
        #   @return [Array<Sentdm::Models::Brands::SentDmServicesEndpointsCustomerApIv3ContractsRequestsCampaignsCampaignUseCaseData>]
        required :use_cases,
                 -> {
                   Sentdm::Internal::Type::ArrayOf[Sentdm::Brands::SentDmServicesEndpointsCustomerApIv3ContractsRequestsCampaignsCampaignUseCaseData]
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
        #   {Sentdm::Models::Brands::CampaignData} for more details.
        #
        #   Campaign data for create or update operation
        #
        #   @param description [String] Campaign description
        #
        #   @param name [String] Campaign name
        #
        #   @param type [String] Campaign type (e.g., "KYC", "App")
        #
        #   @param use_cases [Array<Sentdm::Models::Brands::SentDmServicesEndpointsCustomerApIv3ContractsRequestsCampaignsCampaignUseCaseData>] List of use cases with sample messages
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
      end
    end
  end
end
