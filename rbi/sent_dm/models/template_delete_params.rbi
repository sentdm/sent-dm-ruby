# typed: strong

module SentDm
  module Models
    class TemplateDeleteParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::TemplateDeleteParams, SentDm::Internal::AnyHash)
        end

      # Whether to also delete the template from WhatsApp/Meta (optional, defaults to
      # false)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :delete_from_meta

      # Test mode flag - when true, the operation is simulated without side effects
      # Useful for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :test_mode

      sig { params(test_mode: T::Boolean).void }
      attr_writer :test_mode

      sig do
        params(
          delete_from_meta: T.nilable(T::Boolean),
          test_mode: T::Boolean,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether to also delete the template from WhatsApp/Meta (optional, defaults to
        # false)
        delete_from_meta: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            delete_from_meta: T.nilable(T::Boolean),
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
