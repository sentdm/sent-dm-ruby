# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class SMSNumber < Sentdm::Internal::Type::BaseModel
        # @!attribute area_code
        #   The number's area code, e.g. 212. While the number is still to be assigned, the
        #   area code it was asked for, or null when it was asked for in any area code.
        #
        #   @return [String, nil]
        optional :area_code, String, nil?: true

        # @!attribute campaign_id
        #   The campaign the number is on, or is owed for: the id of its entry in
        #   compliance.campaigns. Omitted for a market that registers no campaigns, and
        #   where the campaign is not known — a number recorded without one, or one owed on
        #   a campaign inherited from the organization.
        #
        #   @return [String, nil]
        optional :campaign_id, String, nil?: true

        # @!attribute sender_value
        #   The number, or null while it is still to be assigned.
        #
        #   @return [String, nil]
        optional :sender_value, String, nil?: true

        # @!attribute status
        #   ACTIVE once the number can send; PROVISIONING while it is still to be assigned;
        #   INACTIVE once it could send and no longer can.
        #
        #   @return [String, nil]
        optional :status, String, nil?: true

        # @!method initialize(area_code: nil, campaign_id: nil, sender_value: nil, status: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::SMSNumber} for more details.
        #
        #   One number of an SMS market.
        #
        #   @param area_code [String, nil] The number's area code, e.g. 212. While the number is still to be assigned, the
        #
        #   @param campaign_id [String, nil] The campaign the number is on, or is owed for: the id of its entry in compliance
        #
        #   @param sender_value [String, nil] The number, or null while it is still to be assigned.
        #
        #   @param status [String, nil] ACTIVE once the number can send; PROVISIONING while it is still to be assigned;
      end
    end
  end
end
