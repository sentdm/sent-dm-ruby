# typed: strong

module Sentdm
  module Models
    class BrandListResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::BrandListResponse, Sentdm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(T::Array[Sentdm::BrandWithKYC])) }
      attr_accessor :data

      # Error details (null if successful)
      sig { returns(T.nilable(Sentdm::APIError)) }
      attr_reader :error

      sig { params(error: T.nilable(Sentdm::APIError::OrHash)).void }
      attr_writer :error

      # Metadata about the request and response
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
          data: T.nilable(T::Array[Sentdm::BrandWithKYC::OrHash]),
          error: T.nilable(Sentdm::APIError::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The response data (null if error)
        data: nil,
        # Error details (null if successful)
        error: nil,
        # Metadata about the request and response
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(T::Array[Sentdm::BrandWithKYC]),
            error: T.nilable(Sentdm::APIError),
            meta: Sentdm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
