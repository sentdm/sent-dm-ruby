# frozen_string_literal: true

module SentDm
  module Models
    module Brands
      # @see SentDm::Resources::Brands::Campaigns#update
      class CampaignUpdateParams < SentDm::Internal::Type::BaseModel
        extend SentDm::Internal::Type::RequestParameters::Converter
        include SentDm::Internal::Type::RequestParameters

        # @!attribute brand_id
        #
        #   @return [String]
        required :brand_id, String

        # @!attribute campaign
        #   Campaign data
        #
        #   @return [SentDm::Models::Brands::CampaignData]
        required :campaign, -> { SentDm::Brands::CampaignData }

        # @!attribute test_mode
        #   Test mode flag - when true, the operation is simulated without side effects
        #   Useful for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :test_mode, SentDm::Internal::Type::Boolean

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!method initialize(brand_id:, campaign:, test_mode: nil, idempotency_key: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {SentDm::Models::Brands::CampaignUpdateParams} for more details.
        #
        #   @param brand_id [String]
        #
        #   @param campaign [SentDm::Models::Brands::CampaignData] Campaign data
        #
        #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
        #
        #   @param idempotency_key [String]
        #
        #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
