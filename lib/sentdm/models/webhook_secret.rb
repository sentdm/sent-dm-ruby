# frozen_string_literal: true

module Sentdm
  module Models
    class WebhookSecret < Sentdm::Internal::Type::BaseModel
      # @!attribute signing_secret
      #
      #   @return [String, nil]
      optional :signing_secret, String

      # @!method initialize(signing_secret: nil)
      #   @param signing_secret [String]
    end
  end
end
