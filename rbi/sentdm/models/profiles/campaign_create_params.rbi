# typed: strong

module Sentdm
  module Models
    module Profiles
      class CampaignCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Profiles::CampaignCreateParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :profile_id

        # Campaign data for create or update operation
        sig { returns(Sentdm::Profiles::CampaignCreateParams::Campaign) }
        attr_reader :campaign

        sig do
          params(
            campaign: Sentdm::Profiles::CampaignCreateParams::Campaign::OrHash
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
            campaign: Sentdm::Profiles::CampaignCreateParams::Campaign::OrHash,
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          profile_id:,
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
              campaign: Sentdm::Profiles::CampaignCreateParams::Campaign,
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
                Sentdm::Profiles::CampaignCreateParams::Campaign,
                Sentdm::Internal::AnyHash
              )
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
                Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase
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
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::OrHash
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
                    Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase
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

          class UseCase < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase,
                  Sentdm::Internal::AnyHash
                )
              end

            sig do
              returns(
                Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::OrSymbol
              )
            end
            attr_accessor :messaging_use_case_us

            # Sample messages for this use case (1-5 messages, max 1024 characters each)
            sig { returns(T::Array[String]) }
            attr_accessor :sample_messages

            # Campaign use case with sample messages
            sig do
              params(
                messaging_use_case_us:
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::OrSymbol,
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
                    Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::OrSymbol,
                  sample_messages: T::Array[String]
                }
              )
            end
            def to_hash
            end

            module MessagingUseCaseUs
              extend Sentdm::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MARKETING =
                T.let(
                  :MARKETING,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              ACCOUNT_NOTIFICATION =
                T.let(
                  :ACCOUNT_NOTIFICATION,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              CUSTOMER_CARE =
                T.let(
                  :CUSTOMER_CARE,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              FRAUD_ALERT =
                T.let(
                  :FRAUD_ALERT,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              TWO_FA =
                T.let(
                  :TWO_FA,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              DELIVERY_NOTIFICATION =
                T.let(
                  :DELIVERY_NOTIFICATION,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              SECURITY_ALERT =
                T.let(
                  :SECURITY_ALERT,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              M2_M =
                T.let(
                  :M2M,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              MIXED =
                T.let(
                  :MIXED,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              HIGHER_EDUCATION =
                T.let(
                  :HIGHER_EDUCATION,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              POLLING_VOTING =
                T.let(
                  :POLLING_VOTING,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              PUBLIC_SERVICE_ANNOUNCEMENT =
                T.let(
                  :PUBLIC_SERVICE_ANNOUNCEMENT,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              LOW_VOLUME =
                T.let(
                  :LOW_VOLUME,
                  Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Sentdm::Profiles::CampaignCreateParams::Campaign::UseCase::MessagingUseCaseUs::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
