# typed: strong

module Sentdm
  module Models
    class UserListResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::UserListResponse, Sentdm::Internal::AnyHash)
        end

      # List of users response
      sig { returns(T.nilable(Sentdm::Models::UserListResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::UserListResponse::Data::OrHash)
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
          data: T.nilable(Sentdm::Models::UserListResponse::Data::OrHash),
          error: T.nilable(Sentdm::APIError::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # List of users response
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
            data: T.nilable(Sentdm::Models::UserListResponse::Data),
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
              Sentdm::Models::UserListResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # List of users in the organization
        sig { returns(T.nilable(T::Array[Sentdm::UserResponse])) }
        attr_reader :users

        sig { params(users: T::Array[Sentdm::UserResponse::OrHash]).void }
        attr_writer :users

        # List of users response
        sig do
          params(users: T::Array[Sentdm::UserResponse::OrHash]).returns(
            T.attached_class
          )
        end
        def self.new(
          # List of users in the organization
          users: nil
        )
        end

        sig { override.returns({ users: T::Array[Sentdm::UserResponse] }) }
        def to_hash
        end
      end
    end
  end
end
