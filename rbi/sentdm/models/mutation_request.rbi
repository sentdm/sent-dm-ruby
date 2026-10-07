# typed: strong

module Sentdm
  module Models
    class MutationRequest < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MutationRequest, Sentdm::Internal::AnyHash)
        end

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      sig { params(sandbox: T::Boolean).returns(T.attached_class) }
      def self.new(
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil
      )
      end

      sig { override.returns({ sandbox: T::Boolean }) }
      def to_hash
      end
    end
  end
end
