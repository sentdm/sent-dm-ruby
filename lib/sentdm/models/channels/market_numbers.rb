# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class MarketNumbers < Sentdm::Internal::Type::BaseModel
        # @!attribute channel
        #
        #   @return [String, nil]
        optional :channel, String

        # @!attribute country
        #   ISO 3166-1 alpha-2, uppercase.
        #
        #   @return [String, nil]
        optional :country, String

        # @!attribute numbers
        #   Empty, never null, when the customer holds nothing there.
        #
        #   @return [Array<Sentdm::Models::Channels::MarketNumber>, nil]
        optional :numbers, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Channels::MarketNumber] }

        # @!method initialize(channel: nil, country: nil, numbers: nil)
        #   The numbers a customer holds in one market: GET
        #   /v3/channels/{channel}/{country}/{type}/numbers.
        #
        #   @param channel [String]
        #
        #   @param country [String] ISO 3166-1 alpha-2, uppercase.
        #
        #   @param numbers [Array<Sentdm::Models::Channels::MarketNumber>] Empty, never null, when the customer holds nothing there.
      end
    end
  end
end
