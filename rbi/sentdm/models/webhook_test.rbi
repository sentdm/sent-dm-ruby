# typed: strong

module Sentdm
  module Models
    class WebhookTest < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::WebhookTest, Sentdm::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig do
        params(message: String, success: T::Boolean).returns(T.attached_class)
      end
      def self.new(message: nil, success: nil)
      end

      sig { override.returns({ message: String, success: T::Boolean }) }
      def to_hash
      end
    end
  end
end
