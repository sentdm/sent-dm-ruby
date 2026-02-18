# typed: strong

module Sentdm
  module Models
    class MutationRequest < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MutationRequest, Sentdm::Internal::AnyHash)
        end

      # Test mode flag - when true, the operation is simulated without side effects
      # Useful for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :test_mode

      sig { params(test_mode: T::Boolean).void }
      attr_writer :test_mode

      sig { params(test_mode: T::Boolean).returns(T.attached_class) }
      def self.new(
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil
      )
      end

      sig { override.returns({ test_mode: T::Boolean }) }
      def to_hash
      end
    end
  end
end
