# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class VoiceCallbackTestResponseInfo < Sentdm::Internal::Type::BaseModel
        # @!attribute body
        #   The start of the raw response body, capped at 2048 characters
        #
        #   @return [String, nil]
        optional :body, String, nil?: true

        # @!attribute status_code
        #   The HTTP status your endpoint returned
        #
        #   @return [Integer, nil]
        optional :status_code, Integer

        # @!method initialize(body: nil, status_code: nil)
        #   What your endpoint answered
        #
        #   @param body [String, nil] The start of the raw response body, capped at 2048 characters
        #
        #   @param status_code [Integer] The HTTP status your endpoint returned
      end
    end
  end
end
