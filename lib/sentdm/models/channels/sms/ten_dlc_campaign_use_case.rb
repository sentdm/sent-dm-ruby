# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      module SMS
        class TenDlcCampaignUseCase < Sentdm::Internal::Type::BaseModel
          # @!attribute sample_messages
          #   Sample messages. TCR sample1..sample5 for this use case. One to five, each
          #   carrying the brand name and an opt-out instruction.
          #
          #   @return [Array<Object>]
          required :sample_messages, Sentdm::Internal::Type::ArrayOf[Sentdm::Internal::Type::Unknown]

          # @!attribute use_case
          #   Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
          #   decides those.
          #
          #   @return [Symbol, Sentdm::Models::Channels::SMS::TenDlcCampaignUseCase::UseCase]
          required :use_case, enum: -> { Sentdm::Channels::SMS::TenDlcCampaignUseCase::UseCase }

          # @!method initialize(sample_messages:, use_case:)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::Channels::SMS::TenDlcCampaignUseCase} for more details.
          #
          #   @param sample_messages [Array<Object>] Sample messages. TCR sample1..sample5 for this use case. One to five, each carry
          #
          #   @param use_case [Symbol, Sentdm::Models::Channels::SMS::TenDlcCampaignUseCase::UseCase] Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume decid

          # Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
          # decides those.
          #
          # @see Sentdm::Models::Channels::SMS::TenDlcCampaignUseCase#use_case
          module UseCase
            extend Sentdm::Internal::Type::Enum

            MARKETING = :MARKETING
            ACCOUNT_NOTIFICATION = :ACCOUNT_NOTIFICATION
            CUSTOMER_CARE = :CUSTOMER_CARE
            FRAUD_ALERT = :FRAUD_ALERT
            USE_CASE_2_FA = :"2FA"
            DELIVERY_NOTIFICATION = :DELIVERY_NOTIFICATION
            SECURITY_ALERT = :SECURITY_ALERT
            M2_M = :M2M
            HIGHER_EDUCATION = :HIGHER_EDUCATION
            POLLING_VOTING = :POLLING_VOTING
            PUBLIC_SERVICE_ANNOUNCEMENT = :PUBLIC_SERVICE_ANNOUNCEMENT

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
