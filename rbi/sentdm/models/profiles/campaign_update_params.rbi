# typed: strong

module Sentdm
  module Models
    module Profiles
      class CampaignUpdateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Profiles::CampaignUpdateParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :profile_id

        sig { returns(String) }
        attr_accessor :campaign_id

        # Campaign data for create or update operation
        sig { returns(Sentdm::Profiles::CampaignUpdateParams::Campaign) }
        attr_reader :campaign

        sig do
          params(
            campaign: Sentdm::Profiles::CampaignUpdateParams::Campaign::OrHash
          ).void
        end
        attr_writer :campaign

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig { returns(T.nilable(String)) }
        attr_reader :x_profile_id

        sig { params(x_profile_id: String).void }
        attr_writer :x_profile_id

        sig do
          params(
            profile_id: String,
            campaign_id: String,
            campaign: Sentdm::Profiles::CampaignUpdateParams::Campaign::OrHash,
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          profile_id:,
          campaign_id:,
          # Campaign data for create or update operation
          campaign:,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          idempotency_key: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              profile_id: String,
              campaign_id: String,
              campaign: Sentdm::Profiles::CampaignUpdateParams::Campaign,
              sandbox: T::Boolean,
              idempotency_key: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Campaign < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Profiles::CampaignUpdateParams::Campaign,
                Sentdm::Internal::AnyHash
              )
            end

          # Campaign description
          sig { returns(String) }
          attr_accessor :description

          # Campaign name
          sig { returns(String) }
          attr_accessor :name

          # Campaign type (e.g., "KYC", "App").
          #
          # Still required of a caller, and consulted by nothing. It named the signup path
          # that produced the campaign, was written to a column no query filters on, no TCR
          # payload carries and no fee or status decision reads, and is now defaulted at the
          # entity instead. It stays required so that a request which was valid before is
          # still valid — dropping it would be the client-visible change, not keeping it.
          sig { returns(String) }
          attr_accessor :type

          # List of use cases with sample messages
          sig do
            returns(
              T::Array[
                Sentdm::Profiles::CampaignUpdateParams::Campaign::UseCase
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

          # Expected messaging volume for this campaign. Numeric string (e.g. "1999",
          # "5000"). Values below 2000 bill at the low-volume tier.
          sig { returns(T.nilable(String)) }
          attr_accessor :volume

          # Campaign data for create or update operation
          sig do
            params(
              description: String,
              name: String,
              type: String,
              use_cases:
                T::Array[
                  Sentdm::Profiles::CampaignUpdateParams::Campaign::UseCase::OrHash
                ],
              help_keywords: T.nilable(String),
              help_message: T.nilable(String),
              message_flow: T.nilable(String),
              optin_keywords: T.nilable(String),
              optin_message: T.nilable(String),
              optout_keywords: T.nilable(String),
              optout_message: T.nilable(String),
              privacy_policy_link: T.nilable(String),
              terms_and_conditions_link: T.nilable(String),
              volume: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Campaign description
            description:,
            # Campaign name
            name:,
            # Campaign type (e.g., "KYC", "App").
            #
            # Still required of a caller, and consulted by nothing. It named the signup path
            # that produced the campaign, was written to a column no query filters on, no TCR
            # payload carries and no fee or status decision reads, and is now defaulted at the
            # entity instead. It stays required so that a request which was valid before is
            # still valid — dropping it would be the client-visible change, not keeping it.
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
            terms_and_conditions_link: nil,
            # Expected messaging volume for this campaign. Numeric string (e.g. "1999",
            # "5000"). Values below 2000 bill at the low-volume tier.
            volume: nil
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
                    Sentdm::Profiles::CampaignUpdateParams::Campaign::UseCase
                  ],
                help_keywords: T.nilable(String),
                help_message: T.nilable(String),
                message_flow: T.nilable(String),
                optin_keywords: T.nilable(String),
                optin_message: T.nilable(String),
                optout_keywords: T.nilable(String),
                optout_message: T.nilable(String),
                privacy_policy_link: T.nilable(String),
                terms_and_conditions_link: T.nilable(String),
                volume: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          class UseCase < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Profiles::CampaignUpdateParams::Campaign::UseCase,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(Sentdm::Profiles::MessagingUseCaseUs::OrSymbol) }
            attr_accessor :messaging_use_case_us

            # Sample messages for this use case (1-5 messages, max 1024 characters each)
            sig { returns(T::Array[String]) }
            attr_accessor :sample_messages

            # Campaign use case with sample messages
            sig do
              params(
                messaging_use_case_us:
                  Sentdm::Profiles::MessagingUseCaseUs::OrSymbol,
                sample_messages: T::Array[String]
              ).returns(T.attached_class)
            end
            def self.new(
              messaging_use_case_us:,
              # Sample messages for this use case (1-5 messages, max 1024 characters each)
              sample_messages:
            )
            end

            sig do
              override.returns(
                {
                  messaging_use_case_us:
                    Sentdm::Profiles::MessagingUseCaseUs::OrSymbol,
                  sample_messages: T::Array[String]
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
