# typed: strong

module Sentdm
  module Models
    class TemplateRef < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::TemplateRef, Sentdm::Internal::AnyHash) }

      # Template ID (mutually exclusive with name)
      sig { returns(T.nilable(String)) }
      attr_accessor :id

      # Template name (mutually exclusive with id)
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

      # SDK-style template reference: resolve by ID or by name, with optional
      # parameters.
      sig do
        params(
          id: T.nilable(String),
          name: T.nilable(String),
          parameters: T.nilable(T::Hash[Symbol, String])
        ).returns(T.attached_class)
      end
      def self.new(
        # Template ID (mutually exclusive with name)
        id: nil,
        # Template name (mutually exclusive with id)
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
        parameters: nil
      )
      end

      sig do
        override.returns(
          {
            id: T.nilable(String),
            name: T.nilable(String),
            parameters: T.nilable(T::Hash[Symbol, String])
          }
        )
      end
      def to_hash
      end
    end
  end
end
