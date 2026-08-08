# frozen_string_literal: true

module Sentdm
  module Models
    module Profiles
      class CampaignUseCase < Sentdm::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute campaign_id
        #
        #   @return [String, nil]
        optional :campaign_id, String, api_name: :campaignId

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :createdAt

        # @!attribute customer_id
        #
        #   @return [String, nil]
        optional :customer_id, String, api_name: :customerId

        # @!attribute messaging_use_case_us
        #
        #   @return [Symbol, Sentdm::Models::Profiles::MessagingUseCaseUs, nil]
        optional :messaging_use_case_us,
                 enum: -> { Sentdm::Profiles::MessagingUseCaseUs },
                 api_name: :messagingUseCaseUs

        # @!attribute sample_messages
        #   Sample messages submitted to the registry for this use case.
        #
        #   @return [Array<String>, nil]
        optional :sample_messages, Sentdm::Internal::Type::ArrayOf[String], api_name: :sampleMessages

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, api_name: :updatedAt, nil?: true

        # @!method initialize(id: nil, campaign_id: nil, created_at: nil, customer_id: nil, messaging_use_case_us: nil, sample_messages: nil, updated_at: nil)
        #   Customer-facing use-case representation for the public v3 campaign contract.
        #   Exists for the same reason as BrandCampaignV3Response: nesting the
        #   TcrCampaignUseCase database entity in a public response means any column added
        #   to that table silently becomes part of the customer-facing contract. This DTO is
        #   an explicit allowlist, so a new column stays invisible until it is added here on
        #   purpose. This mirrors exactly the fields the entity already serialized, so it
        #   removes nothing from the current response shape. It only closes the future-leak
        #   path.
        #
        #   @param id [String]
        #
        #   @param campaign_id [String]
        #
        #   @param created_at [Time]
        #
        #   @param customer_id [String]
        #
        #   @param messaging_use_case_us [Symbol, Sentdm::Models::Profiles::MessagingUseCaseUs]
        #
        #   @param sample_messages [Array<String>] Sample messages submitted to the registry for this use case.
        #
        #   @param updated_at [Time, nil]
      end
    end
  end
end
