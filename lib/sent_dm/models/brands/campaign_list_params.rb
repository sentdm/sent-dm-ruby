# frozen_string_literal: true

module SentDm
  module Models
    module Brands
      # @see SentDm::Resources::Brands::Campaigns#list
      class CampaignListParams < SentDm::Internal::Type::BaseModel
        extend SentDm::Internal::Type::RequestParameters::Converter
        include SentDm::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
