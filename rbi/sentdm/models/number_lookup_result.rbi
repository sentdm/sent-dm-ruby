# typed: strong

module Sentdm
  module Models
    class NumberLookupResult < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::NumberLookupResult, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :carrier_name

      sig { returns(T.nilable(String)) }
      attr_accessor :country_code

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_ported

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_valid

      sig { params(is_valid: T::Boolean).void }
      attr_writer :is_valid

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_voip

      sig { returns(T.nilable(String)) }
      attr_accessor :line_type

      sig { returns(T.nilable(String)) }
      attr_accessor :mobile_country_code

      sig { returns(T.nilable(String)) }
      attr_accessor :mobile_network_code

      sig { returns(T.nilable(String)) }
      attr_reader :phone_number

      sig { params(phone_number: String).void }
      attr_writer :phone_number

      sig do
        params(
          carrier_name: T.nilable(String),
          country_code: T.nilable(String),
          is_ported: T.nilable(T::Boolean),
          is_valid: T::Boolean,
          is_voip: T.nilable(T::Boolean),
          line_type: T.nilable(String),
          mobile_country_code: T.nilable(String),
          mobile_network_code: T.nilable(String),
          phone_number: String
        ).returns(T.attached_class)
      end
      def self.new(
        carrier_name: nil,
        country_code: nil,
        is_ported: nil,
        is_valid: nil,
        is_voip: nil,
        line_type: nil,
        mobile_country_code: nil,
        mobile_network_code: nil,
        phone_number: nil
      )
      end

      sig do
        override.returns(
          {
            carrier_name: T.nilable(String),
            country_code: T.nilable(String),
            is_ported: T.nilable(T::Boolean),
            is_valid: T::Boolean,
            is_voip: T.nilable(T::Boolean),
            line_type: T.nilable(String),
            mobile_country_code: T.nilable(String),
            mobile_network_code: T.nilable(String),
            phone_number: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
