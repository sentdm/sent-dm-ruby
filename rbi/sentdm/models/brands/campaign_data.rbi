# typed: strong

module Sentdm
  module Models
    module Brands
      class CampaignData < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Brands::CampaignData, Sentdm::Internal::AnyHash)
          end

        # Campaign description
        sig { returns(String) }
        attr_accessor :description

        # Campaign name
        sig { returns(String) }
        attr_accessor :name

        # Campaign type (e.g., "KYC", "App")
        sig { returns(String) }
        attr_accessor :type

        # List of use cases with sample messages
        sig do
          returns(
            T::Array[
              Sentdm::Brands::SentDmServicesEndpointsCustomerApIv3ContractsRequestsCampaignsCampaignUseCaseData
            ]
          )
        end
        attr_accessor :use_cases

        # Comma-separated keywords that trigger help message (e.g., "HELP, INFO, SUPPORT")
        sig { returns(T.nilable(String)) }
        attr_accessor :help_keywords

        # Message sent when user requests help
        sig { returns(T.nilable(String)) }
        attr_accessor :help_message

        # Description of how messages flow in the campaign
        sig { returns(T.nilable(String)) }
        attr_accessor :message_flow

        # Comma-separated keywords that trigger opt-in (e.g., "YES, START, SUBSCRIBE")
        sig { returns(T.nilable(String)) }
        attr_accessor :optin_keywords

        # Message sent when user opts in
        sig { returns(T.nilable(String)) }
        attr_accessor :optin_message

        # Comma-separated keywords that trigger opt-out (e.g., "STOP, UNSUBSCRIBE, END")
        sig { returns(T.nilable(String)) }
        attr_accessor :optout_keywords

        # Message sent when user opts out
        sig { returns(T.nilable(String)) }
        attr_accessor :optout_message

        # URL to privacy policy
        sig { returns(T.nilable(String)) }
        attr_accessor :privacy_policy_link

        # URL to terms and conditions
        sig { returns(T.nilable(String)) }
        attr_accessor :terms_and_conditions_link

        # Campaign data for create or update operation
        sig do
          params(
            description: String,
            name: String,
            type: String,
            use_cases:
              T::Array[
                Sentdm::Brands::SentDmServicesEndpointsCustomerApIv3ContractsRequestsCampaignsCampaignUseCaseData::OrHash
              ],
            help_keywords: T.nilable(String),
            help_message: T.nilable(String),
            message_flow: T.nilable(String),
            optin_keywords: T.nilable(String),
            optin_message: T.nilable(String),
            optout_keywords: T.nilable(String),
            optout_message: T.nilable(String),
            privacy_policy_link: T.nilable(String),
            terms_and_conditions_link: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Campaign description
          description:,
          # Campaign name
          name:,
          # Campaign type (e.g., "KYC", "App")
          type:,
          # List of use cases with sample messages
          use_cases:,
          # Comma-separated keywords that trigger help message (e.g., "HELP, INFO, SUPPORT")
          help_keywords: nil,
          # Message sent when user requests help
          help_message: nil,
          # Description of how messages flow in the campaign
          message_flow: nil,
          # Comma-separated keywords that trigger opt-in (e.g., "YES, START, SUBSCRIBE")
          optin_keywords: nil,
          # Message sent when user opts in
          optin_message: nil,
          # Comma-separated keywords that trigger opt-out (e.g., "STOP, UNSUBSCRIBE, END")
          optout_keywords: nil,
          # Message sent when user opts out
          optout_message: nil,
          # URL to privacy policy
          privacy_policy_link: nil,
          # URL to terms and conditions
          terms_and_conditions_link: nil
        )
        end

        sig do
          override.returns(
            {
              description: String,
              name: String,
              type: String,
              use_cases:
                T::Array[
                  Sentdm::Brands::SentDmServicesEndpointsCustomerApIv3ContractsRequestsCampaignsCampaignUseCaseData
                ],
              help_keywords: T.nilable(String),
              help_message: T.nilable(String),
              message_flow: T.nilable(String),
              optin_keywords: T.nilable(String),
              optin_message: T.nilable(String),
              optout_keywords: T.nilable(String),
              optout_message: T.nilable(String),
              privacy_policy_link: T.nilable(String),
              terms_and_conditions_link: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
