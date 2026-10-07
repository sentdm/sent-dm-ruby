# frozen_string_literal: true

module Sentdm
  module Models
    class MutationRequest < Sentdm::Internal::Type::BaseModel
      # @!attribute api_key
      #   API key from the x-api-key header, or empty when the caller sent it as
      #   Authorization: Bearer instead.
      #
      #   Optional on purpose. CustomerV3AuthenticationHandler accepts the key in either
      #   header, and [FromHeader] is required by default, so a Bearer-only request would
      #   authenticate and then be refused with a 400 for a header it never needed.
      #   Endpoints read the customer from the CustomerId claim, not from this value.
      #
      #   @return [String, nil]
      optional :api_key, String, api_name: :apiKey

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!method initialize(api_key: nil, sandbox: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MutationRequest} for more details.
      #
      #   @param api_key [String] API key from the x-api-key header, or empty when the caller sent it as
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
    end
  end
end
