# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#delete
    class TemplateDeleteParams < Sentdm::Internal::Type::BaseModel
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

      # @!attribute delete_from_meta
      #   Whether to also delete the template from WhatsApp/Meta (optional, defaults to
      #   false)
      #
      #   @return [Boolean, nil]
      optional :delete_from_meta, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(id:, api_key: nil, delete_from_meta: nil, sandbox: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateDeleteParams} for more details.
      #
      #   @param id [String]
      #
      #   @param api_key [String] API key from the x-api-key header, or empty when the caller sent it as
      #
      #   @param delete_from_meta [Boolean, nil] Whether to also delete the template from WhatsApp/Meta (optional, defaults to fa
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
