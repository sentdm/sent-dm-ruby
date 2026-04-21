# frozen_string_literal: true

module Sentdm
  module Models
    class ContactResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the contact
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute available_channels
      #   Comma-separated list of available messaging channels (e.g., "sms,whatsapp")
      #
      #   @return [String, nil]
      optional :available_channels, String

      # @!attribute channel_consent
      #   Consent status by channel. Keys: "sms", "whatsapp". Values: "opted_in",
      #   "opted_out". All channels will have the same status because consent is global
      #   across channels. A STOP on any channel opts out of all channels; a START opts in
      #   to all.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :channel_consent, Sentdm::Internal::Type::HashOf[String], nil?: true

      # @!attribute country_code
      #   Country calling code (e.g., 1 for US/Canada)
      #
      #   @return [String, nil]
      optional :country_code, String

      # @!attribute created_at
      #   When the contact was created
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute default_channel
      #   Default messaging channel to use (e.g., "sms" or "whatsapp")
      #
      #   @return [String, nil]
      optional :default_channel, String

      # @!attribute format_e164
      #   Phone number in E.164 format (e.g., +1234567890)
      #
      #   @return [String, nil]
      optional :format_e164, String

      # @!attribute format_international
      #   Phone number in international format (e.g., +1 234-567-890)
      #
      #   @return [String, nil]
      optional :format_international, String

      # @!attribute format_national
      #   Phone number in national format (e.g., (234) 567-890)
      #
      #   @return [String, nil]
      optional :format_national, String

      # @!attribute format_rfc
      #   Phone number in RFC 3966 format (e.g., tel:+1-234-567-890)
      #
      #   @return [String, nil]
      optional :format_rfc, String

      # @!attribute is_inherited
      #   Whether this is an inherited contact (read-only)
      #
      #   @return [Boolean, nil]
      optional :is_inherited, Sentdm::Internal::Type::Boolean

      # @!attribute opt_out
      #   Whether the contact has opted out of messaging
      #
      #   @return [Boolean, nil]
      optional :opt_out, Sentdm::Internal::Type::Boolean

      # @!attribute phone_number
      #   Phone number in original format
      #
      #   @return [String, nil]
      optional :phone_number, String

      # @!attribute region_code
      #   ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
      #
      #   @return [String, nil]
      optional :region_code, String

      # @!attribute updated_at
      #   When the contact was last updated
      #
      #   @return [Time, nil]
      optional :updated_at, Time, nil?: true

      # @!method initialize(id: nil, available_channels: nil, channel_consent: nil, country_code: nil, created_at: nil, default_channel: nil, format_e164: nil, format_international: nil, format_national: nil, format_rfc: nil, is_inherited: nil, opt_out: nil, phone_number: nil, region_code: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ContactResponse} for more details.
      #
      #   Contact response for v3 API Uses snake_case for JSON property names
      #
      #   @param id [String] Unique identifier for the contact
      #
      #   @param available_channels [String] Comma-separated list of available messaging channels (e.g., "sms,whatsapp")
      #
      #   @param channel_consent [Hash{Symbol=>String}, nil] Consent status by channel. Keys: "sms", "whatsapp". Values: "opted_in", "opted_o
      #
      #   @param country_code [String] Country calling code (e.g., 1 for US/Canada)
      #
      #   @param created_at [Time] When the contact was created
      #
      #   @param default_channel [String] Default messaging channel to use (e.g., "sms" or "whatsapp")
      #
      #   @param format_e164 [String] Phone number in E.164 format (e.g., +1234567890)
      #
      #   @param format_international [String] Phone number in international format (e.g., +1 234-567-890)
      #
      #   @param format_national [String] Phone number in national format (e.g., (234) 567-890)
      #
      #   @param format_rfc [String] Phone number in RFC 3966 format (e.g., tel:+1-234-567-890)
      #
      #   @param is_inherited [Boolean] Whether this is an inherited contact (read-only)
      #
      #   @param opt_out [Boolean] Whether the contact has opted out of messaging
      #
      #   @param phone_number [String] Phone number in original format
      #
      #   @param region_code [String] ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
      #
      #   @param updated_at [Time, nil] When the contact was last updated
    end
  end
end
