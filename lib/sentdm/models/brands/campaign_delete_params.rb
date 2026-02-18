# frozen_string_literal: true

module Sentdm
  module Models
    module Brands
      # @see Sentdm::Resources::Brands::Campaigns#delete
      class CampaignDeleteParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute brand_id
        #
        #   @return [String]
        required :brand_id, String

        # @!attribute body
        #   Request to delete a campaign from a brand
        #
        #   @return [Sentdm::Models::Brands::CampaignDeleteParams::Body]
        required :body, -> { Sentdm::Brands::CampaignDeleteParams::Body }

        # @!method initialize(brand_id:, body:, request_options: {})
        #   @param brand_id [String]
        #
        #   @param body [Sentdm::Models::Brands::CampaignDeleteParams::Body] Request to delete a campaign from a brand
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

        class Body < Sentdm::Models::MutationRequest
          # @!method initialize
          #   Request to delete a campaign from a brand
        end
      end
    end
  end
end
