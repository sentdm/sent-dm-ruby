# frozen_string_literal: true

module Sentdm
  module Models
    class WebhookTest < Sentdm::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(message: nil, success: nil)
      #   @param message [String]
      #   @param success [Boolean]
    end
  end
end
