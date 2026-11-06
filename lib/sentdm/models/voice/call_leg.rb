# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class CallLeg < Sentdm::Internal::Type::BaseModel
        # @!attribute billed_minutes
        #   The whole minutes the leg was billed for
        #
        #   @return [Integer, nil]
        optional :billed_minutes, Integer

        # @!attribute cost
        #   What the leg cost, in the same unit as the call's price
        #
        #   @return [Float, nil]
        optional :cost, Float

        # @!attribute currency
        #   The currency of the cost: USD
        #
        #   @return [String, nil]
        optional :currency, String

        # @!attribute direction
        #   inbound for the caller's leg to your number, outbound for a leg placed on your
        #   behalf
        #
        #   @return [String, nil]
        optional :direction, String

        # @!attribute number
        #   The phone number the leg reached, in E.164 format: your number for the inbound
        #   leg, the number dialed for an outbound one. Null for a leg to one of your app
        #   users or a room
        #
        #   @return [String, nil]
        optional :number, String, nil?: true

        # @!method initialize(billed_minutes: nil, cost: nil, currency: nil, direction: nil, number: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::CallLeg} for more details.
        #
        #   One leg of a call the price covers
        #
        #   @param billed_minutes [Integer] The whole minutes the leg was billed for
        #
        #   @param cost [Float] What the leg cost, in the same unit as the call's price
        #
        #   @param currency [String] The currency of the cost: USD
        #
        #   @param direction [String] inbound for the caller's leg to your number, outbound for a leg placed on your b
        #
        #   @param number [String, nil] The phone number the leg reached, in E.164 format: your number for the inbound l
      end
    end
  end
end
