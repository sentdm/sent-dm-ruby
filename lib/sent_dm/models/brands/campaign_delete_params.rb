# frozen_string_literal: true

module SentDm
  module Models
    module Brands
      # @see SentDm::Resources::Brands::Campaigns#delete
      class CampaignDeleteParams < SentDm::Internal::Type::BaseModel
        extend SentDm::Internal::Type::RequestParameters::Converter
        include SentDm::Internal::Type::RequestParameters

        # @!attribute brand_id
        #
        #   @return [String]
        required :brand_id, String

        # @!attribute body
        #   Request to delete a campaign from a brand
        #
        #   @return [SentDm::Models::Brands::CampaignDeleteParams::Body]
        required :body, -> { SentDm::Brands::CampaignDeleteParams::Body }

        # @!method initialize(brand_id:, body:, request_options: {})
        #   @param brand_id [String]
        #
        #   @param body [SentDm::Models::Brands::CampaignDeleteParams::Body] Request to delete a campaign from a brand
        #
        #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]

        class Body < SentDm::Models::MutationRequest
          # @!method initialize
          #   Request to delete a campaign from a brand
        end
      end
    end
  end
end
