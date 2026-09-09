# typed: strong

module Sentdm
  module Models
    class ProfileCompleteResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::ProfileCompleteResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # Response when a profile is already in the completed state and no further action
      # is taken.
      sig { returns(T.nilable(Sentdm::Models::ProfileCompleteResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::ProfileCompleteResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::ErrorDetail)) }
      attr_reader :error

      sig { params(error: T.nilable(Sentdm::ErrorDetail::OrHash)).void }
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
          data:
            T.nilable(Sentdm::Models::ProfileCompleteResponse::Data::OrHash),
          error: T.nilable(Sentdm::ErrorDetail::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Response when a profile is already in the completed state and no further action
        # is taken.
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
            data: T.nilable(Sentdm::Models::ProfileCompleteResponse::Data),
            error: T.nilable(Sentdm::ErrorDetail),
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
              Sentdm::Models::ProfileCompleteResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # Human-readable message describing the result.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Current process status of the profile (e.g., "completed", "submitted",
        # "in_progress").
        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        # Response when a profile is already in the completed state and no further action
        # is taken.
        sig do
          params(message: String, status: String).returns(T.attached_class)
        end
        def self.new(
          # Human-readable message describing the result.
          message: nil,
          # Current process status of the profile (e.g., "completed", "submitted",
          # "in_progress").
          status: nil
        )
        end

        sig { override.returns({ message: String, status: String }) }
        def to_hash
        end
      end
    end
  end
end
