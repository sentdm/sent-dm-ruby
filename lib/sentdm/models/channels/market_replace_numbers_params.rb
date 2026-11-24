# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::Markets#replace_numbers
      class MarketReplaceNumbersParams < Sentdm::Internal::Type::BaseModel
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

        # @!attribute numbers
        #   The numbers, one entry per area code, e.g. [{"area_code": "415", "quantity": 2},
        #   {"quantity": 1}]. quantity defaults to 1, and an entry without area_code means
        #   any area code. Required.
        #
        #   POST adds them to what the market or campaign already asks for; PATCH replaces
        #   that list with them, and has to cover every number already held, since none is
        #   ever released.
        #
        #   @return [Array<Sentdm::Models::Channels::SMSNumberRequest, nil>]
        required :numbers, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Channels::SMSNumberRequest, nil?: true] }

        # @!attribute campaign_id
        #   The campaign to add the numbers to, as campaigns[].id reports it. Required on
        #   SMS US TEN_DLC, where every number belongs to a campaign; refused on a market
        #   without campaigns.
        #
        #   @return [String, nil]
        optional :campaign_id, String, nil?: true

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(channel:, country:, type:, numbers:, campaign_id: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::MarketReplaceNumbersParams} for more details.
        #
        #   @param channel [String]
        #
        #   @param country [String]
        #
        #   @param type [String]
        #
        #   @param numbers [Array<Sentdm::Models::Channels::SMSNumberRequest, nil>] The numbers, one entry per area code, e.g. [{"area_code": "415", "quantity": 2},
        #
        #   @param campaign_id [String, nil] The campaign to add the numbers to, as campaigns[].id reports it. Required on SM
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
        #
        #   @param idempotency_key [String]
        #
        #   @param x_profile_id [String]
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
