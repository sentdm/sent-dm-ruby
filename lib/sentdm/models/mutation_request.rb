# frozen_string_literal: true

module Sentdm
  module Models
    class MutationRequest < Sentdm::Internal::Type::BaseModel
      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!method initialize(sandbox: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MutationRequest} for more details.
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
    end
  end
end
