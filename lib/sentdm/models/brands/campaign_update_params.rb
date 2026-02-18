# frozen_string_literal: true

module Sentdm
  module Models
    module Brands
      # @see Sentdm::Resources::Brands::Campaigns#update
      class CampaignUpdateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute brand_id
        #
        #   @return [String]
        required :brand_id, String

        # @!attribute campaign
        #   Campaign data
        #
        #   @return [Sentdm::Models::Brands::CampaignData]
        required :campaign, -> { Sentdm::Brands::CampaignData }

        # @!attribute test_mode
        #   Test mode flag - when true, the operation is simulated without side effects
        #   Useful for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :test_mode, Sentdm::Internal::Type::Boolean

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!method initialize(brand_id:, campaign:, test_mode: nil, idempotency_key: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Brands::CampaignUpdateParams} for more details.
        #
        #   @param brand_id [String]
        #
        #   @param campaign [Sentdm::Models::Brands::CampaignData] Campaign data
        #
        #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
        #
        #   @param idempotency_key [String]
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
