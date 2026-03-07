# frozen_string_literal: true

module Sentdm
  module Models
    module Brands
      # @see Sentdm::Resources::Brands::Campaigns#list
      class CampaignListParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute brand_id
        #
        #   @return [String]
        required :brand_id, String

        # @!method initialize(brand_id:, request_options: {})
        #   @param brand_id [String]
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
