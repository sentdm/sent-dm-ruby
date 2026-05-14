# typed: strong

module Sentdm
  module Models
    class UserUpdateRoleResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::UserUpdateRoleResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # User response for v3 API
      sig { returns(T.nilable(Sentdm::Models::UserUpdateRoleResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::UserUpdateRoleResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::Models::UserUpdateRoleResponse::Error)) }
      attr_reader :error

      sig do
        params(
          error:
            T.nilable(Sentdm::Models::UserUpdateRoleResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::Models::UserUpdateRoleResponse::Meta)) }
      attr_reader :meta

      sig do
        params(meta: Sentdm::Models::UserUpdateRoleResponse::Meta::OrHash).void
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
          data: T.nilable(Sentdm::Models::UserUpdateRoleResponse::Data::OrHash),
          error:
            T.nilable(Sentdm::Models::UserUpdateRoleResponse::Error::OrHash),
          meta: Sentdm::Models::UserUpdateRoleResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # User response for v3 API
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
            data: T.nilable(Sentdm::Models::UserUpdateRoleResponse::Data),
            error: T.nilable(Sentdm::Models::UserUpdateRoleResponse::Error),
            meta: Sentdm::Models::UserUpdateRoleResponse::Meta,
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
              Sentdm::Models::UserUpdateRoleResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # User unique identifier
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # When the user was added to the organization
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        # User email address
        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        # When the user was invited
        sig { returns(T.nilable(Time)) }
        attr_accessor :invited_at

        # When the user last logged in
        sig { returns(T.nilable(Time)) }
        attr_accessor :last_login_at

        # User full name
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # User role in the organization: admin, billing, developer
        sig { returns(T.nilable(String)) }
        attr_reader :role

        sig { params(role: String).void }
        attr_writer :role

        # User status: active, invited, suspended, rejected
        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        # When the user record was last updated
        sig { returns(T.nilable(Time)) }
        attr_accessor :updated_at

        # User response for v3 API
        sig do
          params(
            id: String,
            created_at: Time,
            email: String,
            invited_at: T.nilable(Time),
            last_login_at: T.nilable(Time),
            name: String,
            role: String,
            status: String,
            updated_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # User unique identifier
          id: nil,
          # When the user was added to the organization
          created_at: nil,
          # User email address
          email: nil,
          # When the user was invited
          invited_at: nil,
          # When the user last logged in
          last_login_at: nil,
          # User full name
          name: nil,
          # User role in the organization: admin, billing, developer
          role: nil,
          # User status: active, invited, suspended, rejected
          status: nil,
          # When the user record was last updated
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              email: String,
              invited_at: T.nilable(Time),
              last_login_at: T.nilable(Time),
              name: String,
              role: String,
              status: String,
              updated_at: T.nilable(Time)
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
              Sentdm::Models::UserUpdateRoleResponse::Error,
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
              Sentdm::Models::UserUpdateRoleResponse::Meta,
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
