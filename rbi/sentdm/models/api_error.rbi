# typed: strong

module Sentdm
  module Models
    class APIError < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::APIError, Sentdm::Internal::AnyHash) }

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
  end
end
