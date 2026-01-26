# typed: strong

module SentDm
  module Models
    class NumberLookupRetrieveResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SentDm::Models::NumberLookupRetrieveResponse,
            SentDm::Internal::AnyHash
          )
        end

      # The country calling code (e.g., 1 for US/Canada)
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

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

      # The type of phone number (e.g., mobile, fixed_line, voip)
      sig { returns(T.nilable(String)) }
      attr_reader :number_type

      sig { params(number_type: String).void }
      attr_writer :number_type

      # The phone number in its original format
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number

      sig { params(phone_number: String).void }
      attr_writer :phone_number

      # The timezones associated with the phone number
      sig { returns(T.nilable(String)) }
      attr_reader :phone_timezones

      sig { params(phone_timezones: String).void }
      attr_writer :phone_timezones

      # The ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
      sig { returns(T.nilable(String)) }
      attr_reader :region_code

      sig { params(region_code: String).void }
      attr_writer :region_code

      # Response containing phone number lookup data
      sig do
        params(
          country_code: String,
          format_e164: String,
          format_international: String,
          format_national: String,
          format_rfc: String,
          number_type: String,
          phone_number: String,
          phone_timezones: String,
          region_code: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The country calling code (e.g., 1 for US/Canada)
        country_code: nil,
        # The phone number formatted in E.164 standard (e.g., +1234567890)
        format_e164: nil,
        # The phone number formatted for international dialing (e.g., +1 234-567-890)
        format_international: nil,
        # The phone number formatted for national dialing (e.g., (234) 567-890)
        format_national: nil,
        # The phone number formatted according to RFC 3966 (e.g., tel:+1-234-567-890)
        format_rfc: nil,
        # The type of phone number (e.g., mobile, fixed_line, voip)
        number_type: nil,
        # The phone number in its original format
        phone_number: nil,
        # The timezones associated with the phone number
        phone_timezones: nil,
        # The ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
        region_code: nil
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
            format_e164: String,
            format_international: String,
            format_national: String,
            format_rfc: String,
            number_type: String,
            phone_number: String,
            phone_timezones: String,
            region_code: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
