# frozen_string_literal: true

module Sentdm
  module Models
    module Profiles
      # @see Sentdm::Resources::Profiles::Campaigns#delete
      class CampaignDeleteParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute profile_id
        #
        #   @return [String]
        required :profile_id, String

        # @!attribute campaign_id
        #
        #   @return [String]
        required :campaign_id, String

        # @!attribute body
        #   Request to delete a campaign from a brand
        #
        #   @return [Sentdm::Models::Profiles::CampaignDeleteParams::Body]
        required :body, -> { Sentdm::Profiles::CampaignDeleteParams::Body }

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(profile_id:, campaign_id:, body:, x_profile_id: nil, request_options: {})
        #   @param profile_id [String]
        #
        #   @param campaign_id [String]
        #
        #   @param body [Sentdm::Models::Profiles::CampaignDeleteParams::Body] Request to delete a campaign from a brand
        #
        #   @param x_profile_id [String]
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
