# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::NumberLookup#retrieve
    class NumberLookupRetrieveResponse < SentDm::Internal::Type::BaseModel
      # @!attribute country_code
      #   The country calling code (e.g., 1 for US/Canada)
      #
      #   @return [String, nil]
      optional :country_code, String, api_name: :countryCode

      # @!attribute format_e164
      #   The phone number formatted in E.164 standard (e.g., +1234567890)
      #
      #   @return [String, nil]
      optional :format_e164, String, api_name: :formatE164

      # @!attribute format_international
      #   The phone number formatted for international dialing (e.g., +1 234-567-890)
      #
      #   @return [String, nil]
      optional :format_international, String, api_name: :formatInternational

      # @!attribute format_national
      #   The phone number formatted for national dialing (e.g., (234) 567-890)
      #
      #   @return [String, nil]
      optional :format_national, String, api_name: :formatNational

      # @!attribute format_rfc
      #   The phone number formatted according to RFC 3966 (e.g., tel:+1-234-567-890)
      #
      #   @return [String, nil]
      optional :format_rfc, String, api_name: :formatRfc

      # @!attribute number_type
      #   The type of phone number (e.g., mobile, fixed_line, voip)
      #
      #   @return [String, nil]
      optional :number_type, String, api_name: :numberType

      # @!attribute phone_number
      #   The phone number in its original format
      #
      #   @return [String, nil]
      optional :phone_number, String, api_name: :phoneNumber

      # @!attribute phone_timezones
      #   The timezones associated with the phone number
      #
      #   @return [String, nil]
      optional :phone_timezones, String, api_name: :phoneTimezones

      # @!attribute region_code
      #   The ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
      #
      #   @return [String, nil]
      optional :region_code, String, api_name: :regionCode

      # @!method initialize(country_code: nil, format_e164: nil, format_international: nil, format_national: nil, format_rfc: nil, number_type: nil, phone_number: nil, phone_timezones: nil, region_code: nil)
      #   Response containing phone number lookup data
      #
      #   @param country_code [String] The country calling code (e.g., 1 for US/Canada)
      #
      #   @param format_e164 [String] The phone number formatted in E.164 standard (e.g., +1234567890)
      #
      #   @param format_international [String] The phone number formatted for international dialing (e.g., +1 234-567-890)
      #
      #   @param format_national [String] The phone number formatted for national dialing (e.g., (234) 567-890)
      #
      #   @param format_rfc [String] The phone number formatted according to RFC 3966 (e.g., tel:+1-234-567-890)
      #
      #   @param number_type [String] The type of phone number (e.g., mobile, fixed_line, voip)
      #
      #   @param phone_number [String] The phone number in its original format
      #
      #   @param phone_timezones [String] The timezones associated with the phone number
      #
      #   @param region_code [String] The ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
    end
  end
end
