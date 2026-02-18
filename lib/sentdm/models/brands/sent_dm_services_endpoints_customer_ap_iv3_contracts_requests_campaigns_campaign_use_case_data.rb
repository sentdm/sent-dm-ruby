# frozen_string_literal: true

module Sentdm
  module Models
    module Brands
      class SentDmServicesEndpointsCustomerApIv3ContractsRequestsCampaignsCampaignUseCaseData < Sentdm::Internal::Type::BaseModel
        # @!attribute messaging_use_case_us
        #   US messaging use case category
        #
        #   @return [Symbol, Sentdm::Models::Brands::MessagingUseCaseUs]
        required :messaging_use_case_us,
                 enum: -> { Sentdm::Brands::MessagingUseCaseUs },
                 api_name: :messagingUseCaseUs

        # @!attribute sample_messages
        #   Sample messages for this use case (1-5 messages, max 1024 characters each)
        #
        #   @return [Array<String>]
        required :sample_messages, Sentdm::Internal::Type::ArrayOf[String], api_name: :sampleMessages

        # @!method initialize(messaging_use_case_us:, sample_messages:)
        #   Campaign use case with sample messages
        #
        #   @param messaging_use_case_us [Symbol, Sentdm::Models::Brands::MessagingUseCaseUs] US messaging use case category
        #
        #   @param sample_messages [Array<String>] Sample messages for this use case (1-5 messages, max 1024 characters each)
      end
    end
  end
end
