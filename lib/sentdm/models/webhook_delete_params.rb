# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#delete
    class WebhookDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

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

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(id:, api_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::WebhookDeleteParams} for more details.
      #
      #   @param id [String]
      #
      #   @param api_key [String] API key from the x-api-key header, or empty when the caller sent it as
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
