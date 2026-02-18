# typed: strong

module SentDm
  module Models
    class UserRemoveParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::UserRemoveParams, SentDm::Internal::AnyHash)
        end

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

      sig do
        params(
          test_mode: T::Boolean,
          body_user_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        # User ID from route parameter
        body_user_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            test_mode: T::Boolean,
            body_user_id: String,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
