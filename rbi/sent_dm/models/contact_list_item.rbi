# typed: strong

module SentDm
  module Models
    class ContactListItem < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::ContactListItem, SentDm::Internal::AnyHash)
        end

      # The unique identifier of the contact
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Comma-separated list of available messaging channels for this contact (e.g.,
      # "sms,whatsapp")
      sig { returns(T.nilable(String)) }
      attr_reader :available_channels

      sig { params(available_channels: String).void }
      attr_writer :available_channels

      # The country calling code (e.g., 1 for US/Canada)
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      # The default messaging channel to use for this contact (e.g., "sms" or
      # "whatsapp")
      sig { returns(T.nilable(String)) }
      attr_reader :default_channel

      sig { params(default_channel: String).void }
      attr_writer :default_channel

      # The phone number formatted in E.164 standard (e.g., +1234567890)
      sig { returns(T.nilable(String)) }
      attr_reader :format_e164

      sig { params(format_e164: String).void }
      attr_writer :format_e164

      # The phone number formatted for international dialing (e.g., +1 234-567-890)
      sig { returns(T.nilable(String)) }
      attr_reader :format_international

      sig { params(format_international: String).void }
      attr_writer :format_international

      # The phone number formatted for national dialing (e.g., (234) 567-890)
      sig { returns(T.nilable(String)) }
      attr_reader :format_national

      sig { params(format_national: String).void }
      attr_writer :format_national

      # The phone number formatted according to RFC 3966 (e.g., tel:+1-234-567-890)
      sig { returns(T.nilable(String)) }
      attr_reader :format_rfc

      sig { params(format_rfc: String).void }
      attr_writer :format_rfc

      # The phone number in its original format
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number

      sig { params(phone_number: String).void }
      attr_writer :phone_number

      # The ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
      sig { returns(T.nilable(String)) }
      attr_reader :region_code

      sig { params(region_code: String).void }
      attr_writer :region_code

      # Represents a contact in the customer's contact list
      sig do
        params(
          id: String,
          available_channels: String,
          country_code: String,
          default_channel: String,
          format_e164: String,
          format_international: String,
          format_national: String,
          format_rfc: String,
          phone_number: String,
          region_code: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The unique identifier of the contact
        id: nil,
        # Comma-separated list of available messaging channels for this contact (e.g.,
        # "sms,whatsapp")
        available_channels: nil,
        # The country calling code (e.g., 1 for US/Canada)
        country_code: nil,
        # The default messaging channel to use for this contact (e.g., "sms" or
        # "whatsapp")
        default_channel: nil,
        # The phone number formatted in E.164 standard (e.g., +1234567890)
        format_e164: nil,
        # The phone number formatted for international dialing (e.g., +1 234-567-890)
        format_international: nil,
        # The phone number formatted for national dialing (e.g., (234) 567-890)
        format_national: nil,
        # The phone number formatted according to RFC 3966 (e.g., tel:+1-234-567-890)
        format_rfc: nil,
        # The phone number in its original format
        phone_number: nil,
        # The ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
        region_code: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            available_channels: String,
            country_code: String,
            default_channel: String,
            format_e164: String,
            format_international: String,
            format_national: String,
            format_rfc: String,
            phone_number: String,
            region_code: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
