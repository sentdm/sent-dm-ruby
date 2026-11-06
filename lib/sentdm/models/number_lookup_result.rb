# frozen_string_literal: true

module Sentdm
  module Models
    class NumberLookupResult < Sentdm::Internal::Type::BaseModel
      # @!attribute carrier_name
      #
      #   @return [String, nil]
      optional :carrier_name, String, nil?: true

      # @!attribute country_code
      #
      #   @return [String, nil]
      optional :country_code, String, nil?: true

      # @!attribute is_ported
      #
      #   @return [Boolean, nil]
      optional :is_ported, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute is_valid
      #
      #   @return [Boolean, nil]
      optional :is_valid, Sentdm::Internal::Type::Boolean

      # @!attribute is_voip
      #
      #   @return [Boolean, nil]
      optional :is_voip, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute line_type
      #
      #   @return [String, nil]
      optional :line_type, String, nil?: true

      # @!attribute mobile_country_code
      #
      #   @return [String, nil]
      optional :mobile_country_code, String, nil?: true

      # @!attribute mobile_network_code
      #
      #   @return [String, nil]
      optional :mobile_network_code, String, nil?: true

      # @!attribute phone_number
      #
      #   @return [String, nil]
      optional :phone_number, String

      # @!method initialize(carrier_name: nil, country_code: nil, is_ported: nil, is_valid: nil, is_voip: nil, line_type: nil, mobile_country_code: nil, mobile_network_code: nil, phone_number: nil)
      #   @param carrier_name [String, nil]
      #   @param country_code [String, nil]
      #   @param is_ported [Boolean, nil]
      #   @param is_valid [Boolean]
      #   @param is_voip [Boolean, nil]
      #   @param line_type [String, nil]
      #   @param mobile_country_code [String, nil]
      #   @param mobile_network_code [String, nil]
      #   @param phone_number [String]
    end
  end
end
