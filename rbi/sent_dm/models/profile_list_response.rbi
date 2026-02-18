# typed: strong

module SentDm
  module Models
    class ProfileListResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::Models::ProfileListResponse, SentDm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(SentDm::Models::ProfileListResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(SentDm::Models::ProfileListResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error details (null if successful)
      sig { returns(T.nilable(SentDm::APIError)) }
      attr_reader :error

      sig { params(error: T.nilable(SentDm::APIError::OrHash)).void }
      attr_writer :error

      # Metadata about the request and response
      sig { returns(T.nilable(SentDm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: SentDm::APIMeta::OrHash).void }
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(SentDm::Models::ProfileListResponse::Data::OrHash),
          error: T.nilable(SentDm::APIError::OrHash),
          meta: SentDm::APIMeta::OrHash,
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
            data: T.nilable(SentDm::Models::ProfileListResponse::Data),
            error: T.nilable(SentDm::APIError),
            meta: SentDm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SentDm::Models::ProfileListResponse::Data,
              SentDm::Internal::AnyHash
            )
          end

        # List of profiles in the organization
        sig { returns(T.nilable(T::Array[SentDm::ProfileDetail])) }
        attr_reader :profiles

        sig { params(profiles: T::Array[SentDm::ProfileDetail::OrHash]).void }
        attr_writer :profiles

        # The response data (null if error)
        sig do
          params(profiles: T::Array[SentDm::ProfileDetail::OrHash]).returns(
            T.attached_class
          )
        end
        def self.new(
          # List of profiles in the organization
          profiles: nil
        )
        end

        sig { override.returns({ profiles: T::Array[SentDm::ProfileDetail] }) }
        def to_hash
        end
      end
    end
  end
end
