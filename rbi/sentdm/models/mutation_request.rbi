# typed: strong

module Sentdm
  module Models
    class MutationRequest < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MutationRequest, Sentdm::Internal::AnyHash)
        end

      # API key from the x-api-key header, or empty when the caller sent it as
      # Authorization: Bearer instead.
      #
      # Optional on purpose. CustomerV3AuthenticationHandler accepts the key in either
      # header, and [FromHeader] is required by default, so a Bearer-only request would
      # authenticate and then be refused with a 400 for a header it never needed.
      # Endpoints read the customer from the CustomerId claim, not from this value.
      sig { returns(T.nilable(String)) }
      attr_reader :api_key

      sig { params(api_key: String).void }
      attr_writer :api_key

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      sig do
        params(api_key: String, sandbox: T::Boolean).returns(T.attached_class)
      end
      def self.new(
        # API key from the x-api-key header, or empty when the caller sent it as
        # Authorization: Bearer instead.
        #
        # Optional on purpose. CustomerV3AuthenticationHandler accepts the key in either
        # header, and [FromHeader] is required by default, so a Bearer-only request would
        # authenticate and then be refused with a 400 for a header it never needed.
        # Endpoints read the customer from the CustomerId claim, not from this value.
        api_key: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil
      )
      end

      sig { override.returns({ api_key: String, sandbox: T::Boolean }) }
      def to_hash
      end
    end
  end
end
