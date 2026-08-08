# typed: strong

module Sentdm
  module Models
    module Profiles
      class BrandCampaign < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Profiles::BrandCampaign, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(Time)) }
        attr_accessor :billed_date

        sig { returns(T.nilable(String)) }
        attr_accessor :brand_id

        sig { returns(T.nilable(Float)) }
        attr_accessor :cost

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig { returns(T.nilable(String)) }
        attr_reader :customer_id

        sig { params(customer_id: String).void }
        attr_writer :customer_id

        # True once every carrier has completed its DCA election and the campaign is
        # operationally ready for traffic.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :dca_elections_complete

        sig { returns(T.nilable(Time)) }
        attr_accessor :dca_elections_completed_at

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # True when the one-time campaign submission fee has already been charged.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_submission_transaction

        sig { params(has_submission_transaction: T::Boolean).void }
        attr_writer :has_submission_transaction

        sig { returns(T.nilable(String)) }
        attr_accessor :help_keywords

        sig { returns(T.nilable(String)) }
        attr_accessor :help_message

        sig { returns(T.nilable(String)) }
        attr_accessor :message_flow

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

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

        sig do
          returns(
            T.nilable(Sentdm::Profiles::BrandCampaign::Status::TaggedSymbol)
          )
        end
        attr_accessor :status

        sig { returns(T.nilable(Time)) }
        attr_accessor :submitted_at

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :submitted_to_tcr

        sig { params(submitted_to_tcr: T::Boolean).void }
        attr_writer :submitted_to_tcr

        # The Campaign Registry identifier, once the campaign has been accepted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tcr_campaign_id

        # Surfaced so customers can see why a submission did not reach the registry.
        sig { returns(T.nilable(String)) }
        attr_accessor :tcr_sync_error

        sig { returns(T.nilable(String)) }
        attr_accessor :terms_and_conditions_link

        # Campaign type (for example KYC or App).
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        sig { returns(T.nilable(Time)) }
        attr_accessor :updated_at

        sig { returns(T.nilable(T::Array[Sentdm::Profiles::CampaignUseCase])) }
        attr_reader :use_cases

        sig do
          params(
            use_cases: T::Array[Sentdm::Profiles::CampaignUseCase::OrHash]
          ).void
        end
        attr_writer :use_cases

        # Expected messaging volume for this campaign — customer-supplied on
        # create/update, and the input to both the TCR usecase classification (LOW_VOLUME
        # vs MIXED/specific) and the campaign fee tier. Surfaced so customers can read
        # back the value they set.
        sig { returns(T.nilable(String)) }
        attr_accessor :volume

        # A 10DLC campaign registered for a brand.
        sig do
          params(
            id: String,
            billed_date: T.nilable(Time),
            brand_id: T.nilable(String),
            cost: T.nilable(Float),
            created_at: Time,
            customer_id: String,
            dca_elections_complete: T.nilable(T::Boolean),
            dca_elections_completed_at: T.nilable(Time),
            description: String,
            has_submission_transaction: T::Boolean,
            help_keywords: T.nilable(String),
            help_message: T.nilable(String),
            message_flow: T.nilable(String),
            name: String,
            optin_keywords: T.nilable(String),
            optin_message: T.nilable(String),
            optout_keywords: T.nilable(String),
            optout_message: T.nilable(String),
            privacy_policy_link: T.nilable(String),
            status:
              T.nilable(Sentdm::Profiles::BrandCampaign::Status::OrSymbol),
            submitted_at: T.nilable(Time),
            submitted_to_tcr: T::Boolean,
            tcr_campaign_id: T.nilable(String),
            tcr_sync_error: T.nilable(String),
            terms_and_conditions_link: T.nilable(String),
            type: String,
            updated_at: T.nilable(Time),
            use_cases: T::Array[Sentdm::Profiles::CampaignUseCase::OrHash],
            volume: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          billed_date: nil,
          brand_id: nil,
          cost: nil,
          created_at: nil,
          customer_id: nil,
          # True once every carrier has completed its DCA election and the campaign is
          # operationally ready for traffic.
          dca_elections_complete: nil,
          dca_elections_completed_at: nil,
          description: nil,
          # True when the one-time campaign submission fee has already been charged.
          has_submission_transaction: nil,
          help_keywords: nil,
          help_message: nil,
          message_flow: nil,
          name: nil,
          optin_keywords: nil,
          optin_message: nil,
          optout_keywords: nil,
          optout_message: nil,
          privacy_policy_link: nil,
          status: nil,
          submitted_at: nil,
          submitted_to_tcr: nil,
          # The Campaign Registry identifier, once the campaign has been accepted.
          tcr_campaign_id: nil,
          # Surfaced so customers can see why a submission did not reach the registry.
          tcr_sync_error: nil,
          terms_and_conditions_link: nil,
          # Campaign type (for example KYC or App).
          type: nil,
          updated_at: nil,
          use_cases: nil,
          # Expected messaging volume for this campaign — customer-supplied on
          # create/update, and the input to both the TCR usecase classification (LOW_VOLUME
          # vs MIXED/specific) and the campaign fee tier. Surfaced so customers can read
          # back the value they set.
          volume: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              billed_date: T.nilable(Time),
              brand_id: T.nilable(String),
              cost: T.nilable(Float),
              created_at: Time,
              customer_id: String,
              dca_elections_complete: T.nilable(T::Boolean),
              dca_elections_completed_at: T.nilable(Time),
              description: String,
              has_submission_transaction: T::Boolean,
              help_keywords: T.nilable(String),
              help_message: T.nilable(String),
              message_flow: T.nilable(String),
              name: String,
              optin_keywords: T.nilable(String),
              optin_message: T.nilable(String),
              optout_keywords: T.nilable(String),
              optout_message: T.nilable(String),
              privacy_policy_link: T.nilable(String),
              status:
                T.nilable(
                  Sentdm::Profiles::BrandCampaign::Status::TaggedSymbol
                ),
              submitted_at: T.nilable(Time),
              submitted_to_tcr: T::Boolean,
              tcr_campaign_id: T.nilable(String),
              tcr_sync_error: T.nilable(String),
              terms_and_conditions_link: T.nilable(String),
              type: String,
              updated_at: T.nilable(Time),
              use_cases: T::Array[Sentdm::Profiles::CampaignUseCase],
              volume: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Status
          extend Sentdm::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Sentdm::Profiles::BrandCampaign::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SENT_CREATED =
            T.let(
              :SENT_CREATED,
              Sentdm::Profiles::BrandCampaign::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :ACTIVE,
              Sentdm::Profiles::BrandCampaign::Status::TaggedSymbol
            )
          EXPIRED =
            T.let(
              :EXPIRED,
              Sentdm::Profiles::BrandCampaign::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Sentdm::Profiles::BrandCampaign::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
