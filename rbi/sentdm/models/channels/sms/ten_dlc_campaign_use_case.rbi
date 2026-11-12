# typed: strong

module Sentdm
  module Models
    module Channels
      module SMS
        class TenDlcCampaignUseCase < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Channels::SMS::TenDlcCampaignUseCase,
                Sentdm::Internal::AnyHash
              )
            end

          # Sample messages. TCR sample1..sample5 for this use case. One to five, each
          # carrying the brand name and an opt-out instruction.
          sig { returns(T::Array[T.anything]) }
          attr_accessor :sample_messages

          # Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
          # decides those.
          sig do
            returns(
              Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::OrSymbol
            )
          end
          attr_accessor :use_case

          sig do
            params(
              sample_messages: T::Array[T.anything],
              use_case:
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Sample messages. TCR sample1..sample5 for this use case. One to five, each
            # carrying the brand name and an opt-out instruction.
            sample_messages:,
            # Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
            # decides those.
            use_case:
          )
          end

          sig do
            override.returns(
              {
                sample_messages: T::Array[T.anything],
                use_case:
                  Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::OrSymbol
              }
            )
          end
          def to_hash
          end

          # Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
          # decides those.
          module UseCase
            extend Sentdm::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MARKETING =
              T.let(
                :MARKETING,
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )
            ACCOUNT_NOTIFICATION =
              T.let(
                :ACCOUNT_NOTIFICATION,
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )
            CUSTOMER_CARE =
              T.let(
                :CUSTOMER_CARE,
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )
            FRAUD_ALERT =
              T.let(
                :FRAUD_ALERT,
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )
            USE_CASE_2_FA =
              T.let(
                :"2FA",
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )
            DELIVERY_NOTIFICATION =
              T.let(
                :DELIVERY_NOTIFICATION,
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )
            SECURITY_ALERT =
              T.let(
                :SECURITY_ALERT,
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )
            M2_M =
              T.let(
                :M2M,
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )
            HIGHER_EDUCATION =
              T.let(
                :HIGHER_EDUCATION,
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )
            POLLING_VOTING =
              T.let(
                :POLLING_VOTING,
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )
            PUBLIC_SERVICE_ANNOUNCEMENT =
              T.let(
                :PUBLIC_SERVICE_ANNOUNCEMENT,
                Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase::TaggedSymbol
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
