# typed: strong

module Sentdm
  module Models
    class UserInviteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::UserInviteParams, Sentdm::Internal::AnyHash)
        end

      # User email address (required)
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # User full name (required)
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # User role: admin, billing, or developer (required)
      sig { returns(T.nilable(String)) }
      attr_reader :role

      sig { params(role: String).void }
      attr_writer :role

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          email: String,
          name: String,
          role: String,
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # User email address (required)
        email: nil,
        # User full name (required)
        name: nil,
        # User role: admin, billing, or developer (required)
        role: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        idempotency_key: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            email: String,
            name: String,
            role: String,
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
