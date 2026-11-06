# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class SMSNumberRequest < Sentdm::Internal::Type::BaseModel
        # @!attribute area_code
        #   The area code, e.g. 212, validated against the request's country. Omit it for
        #   numbers in any area code.
        #
        #   @return [String, nil]
        optional :area_code, String, nil?: true

        # @!attribute quantity
        #   How many numbers. At least 1; omitted means 1.
        #
        #   @return [Integer, nil]
        optional :quantity, Integer, nil?: true

        # @!method initialize(area_code: nil, quantity: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::SMSNumberRequest} for more details.
        #
        #   One entry of numbers: how many numbers to assign in one area code, or in any
        #   area code when AreaCode is omitted.
        #
        #   @param area_code [String, nil] The area code, e.g. 212, validated against the request's country. Omit it for nu
        #
        #   @param quantity [Integer, nil] How many numbers. At least 1; omitted means 1.
      end
    end
  end
end
