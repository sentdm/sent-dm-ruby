# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::Markets#list_numbers
      class MarketListNumbersParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute channel
        #
        #   @return [String]
        required :channel, String

        # @!attribute country
        #
        #   @return [String]
        required :country, String

        # @!attribute type
        #
        #   @return [String]
        required :type, String

        # @!attribute campaign_id
        #   Only the numbers of this campaign (US TEN_DLC); all of the market's when absent.
        #
        #   @return [String, nil]
        optional :campaign_id, String, nil?: true

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(channel:, country:, type:, campaign_id: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::MarketListNumbersParams} for more details.
        #
        #   @param channel [String]
        #
        #   @param country [String]
        #
        #   @param type [String]
        #
        #   @param campaign_id [String, nil] Only the numbers of this campaign (US TEN_DLC); all of the market's when absent.
        #
        #   @param x_profile_id [String]
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
