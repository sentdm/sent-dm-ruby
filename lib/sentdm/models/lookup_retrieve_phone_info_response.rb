# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Lookup#retrieve_phone_info
    class LookupRetrievePhoneInfoResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [Sentdm::Models::LookupRetrievePhoneInfoResponse::Data, nil]
      optional :data, -> { Sentdm::Models::LookupRetrievePhoneInfoResponse::Data }, nil?: true

      # @!attribute error
      #   Error details (null if successful)
      #
      #   @return [Sentdm::Models::APIError, nil]
      optional :error, -> { Sentdm::APIError }, nil?: true

      # @!attribute meta
      #   Metadata about the request and response
      #
      #   @return [Sentdm::Models::APIMeta, nil]
      optional :meta, -> { Sentdm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::LookupRetrievePhoneInfoResponse::Data, nil] The response data (null if error)
      #
      #   @param error [Sentdm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [Sentdm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::LookupRetrievePhoneInfoResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute carrier_name
        #
        #   @return [String, nil]
        optional :carrier_name, String, api_name: :carrierName, nil?: true

        # @!attribute is_ported
        #
        #   @return [Boolean, nil]
        optional :is_ported, Sentdm::Internal::Type::Boolean, api_name: :isPorted, nil?: true

        # @!attribute is_valid
        #
        #   @return [Boolean, nil]
        optional :is_valid, Sentdm::Internal::Type::Boolean, api_name: :isValid

        # @!attribute is_voip
        #
        #   @return [Boolean, nil]
        optional :is_voip, Sentdm::Internal::Type::Boolean, api_name: :isVoip, nil?: true

        # @!attribute line_type
        #
        #   @return [String, nil]
        optional :line_type, String, api_name: :lineType, nil?: true

        # @!attribute mobile_country_code
        #
        #   @return [String, nil]
        optional :mobile_country_code, String, api_name: :mobileCountryCode, nil?: true

        # @!attribute mobile_network_code
        #
        #   @return [String, nil]
        optional :mobile_network_code, String, api_name: :mobileNetworkCode, nil?: true

        # @!attribute phone_number
        #
        #   @return [String, nil]
        optional :phone_number, String, api_name: :phoneNumber

        # @!attribute provider
        #
        #   @return [String, nil]
        optional :provider, String

        # @!method initialize(carrier_name: nil, is_ported: nil, is_valid: nil, is_voip: nil, line_type: nil, mobile_country_code: nil, mobile_network_code: nil, phone_number: nil, provider: nil)
        #   The response data (null if error)
        #
        #   @param carrier_name [String, nil]
        #   @param is_ported [Boolean, nil]
        #   @param is_valid [Boolean]
        #   @param is_voip [Boolean, nil]
        #   @param line_type [String, nil]
        #   @param mobile_country_code [String, nil]
        #   @param mobile_network_code [String, nil]
        #   @param phone_number [String]
        #   @param provider [String]
      end
    end
  end
end
