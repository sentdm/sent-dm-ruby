# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Webhooks#retrieve
    class WebhookRetrieveParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
