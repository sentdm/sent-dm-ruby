# typed: strong

module Sentdm
  module Models
    class UserUpdateRoleParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::UserUpdateRoleParams, Sentdm::Internal::AnyHash)
        end

      # User role: admin, billing, or developer (required)
      sig { returns(T.nilable(String)) }
      attr_reader :role

      sig { params(role: String).void }
      attr_writer :role

      # Test mode flag - when true, the operation is simulated without side effects
      # Useful for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :test_mode

      sig { params(test_mode: T::Boolean).void }
      attr_writer :test_mode

      # User ID from route parameter
      sig { returns(T.nilable(String)) }
      attr_reader :body_user_id

      sig { params(body_user_id: String).void }
      attr_writer :body_user_id

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          role: String,
          test_mode: T::Boolean,
          body_user_id: String,
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # User role: admin, billing, or developer (required)
        role: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        # User ID from route parameter
        body_user_id: nil,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            role: String,
            test_mode: T::Boolean,
            body_user_id: String,
            idempotency_key: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
