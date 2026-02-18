# typed: strong

module SentDm
  module Models
    class ProfileDeleteParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::ProfileDeleteParams, SentDm::Internal::AnyHash)
        end

      # Profile ID from route parameter
      sig { returns(T.nilable(String)) }
      attr_reader :body_profile_id

      sig { params(body_profile_id: String).void }
      attr_writer :body_profile_id

      # Test mode flag - when true, the operation is simulated without side effects
      # Useful for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :test_mode

      sig { params(test_mode: T::Boolean).void }
      attr_writer :test_mode

      sig do
        params(
          body_profile_id: String,
          test_mode: T::Boolean,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Profile ID from route parameter
        body_profile_id: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body_profile_id: String,
            test_mode: T::Boolean,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
