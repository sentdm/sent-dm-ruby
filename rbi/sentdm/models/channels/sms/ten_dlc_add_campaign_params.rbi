# typed: strong

module Sentdm
  module Models
    module Channels
      module SMS
        class TenDlcAddCampaignParams < Sentdm::Internal::Type::BaseModel
          extend Sentdm::Internal::Type::RequestParameters::Converter
          include Sentdm::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Channels::SMS::TenDlcAddCampaignParams,
                Sentdm::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :idempotency_key

          # What this programme sends. TCR description: what recipients will get and why, in
          # a sentence. The only one of these TCR takes verbatim as a description of the
          # programme, which is why it is asked for rather than derived from the customer's
          # name. Required when `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO. Required when
          # `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :help_keywords

          sig { params(help_keywords: String).void }
          attr_writer :help_keywords

          # Help reply. TCR helpMessage. Its presence is what sets subscriberHelp. Required
          # when `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :help_message

          sig { params(help_message: String).void }
          attr_writer :help_message

          # Consent narrative. TCR messageFlow: how recipients opt in, in prose. Under 40
          # characters is refused, and carriers reject vague descriptions — say where opt-in
          # happens, that the box is unchecked by default, and that consent is not a
          # condition of purchase. Required when `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :message_flow

          sig { params(message_flow: String).void }
          attr_writer :message_flow

          # Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES. Required
          # when `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :opt_in_keywords

          sig { params(opt_in_keywords: String).void }
          attr_writer :opt_in_keywords

          # Opt-in confirmation. TCR optinMessage. Should state message frequency and that
          # rates may apply. Its presence is what sets subscriberOptin. Required when
          # `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :opt_in_message

          sig { params(opt_in_message: String).void }
          attr_writer :opt_in_message

          # Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END, CANCEL,
          # UNSUBSCRIBE and QUIT are honoured regardless of what is declared. Required when
          # `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :opt_out_keywords

          sig { params(opt_out_keywords: String).void }
          attr_writer :opt_out_keywords

          # Opt-out confirmation. TCR optoutMessage. Its presence is what sets
          # subscriberOptout. Required when `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :opt_out_message

          sig { params(opt_out_message: String).void }
          attr_writer :opt_out_message

          # Privacy policy URL. TCR privacyPolicyLink. Required when
          # `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :privacy_policy_link

          sig { params(privacy_policy_link: String).void }
          attr_writer :privacy_policy_link

          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :sandbox

          sig { params(sandbox: T::Boolean).void }
          attr_writer :sandbox

          # Terms and conditions URL. TCR termsAndConditionsLink. Required when
          # `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :terms_and_conditions_link

          sig { params(terms_and_conditions_link: String).void }
          attr_writer :terms_and_conditions_link

          # Use cases. What the campaign sends, and an example of each. One to five entries;
          # how they register is decided by volume, never declared. Required when
          # `compliance.campaign.inherit != true`.
          sig do
            returns(
              T.nilable(T::Array[Sentdm::Channels::SMS::TenDlcCampaignUseCase])
            )
          end
          attr_reader :use_cases

          sig do
            params(
              use_cases:
                T::Array[Sentdm::Channels::SMS::TenDlcCampaignUseCase::OrHash]
            ).void
          end
          attr_writer :use_cases

          # Expected monthly volume. Decides how the campaign registers and which fee tier
          # applies: below the low-volume threshold it registers as LOW_VOLUME with
          # sub-use-cases, above it as a single use case or MIXED. Omitting it registers the
          # campaign at the higher-fee standard tier.
          sig { returns(T.nilable(String)) }
          attr_reader :volume

          sig { params(volume: String).void }
          attr_writer :volume

          sig { returns(T.nilable(String)) }
          attr_reader :x_profile_id

          sig { params(x_profile_id: String).void }
          attr_writer :x_profile_id

          sig do
            params(
              idempotency_key: String,
              description: String,
              help_keywords: String,
              help_message: String,
              message_flow: String,
              opt_in_keywords: String,
              opt_in_message: String,
              opt_out_keywords: String,
              opt_out_message: String,
              privacy_policy_link: String,
              sandbox: T::Boolean,
              terms_and_conditions_link: String,
              use_cases:
                T::Array[Sentdm::Channels::SMS::TenDlcCampaignUseCase::OrHash],
              volume: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            idempotency_key:,
            # What this programme sends. TCR description: what recipients will get and why, in
            # a sentence. The only one of these TCR takes verbatim as a description of the
            # programme, which is why it is asked for rather than derived from the customer's
            # name. Required when `compliance.campaign.inherit != true`.
            description: nil,
            # Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO. Required when
            # `compliance.campaign.inherit != true`.
            help_keywords: nil,
            # Help reply. TCR helpMessage. Its presence is what sets subscriberHelp. Required
            # when `compliance.campaign.inherit != true`.
            help_message: nil,
            # Consent narrative. TCR messageFlow: how recipients opt in, in prose. Under 40
            # characters is refused, and carriers reject vague descriptions — say where opt-in
            # happens, that the box is unchecked by default, and that consent is not a
            # condition of purchase. Required when `compliance.campaign.inherit != true`.
            message_flow: nil,
            # Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES. Required
            # when `compliance.campaign.inherit != true`.
            opt_in_keywords: nil,
            # Opt-in confirmation. TCR optinMessage. Should state message frequency and that
            # rates may apply. Its presence is what sets subscriberOptin. Required when
            # `compliance.campaign.inherit != true`.
            opt_in_message: nil,
            # Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END, CANCEL,
            # UNSUBSCRIBE and QUIT are honoured regardless of what is declared. Required when
            # `compliance.campaign.inherit != true`.
            opt_out_keywords: nil,
            # Opt-out confirmation. TCR optoutMessage. Its presence is what sets
            # subscriberOptout. Required when `compliance.campaign.inherit != true`.
            opt_out_message: nil,
            # Privacy policy URL. TCR privacyPolicyLink. Required when
            # `compliance.campaign.inherit != true`.
            privacy_policy_link: nil,
            # Sandbox flag - when true, the operation is simulated without side effects Useful
            # for testing integrations without actual execution
            sandbox: nil,
            # Terms and conditions URL. TCR termsAndConditionsLink. Required when
            # `compliance.campaign.inherit != true`.
            terms_and_conditions_link: nil,
            # Use cases. What the campaign sends, and an example of each. One to five entries;
            # how they register is decided by volume, never declared. Required when
            # `compliance.campaign.inherit != true`.
            use_cases: nil,
            # Expected monthly volume. Decides how the campaign registers and which fee tier
            # applies: below the low-volume threshold it registers as LOW_VOLUME with
            # sub-use-cases, above it as a single use case or MIXED. Omitting it registers the
            # campaign at the higher-fee standard tier.
            volume: nil,
            x_profile_id: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                idempotency_key: String,
                description: String,
                help_keywords: String,
                help_message: String,
                message_flow: String,
                opt_in_keywords: String,
                opt_in_message: String,
                opt_out_keywords: String,
                opt_out_message: String,
                privacy_policy_link: String,
                sandbox: T::Boolean,
                terms_and_conditions_link: String,
                use_cases:
                  T::Array[Sentdm::Channels::SMS::TenDlcCampaignUseCase],
                volume: String,
                x_profile_id: String,
                request_options: Sentdm::RequestOptions
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
