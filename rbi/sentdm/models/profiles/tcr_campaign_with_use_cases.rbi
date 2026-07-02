# typed: strong

module Sentdm
  module Models
    module Profiles
      class TcrCampaignWithUseCases < Sentdm::Models::Profiles::BaseDto
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Profiles::TcrCampaignWithUseCases,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :description

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :type

        sig { returns(T.nilable(Time)) }
        attr_accessor :billed_date

        sig { returns(T.nilable(String)) }
        attr_accessor :brand_id

        sig { returns(T.nilable(Float)) }
        attr_accessor :cost

        sig { returns(T.nilable(String)) }
        attr_accessor :csp_id

        sig { returns(T.nilable(String)) }
        attr_reader :customer_id

        sig { params(customer_id: String).void }
        attr_writer :customer_id

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :dca_elections_complete

        sig { returns(T.nilable(Time)) }
        attr_accessor :dca_elections_completed_at

        # True when this campaign already has a billing transaction of reference type
        # TCR_CAMPAIGN_SUBMISSION (the one-time submission fee was charged). Populated
        # only by the campaigns-list path; defaults false on other responses.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_submission_transaction

        sig { params(has_submission_transaction: T::Boolean).void }
        attr_writer :has_submission_transaction

        sig { returns(T.nilable(String)) }
        attr_accessor :help_keywords

        sig { returns(T.nilable(String)) }
        attr_accessor :help_message

        sig { returns(T.nilable(String)) }
        attr_accessor :kyc_submission_form_id

        sig { returns(T.nilable(String)) }
        attr_accessor :message_flow

        sig { returns(T.nilable(String)) }
        attr_accessor :optin_keywords

        sig { returns(T.nilable(String)) }
        attr_accessor :optin_message

        sig { returns(T.nilable(String)) }
        attr_accessor :optout_keywords

        sig { returns(T.nilable(String)) }
        attr_accessor :optout_message

        sig { returns(T.nilable(String)) }
        attr_accessor :privacy_policy_link

        sig { returns(T.nilable(String)) }
        attr_accessor :reseller_id

        sig do
          returns(
            T.nilable(
              Sentdm::Profiles::TcrCampaignWithUseCases::SharingStatus::TaggedSymbol
            )
          )
        end
        attr_accessor :sharing_status

        sig do
          returns(
            T.nilable(
              Sentdm::Profiles::TcrCampaignWithUseCases::Status::TaggedSymbol
            )
          )
        end
        attr_accessor :status

        sig { returns(T.nilable(Time)) }
        attr_accessor :submitted_at

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :submitted_to_tcr

        sig { params(submitted_to_tcr: T::Boolean).void }
        attr_writer :submitted_to_tcr

        sig { returns(T.nilable(String)) }
        attr_accessor :tcr_campaign_id

        sig { returns(T.nilable(String)) }
        attr_accessor :tcr_sync_error

        sig { returns(T.nilable(String)) }
        attr_accessor :telnyx_campaign_id

        sig { returns(T.nilable(String)) }
        attr_accessor :terms_and_conditions_link

        sig { returns(T.nilable(String)) }
        attr_accessor :upstream_cnp_id

        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::Profiles::TcrCampaignWithUseCases::UseCase]
            )
          )
        end
        attr_reader :use_cases

        sig do
          params(
            use_cases:
              T::Array[
                Sentdm::Profiles::TcrCampaignWithUseCases::UseCase::OrHash
              ]
          ).void
        end
        attr_writer :use_cases

        sig do
          params(
            description: String,
            name: String,
            type: String,
            billed_date: T.nilable(Time),
            brand_id: T.nilable(String),
            cost: T.nilable(Float),
            csp_id: T.nilable(String),
            customer_id: String,
            dca_elections_complete: T.nilable(T::Boolean),
            dca_elections_completed_at: T.nilable(Time),
            has_submission_transaction: T::Boolean,
            help_keywords: T.nilable(String),
            help_message: T.nilable(String),
            kyc_submission_form_id: T.nilable(String),
            message_flow: T.nilable(String),
            optin_keywords: T.nilable(String),
            optin_message: T.nilable(String),
            optout_keywords: T.nilable(String),
            optout_message: T.nilable(String),
            privacy_policy_link: T.nilable(String),
            reseller_id: T.nilable(String),
            sharing_status:
              T.nilable(
                Sentdm::Profiles::TcrCampaignWithUseCases::SharingStatus::OrSymbol
              ),
            status:
              T.nilable(
                Sentdm::Profiles::TcrCampaignWithUseCases::Status::OrSymbol
              ),
            submitted_at: T.nilable(Time),
            submitted_to_tcr: T::Boolean,
            tcr_campaign_id: T.nilable(String),
            tcr_sync_error: T.nilable(String),
            telnyx_campaign_id: T.nilable(String),
            terms_and_conditions_link: T.nilable(String),
            upstream_cnp_id: T.nilable(String),
            use_cases:
              T::Array[
                Sentdm::Profiles::TcrCampaignWithUseCases::UseCase::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          description:,
          name:,
          type:,
          billed_date: nil,
          brand_id: nil,
          cost: nil,
          csp_id: nil,
          customer_id: nil,
          dca_elections_complete: nil,
          dca_elections_completed_at: nil,
          # True when this campaign already has a billing transaction of reference type
          # TCR_CAMPAIGN_SUBMISSION (the one-time submission fee was charged). Populated
          # only by the campaigns-list path; defaults false on other responses.
          has_submission_transaction: nil,
          help_keywords: nil,
          help_message: nil,
          kyc_submission_form_id: nil,
          message_flow: nil,
          optin_keywords: nil,
          optin_message: nil,
          optout_keywords: nil,
          optout_message: nil,
          privacy_policy_link: nil,
          reseller_id: nil,
          sharing_status: nil,
          status: nil,
          submitted_at: nil,
          submitted_to_tcr: nil,
          tcr_campaign_id: nil,
          tcr_sync_error: nil,
          telnyx_campaign_id: nil,
          terms_and_conditions_link: nil,
          upstream_cnp_id: nil,
          use_cases: nil
        )
        end

        sig do
          override.returns(
            {
              description: String,
              name: String,
              type: String,
              billed_date: T.nilable(Time),
              brand_id: T.nilable(String),
              cost: T.nilable(Float),
              csp_id: T.nilable(String),
              customer_id: String,
              dca_elections_complete: T.nilable(T::Boolean),
              dca_elections_completed_at: T.nilable(Time),
              has_submission_transaction: T::Boolean,
              help_keywords: T.nilable(String),
              help_message: T.nilable(String),
              kyc_submission_form_id: T.nilable(String),
              message_flow: T.nilable(String),
              optin_keywords: T.nilable(String),
              optin_message: T.nilable(String),
              optout_keywords: T.nilable(String),
              optout_message: T.nilable(String),
              privacy_policy_link: T.nilable(String),
              reseller_id: T.nilable(String),
              sharing_status:
                T.nilable(
                  Sentdm::Profiles::TcrCampaignWithUseCases::SharingStatus::TaggedSymbol
                ),
              status:
                T.nilable(
                  Sentdm::Profiles::TcrCampaignWithUseCases::Status::TaggedSymbol
                ),
              submitted_at: T.nilable(Time),
              submitted_to_tcr: T::Boolean,
              tcr_campaign_id: T.nilable(String),
              tcr_sync_error: T.nilable(String),
              telnyx_campaign_id: T.nilable(String),
              terms_and_conditions_link: T.nilable(String),
              upstream_cnp_id: T.nilable(String),
              use_cases:
                T::Array[Sentdm::Profiles::TcrCampaignWithUseCases::UseCase]
            }
          )
        end
        def to_hash
        end

        module SharingStatus
          extend Sentdm::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Sentdm::Profiles::TcrCampaignWithUseCases::SharingStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :PENDING,
              Sentdm::Profiles::TcrCampaignWithUseCases::SharingStatus::TaggedSymbol
            )
          ACCEPTED =
            T.let(
              :ACCEPTED,
              Sentdm::Profiles::TcrCampaignWithUseCases::SharingStatus::TaggedSymbol
            )
          DECLINED =
            T.let(
              :DECLINED,
              Sentdm::Profiles::TcrCampaignWithUseCases::SharingStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Sentdm::Profiles::TcrCampaignWithUseCases::SharingStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Status
          extend Sentdm::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Sentdm::Profiles::TcrCampaignWithUseCases::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SENT_CREATED =
            T.let(
              :SENT_CREATED,
              Sentdm::Profiles::TcrCampaignWithUseCases::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :ACTIVE,
              Sentdm::Profiles::TcrCampaignWithUseCases::Status::TaggedSymbol
            )
          EXPIRED =
            T.let(
              :EXPIRED,
              Sentdm::Profiles::TcrCampaignWithUseCases::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Sentdm::Profiles::TcrCampaignWithUseCases::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class UseCase < Sentdm::Models::Profiles::BaseDto
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Profiles::TcrCampaignWithUseCases::UseCase,
                Sentdm::Internal::AnyHash
              )
            end

          sig { returns(T::Array[String]) }
          attr_accessor :sample_messages

          sig { returns(T.nilable(String)) }
          attr_reader :campaign_id

          sig { params(campaign_id: String).void }
          attr_writer :campaign_id

          sig { returns(T.nilable(String)) }
          attr_reader :customer_id

          sig { params(customer_id: String).void }
          attr_writer :customer_id

          sig do
            returns(
              T.nilable(Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol)
            )
          end
          attr_reader :messaging_use_case_us

          sig do
            params(
              messaging_use_case_us:
                Sentdm::Profiles::MessagingUseCaseUs::OrSymbol
            ).void
          end
          attr_writer :messaging_use_case_us

          sig do
            params(
              sample_messages: T::Array[String],
              campaign_id: String,
              customer_id: String,
              messaging_use_case_us:
                Sentdm::Profiles::MessagingUseCaseUs::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            sample_messages:,
            campaign_id: nil,
            customer_id: nil,
            messaging_use_case_us: nil
          )
          end

          sig do
            override.returns(
              {
                sample_messages: T::Array[String],
                campaign_id: String,
                customer_id: String,
                messaging_use_case_us:
                  Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol
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
