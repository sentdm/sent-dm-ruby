# frozen_string_literal: true

module Sentdm
  module Models
    module Profiles
      class SentDmServicesEndpointsCustomerApIv3ContractsRequestsCampaignsCampaignUseCaseData < Sentdm::Internal::Type::BaseModel
        # @!attribute messaging_use_case_us
        #
        #   @return [Symbol, Sentdm::Models::Profiles::MessagingUseCaseUs]
        required :messaging_use_case_us,
                 enum: -> { Sentdm::Profiles::MessagingUseCaseUs },
                 api_name: :messagingUseCaseUs

        # @!attribute sample_messages
        #   Sample messages for this use case (1-5 messages, max 1024 characters each)
        #
        #   @return [Array<String>]
        required :sample_messages, Sentdm::Internal::Type::ArrayOf[String], api_name: :sampleMessages

        # @!method initialize(messaging_use_case_us:, sample_messages:)
        #   Campaign use case with sample messages
        #
        #   @param messaging_use_case_us [Symbol, Sentdm::Models::Profiles::MessagingUseCaseUs]
        #
        #   @param sample_messages [Array<String>] Sample messages for this use case (1-5 messages, max 1024 characters each)
      end
    end
  end
end
