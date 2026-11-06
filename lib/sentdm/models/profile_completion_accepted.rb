# frozen_string_literal: true

module Sentdm
  module Models
    class ProfileCompletionAccepted < Sentdm::Internal::Type::BaseModel
      # @!attribute message
      #   Human-readable message describing the accepted state.
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(message: nil)
      #   Response acknowledging that profile completion has been accepted and started in
      #   the background. The provided webhook URL will be called when processing
      #   finishes.
      #
      #   @param message [String] Human-readable message describing the accepted state.
    end
  end
end
