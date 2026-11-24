# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class MarketNumber < Sentdm::Internal::Type::BaseModel
        # @!attribute area_code
        #
        #   @return [String, nil]
        optional :area_code, String, nil?: true

        # @!attribute campaign_id
        #   The campaign the number belongs to (US TEN_DLC); null otherwise.
        #
        #   @return [String, nil]
        optional :campaign_id, String, nil?: true

        # @!attribute sender_value
        #   The number, or the sender id; null until it is assigned.
        #
        #   @return [String, nil]
        optional :sender_value, String, nil?: true

        # @!attribute status
        #   ACTIVE, PROVISIONING or INACTIVE.
        #
        #   @return [String, nil]
        optional :status, String, nil?: true

        # @!attribute type
        #   The market's sender type, e.g. TEN_DLC, LOCAL.
        #
        #   @return [String, nil]
        optional :type, String

        # @!method initialize(area_code: nil, campaign_id: nil, sender_value: nil, status: nil, type: nil)
        #   One number the customer holds, or is still owed.
        #
        #   @param area_code [String, nil]
        #
        #   @param campaign_id [String, nil] The campaign the number belongs to (US TEN_DLC); null otherwise.
        #
        #   @param sender_value [String, nil] The number, or the sender id; null until it is assigned.
        #
        #   @param status [String, nil] ACTIVE, PROVISIONING or INACTIVE.
        #
        #   @param type [String] The market's sender type, e.g. TEN_DLC, LOCAL.
      end
    end
  end
end
