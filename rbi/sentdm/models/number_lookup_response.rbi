# typed: strong

module Sentdm
  module Models
    class NumberLookupResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::NumberLookupResponse, Sentdm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(Sentdm::Models::NumberLookupResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::NumberLookupResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::APIError)) }
      attr_reader :error

      sig { params(error: T.nilable(Sentdm::APIError::OrHash)).void }
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: Sentdm::APIMeta::OrHash).void }
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(Sentdm::Models::NumberLookupResponse::Data::OrHash),
          error: T.nilable(Sentdm::APIError::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The response data (null if error)
        data: nil,
        # Error information
        error: nil,
        # Request and response metadata
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(Sentdm::Models::NumberLookupResponse::Data),
            error: T.nilable(Sentdm::APIError),
            meta: Sentdm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::NumberLookupResponse::Data,
              Sentdm::Internal::AnyHash
            )
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

        # The response data (null if error)
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
end
