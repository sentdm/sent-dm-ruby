# typed: strong

module SentDm
  module Models
    class Contact < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(SentDm::Contact, SentDm::Internal::AnyHash) }

      # Unique identifier for the contact
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Comma-separated list of available messaging channels (e.g., "sms,whatsapp")
      sig { returns(T.nilable(String)) }
      attr_reader :available_channels

      sig { params(available_channels: String).void }
      attr_writer :available_channels

      # Country calling code (e.g., 1 for US/Canada)
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      # When the contact was created
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Default messaging channel to use (e.g., "sms" or "whatsapp")
      sig { returns(T.nilable(String)) }
      attr_reader :default_channel

      sig { params(default_channel: String).void }
      attr_writer :default_channel

      # Phone number in E.164 format (e.g., +1234567890)
      sig { returns(T.nilable(String)) }
      attr_reader :format_e164

      sig { params(format_e164: String).void }
      attr_writer :format_e164

      # Phone number in international format (e.g., +1 234-567-890)
      sig { returns(T.nilable(String)) }
      attr_reader :format_international

      sig { params(format_international: String).void }
      attr_writer :format_international

      # Phone number in national format (e.g., (234) 567-890)
      sig { returns(T.nilable(String)) }
      attr_reader :format_national

      sig { params(format_national: String).void }
      attr_writer :format_national

      # Phone number in RFC 3966 format (e.g., tel:+1-234-567-890)
      sig { returns(T.nilable(String)) }
      attr_reader :format_rfc

      sig { params(format_rfc: String).void }
      attr_writer :format_rfc

      # Whether this is an inherited contact (read-only)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_inherited

      sig { params(is_inherited: T::Boolean).void }
      attr_writer :is_inherited

      # Whether the contact has opted out of messaging
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :opt_out

      sig { params(opt_out: T::Boolean).void }
      attr_writer :opt_out

      # Phone number in original format
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number

      sig { params(phone_number: String).void }
      attr_writer :phone_number

      # ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
      sig { returns(T.nilable(String)) }
      attr_reader :region_code

      sig { params(region_code: String).void }
      attr_writer :region_code

      # When the contact was last updated
      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      # Contact response for v3 API Uses snake_case for JSON property names
      sig do
        params(
          id: String,
          available_channels: String,
          country_code: String,
          created_at: Time,
          default_channel: String,
          format_e164: String,
          format_international: String,
          format_national: String,
          format_rfc: String,
          is_inherited: T::Boolean,
          opt_out: T::Boolean,
          phone_number: String,
          region_code: String,
          updated_at: T.nilable(Time)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the contact
        id: nil,
        # Comma-separated list of available messaging channels (e.g., "sms,whatsapp")
        available_channels: nil,
        # Country calling code (e.g., 1 for US/Canada)
        country_code: nil,
        # When the contact was created
        created_at: nil,
        # Default messaging channel to use (e.g., "sms" or "whatsapp")
        default_channel: nil,
        # Phone number in E.164 format (e.g., +1234567890)
        format_e164: nil,
        # Phone number in international format (e.g., +1 234-567-890)
        format_international: nil,
        # Phone number in national format (e.g., (234) 567-890)
        format_national: nil,
        # Phone number in RFC 3966 format (e.g., tel:+1-234-567-890)
        format_rfc: nil,
        # Whether this is an inherited contact (read-only)
        is_inherited: nil,
        # Whether the contact has opted out of messaging
        opt_out: nil,
        # Phone number in original format
        phone_number: nil,
        # ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
        region_code: nil,
        # When the contact was last updated
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            available_channels: String,
            country_code: String,
            created_at: Time,
            default_channel: String,
            format_e164: String,
            format_international: String,
            format_national: String,
            format_rfc: String,
            is_inherited: T::Boolean,
            opt_out: T::Boolean,
            phone_number: String,
            region_code: String,
            updated_at: T.nilable(Time)
          }
        )
      end
      def to_hash
      end
    end
  end
end
