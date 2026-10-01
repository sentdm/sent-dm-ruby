# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class VoiceCallbackTestErrorInfo < Sentdm::Internal::Type::BaseModel
        # @!attribute message
        #   What to fix
        #
        #   @return [String, nil]
        optional :message, String

        # @!attribute path
        #   Dotted path of the answer field at fault, such as action.action, when one field
        #   is to blame
        #
        #   @return [String, nil]
        optional :path, String, nil?: true

        # @!attribute reason
        #   Machine-readable reason, such as timeout, http_error, malformed_json,
        #   missing_action or unknown_action
        #
        #   @return [String, nil]
        optional :reason, String

        # @!method initialize(message: nil, path: nil, reason: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::VoiceCallbackTestErrorInfo} for more details.
        #
        #   Why the test did not end with ok
        #
        #   @param message [String] What to fix
        #
        #   @param path [String, nil] Dotted path of the answer field at fault, such as action.action, when one field
        #
        #   @param reason [String] Machine-readable reason, such as timeout, http_error, malformed_json, missing_ac
      end
    end
  end
end
