# frozen_string_literal: true

module Sentdm
  module Models
    class ProfileCompletionResult < Sentdm::Internal::Type::BaseModel
      # @!attribute message
      #   Human-readable message describing the result.
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute status
      #   Current process status of the profile (e.g., "completed", "submitted",
      #   "in_progress").
      #
      #   @return [String, nil]
      optional :status, String

      # @!method initialize(message: nil, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileCompletionResult} for more details.
      #
      #   Response when a profile is already in the completed state and no further action
      #   is taken.
      #
      #   @param message [String] Human-readable message describing the result.
      #
      #   @param status [String] Current process status of the profile (e.g., "completed", "submitted", "in_progr
    end
  end
end
