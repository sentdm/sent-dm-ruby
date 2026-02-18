# frozen_string_literal: true

module SentDm
  module Models
    module Brands
      # @see SentDm::Resources::Brands::Campaigns#list
      class CampaignListResponse < SentDm::Internal::Type::BaseModel
        # @!attribute data
        #   The response data (null if error)
        #
        #   @return [Array<SentDm::Models::Brands::TcrCampaignWithUseCases>, nil]
        optional :data,
                 -> { SentDm::Internal::Type::ArrayOf[SentDm::Brands::TcrCampaignWithUseCases] },
                 nil?: true

        # @!attribute error
        #   Error details (null if successful)
        #
        #   @return [SentDm::Models::APIError, nil]
        optional :error, -> { SentDm::APIError }, nil?: true

        # @!attribute meta
        #   Metadata about the request and response
        #
        #   @return [SentDm::Models::APIMeta, nil]
        optional :meta, -> { SentDm::APIMeta }

        # @!attribute success
        #   Indicates whether the request was successful
        #
        #   @return [Boolean, nil]
        optional :success, SentDm::Internal::Type::Boolean

        # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
        #   Standard API response envelope for all v3 endpoints
        #
        #   @param data [Array<SentDm::Models::Brands::TcrCampaignWithUseCases>, nil] The response data (null if error)
        #
        #   @param error [SentDm::Models::APIError, nil] Error details (null if successful)
        #
        #   @param meta [SentDm::Models::APIMeta] Metadata about the request and response
        #
        #   @param success [Boolean] Indicates whether the request was successful
      end
    end
  end
end
