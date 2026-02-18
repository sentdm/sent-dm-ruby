# frozen_string_literal: true

module Sentdm
  module Models
    class MutationRequest < Sentdm::Internal::Type::BaseModel
      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, Sentdm::Internal::Type::Boolean

      # @!method initialize(test_mode: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MutationRequest} for more details.
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
    end
  end
end
