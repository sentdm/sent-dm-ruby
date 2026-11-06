# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateRef < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   Template ID (mutually exclusive with name)
      #
      #   @return [String, nil]
      optional :id, String, nil?: true

      # @!attribute name
      #   Template name (mutually exclusive with id)
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute parameters
      #   Template variable parameters for personalization, keyed by variable name.
      #
      #   Every variable the template declares is required; GET /v3/templates/{id} lists
      #   them. Supplying a key the template does not declare is ignored.
      #
      #   Media headers. A template whose header is an image (designed in WhatsApp Manager
      #   and imported into Sent) declares a reserved header_image key. Its value is a
      #   publicly reachable https URL that Meta fetches at send time — Sent does not host
      #   the asset, and the sample approved with the template is not reused. The key is
      #   derived from the header's media type, so header_video and header_document follow
      #   the same shape when those formats ship.
      #
      #   "parameters": { "header_image": "https://cdn.example.com/banner.jpg", "name":
      #   "John Doe" }
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :parameters, Sentdm::Internal::Type::HashOf[String], nil?: true

      # @!method initialize(id: nil, name: nil, parameters: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateRef} for more details.
      #
      #   SDK-style template reference: resolve by ID or by name, with optional
      #   parameters.
      #
      #   @param id [String, nil] Template ID (mutually exclusive with name)
      #
      #   @param name [String, nil] Template name (mutually exclusive with id)
      #
      #   @param parameters [Hash{Symbol=>String}, nil] Template variable parameters for personalization, keyed by variable name.
    end
  end
end
