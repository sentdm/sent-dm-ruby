# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::SMS#update
      class SMSUpdateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute country
        #
        #   @return [String]
        required :country, String

        # @!attribute type
        #
        #   @return [String]
        required :type, String

        # @!attribute compliance
        #   The compliance values a market registers with. `brand` and `campaign` apply to
        #   US `TEN_DLC`; other markets fill this map with the document keys their own
        #   requirements name.
        #
        #   @return [Sentdm::Models::Channels::MarketCompliance, nil]
        optional :compliance, -> { Sentdm::Channels::MarketCompliance }

        # @!attribute sandbox
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

        # @!method initialize(country:, type:, compliance: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::SMSUpdateParams} for more details.
        #
        #   @param country [String]
        #
        #   @param type [String]
        #
        #   @param compliance [Sentdm::Models::Channels::MarketCompliance] The compliance values a market registers with. `brand` and `campaign` apply to U
        #
        #   @param sandbox [Boolean]
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
