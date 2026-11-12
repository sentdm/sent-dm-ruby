# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      module SMS
        # @see Sentdm::Resources::Channels::SMS::TenDlc#add_campaign
        class TenDlcAddCampaignParams < Sentdm::Internal::Type::BaseModel
          extend Sentdm::Internal::Type::RequestParameters::Converter
          include Sentdm::Internal::Type::RequestParameters

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

          # @!method initialize(compliance: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams} for more details.
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
end
