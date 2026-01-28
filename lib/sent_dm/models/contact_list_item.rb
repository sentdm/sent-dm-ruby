# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Contacts#retrieve_by_phone
    class ContactListItem < SentDm::Internal::Type::BaseModel
      # @!attribute id
      #   The unique identifier of the contact
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute available_channels
      #   Comma-separated list of available messaging channels for this contact (e.g.,
      #   "sms,whatsapp")
      #
      #   @return [String, nil]
      optional :available_channels, String, api_name: :availableChannels

      # @!attribute country_code
      #   The country calling code (e.g., 1 for US/Canada)
      #
      #   @return [String, nil]
      optional :country_code, String, api_name: :countryCode

      # @!attribute default_channel
      #   The default messaging channel to use for this contact (e.g., "sms" or
      #   "whatsapp")
      #
      #   @return [String, nil]
      optional :default_channel, String, api_name: :defaultChannel

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

      # @!attribute phone_number
      #   The phone number in its original format
      #
      #   @return [String, nil]
      optional :phone_number, String, api_name: :phoneNumber

      # @!attribute region_code
      #   The ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
      #
      #   @return [String, nil]
      optional :region_code, String, api_name: :regionCode

      # @!method initialize(id: nil, available_channels: nil, country_code: nil, default_channel: nil, format_e164: nil, format_international: nil, format_national: nil, format_rfc: nil, phone_number: nil, region_code: nil)
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::ContactListItem} for more details.
      #
      #   Represents a contact in the customer's contact list
      #
      #   @param id [String] The unique identifier of the contact
      #
      #   @param available_channels [String] Comma-separated list of available messaging channels for this contact (e.g., "sm
      #
      #   @param country_code [String] The country calling code (e.g., 1 for US/Canada)
      #
      #   @param default_channel [String] The default messaging channel to use for this contact (e.g., "sms" or "whatsapp"
      #
      #   @param format_e164 [String] The phone number formatted in E.164 standard (e.g., +1234567890)
      #
      #   @param format_international [String] The phone number formatted for international dialing (e.g., +1 234-567-890)
      #
      #   @param format_national [String] The phone number formatted for national dialing (e.g., (234) 567-890)
      #
      #   @param format_rfc [String] The phone number formatted according to RFC 3966 (e.g., tel:+1-234-567-890)
      #
      #   @param phone_number [String] The phone number in its original format
      #
      #   @param region_code [String] The ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
    end
  end
end
