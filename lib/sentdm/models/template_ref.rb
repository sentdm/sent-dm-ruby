# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateRef < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   Template ID (mutually exclusive with slug and name)
      #
      #   @return [String, nil]
      optional :id, String, nil?: true

      # @!attribute name
      #   Template name (mutually exclusive with id and slug)
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

      # @!attribute slug
      #   Template slug (mutually exclusive with id and name): the stable name every
      #   template on this account carries (GET /v3/templates lists them). Compared
      #   case-insensitively.
      #
      #   @return [String, nil]
      optional :slug, String, nil?: true

      # @!method initialize(id: nil, name: nil, parameters: nil, slug: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateRef} for more details.
      #
      #   SDK-style template reference: resolve by id, by slug or by name (exactly one),
      #   with optional parameters.
      #
      #   @param id [String, nil] Template ID (mutually exclusive with slug and name)
      #
      #   @param name [String, nil] Template name (mutually exclusive with id and slug)
      #
      #   @param parameters [Hash{Symbol=>String}, nil] Template variable parameters for personalization, keyed by variable name.
      #
      #   @param slug [String, nil] Template slug (mutually exclusive with id and name): the stable name every templ
    end
  end
end
