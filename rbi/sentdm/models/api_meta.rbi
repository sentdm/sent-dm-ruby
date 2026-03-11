# typed: strong

module Sentdm
  module Models
    class APIMeta < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::APIMeta, Sentdm::Internal::AnyHash) }

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
