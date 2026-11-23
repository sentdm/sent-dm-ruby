# typed: strong

module Sentdm
  module Models
    class TemplateRef < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::TemplateRef, Sentdm::Internal::AnyHash) }

      # Template ID (mutually exclusive with slug and name)
      sig { returns(T.nilable(String)) }
      attr_accessor :id

      # Template name (mutually exclusive with id and slug)
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Template variable parameters for personalization, keyed by variable name.
      #
      # Every variable the template declares is required; GET /v3/templates/{id} lists
      # them. Supplying a key the template does not declare is ignored.
      #
      # Media headers. A template whose header is an image (designed in WhatsApp Manager
      # and imported into Sent) declares a reserved header_image key. Its value is a
      # publicly reachable https URL that Meta fetches at send time — Sent does not host
      # the asset, and the sample approved with the template is not reused. The key is
      # derived from the header's media type, so header_video and header_document follow
      # the same shape when those formats ship.
      #
      # "parameters": { "header_image": "https://cdn.example.com/banner.jpg", "name":
      # "John Doe" }
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_accessor :parameters

      # Template slug (mutually exclusive with id and name): the stable name every
      # template on this account carries (GET /v3/templates lists them). Compared
      # case-insensitively.
      sig { returns(T.nilable(String)) }
      attr_accessor :slug

      # SDK-style template reference: resolve by id, by slug or by name (exactly one),
      # with optional parameters.
      sig do
        params(
          id: T.nilable(String),
          name: T.nilable(String),
          parameters: T.nilable(T::Hash[Symbol, String]),
          slug: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Template ID (mutually exclusive with slug and name)
        id: nil,
        # Template name (mutually exclusive with id and slug)
        name: nil,
        # Template variable parameters for personalization, keyed by variable name.
        #
        # Every variable the template declares is required; GET /v3/templates/{id} lists
        # them. Supplying a key the template does not declare is ignored.
        #
        # Media headers. A template whose header is an image (designed in WhatsApp Manager
        # and imported into Sent) declares a reserved header_image key. Its value is a
        # publicly reachable https URL that Meta fetches at send time — Sent does not host
        # the asset, and the sample approved with the template is not reused. The key is
        # derived from the header's media type, so header_video and header_document follow
        # the same shape when those formats ship.
        #
        # "parameters": { "header_image": "https://cdn.example.com/banner.jpg", "name":
        # "John Doe" }
        parameters: nil,
        # Template slug (mutually exclusive with id and name): the stable name every
        # template on this account carries (GET /v3/templates lists them). Compared
        # case-insensitively.
        slug: nil
      )
      end

      sig do
        override.returns(
          {
            id: T.nilable(String),
            name: T.nilable(String),
            parameters: T.nilable(T::Hash[Symbol, String]),
            slug: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
