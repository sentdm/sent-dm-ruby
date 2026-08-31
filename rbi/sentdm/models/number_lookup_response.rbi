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
      sig { returns(T.nilable(Sentdm::Models::NumberLookupResponse::Error)) }
      attr_reader :error

      sig do
        params(
          error: T.nilable(Sentdm::Models::NumberLookupResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::Models::NumberLookupResponse::Meta)) }
      attr_reader :meta

      sig do
        params(meta: Sentdm::Models::NumberLookupResponse::Meta::OrHash).void
      end
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
          error: T.nilable(Sentdm::Models::NumberLookupResponse::Error::OrHash),
          meta: Sentdm::Models::NumberLookupResponse::Meta::OrHash,
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
            error: T.nilable(Sentdm::Models::NumberLookupResponse::Error),
            meta: Sentdm::Models::NumberLookupResponse::Meta,
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

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::NumberLookupResponse::Error,
              Sentdm::Internal::AnyHash
            )
          end

        # Machine-readable error code (e.g., "RESOURCE_001")
        sig { returns(T.nilable(String)) }
        attr_reader :code

        sig { params(code: String).void }
        attr_writer :code

        # Additional validation error details (field-level errors)
        sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
        attr_accessor :details

        # URL to documentation about this error
        sig { returns(T.nilable(String)) }
        attr_accessor :doc_url

        # Human-readable error message
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Error information
        sig do
          params(
            code: String,
            details: T.nilable(T::Hash[Symbol, T::Array[String]]),
            doc_url: T.nilable(String),
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Machine-readable error code (e.g., "RESOURCE_001")
          code: nil,
          # Additional validation error details (field-level errors)
          details: nil,
          # URL to documentation about this error
          doc_url: nil,
          # Human-readable error message
          message: nil
        )
        end

        sig do
          override.returns(
            {
              code: String,
              details: T.nilable(T::Hash[Symbol, T::Array[String]]),
              doc_url: T.nilable(String),
              message: String
            }
          )
        end
        def to_hash
        end
      end

      class Meta < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::NumberLookupResponse::Meta,
              Sentdm::Internal::AnyHash
            )
          end

        # Unique identifier for this request (for tracing and support)
        sig { returns(T.nilable(String)) }
        attr_reader :request_id

        sig { params(request_id: String).void }
        attr_writer :request_id

        # Server timestamp when the response was generated
        sig { returns(T.nilable(Time)) }
        attr_reader :timestamp

        sig { params(timestamp: Time).void }
        attr_writer :timestamp

        # API version used for this request
        sig { returns(T.nilable(String)) }
        attr_reader :version

        sig { params(version: String).void }
        attr_writer :version

        # Request and response metadata
        sig do
          params(request_id: String, timestamp: Time, version: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Unique identifier for this request (for tracing and support)
          request_id: nil,
          # Server timestamp when the response was generated
          timestamp: nil,
          # API version used for this request
          version: nil
        )
        end

        sig do
          override.returns(
            { request_id: String, timestamp: Time, version: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
