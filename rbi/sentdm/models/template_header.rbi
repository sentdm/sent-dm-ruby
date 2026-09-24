# typed: strong

module Sentdm
  module Models
    class TemplateHeader < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateHeader, Sentdm::Internal::AnyHash)
        end

      # The header template text with optional variable placeholders (e.g., "Welcome to
      # {{0:variable}}")
      sig { returns(String) }
      attr_accessor :template

      # Request-only. The s.dm URL of the asset Meta's reviewers see —
      # https://s.dm/s/{ID}, eight uppercase characters, uploaded to s.dm out of band.
      # NormalizeRichHeader folds it into the synthesized media variable's Props.Sample
      # and clears it, so it never persists and a stored definition is indistinguishable
      # from an imported one.
      #
      # Stricter than the send path on purpose:
      # TemplateUtils.ValidateMediaVariableValues accepts any absolute https URL for the
      # per-send asset, because that one is the customer's and may live behind a signed
      # CDN link. This one is the review sample, has to outlive every resubmission, and
      # so must be ours. Do not "fix" one to match the other.
      sig { returns(T.nilable(String)) }
      attr_accessor :example_url

      # The map pin a location header drops. Meta wants none of this at creation — the
      # component is just {"type":"header","format":"location"} — so these values exist
      # for Sent: a preview, and the default a StaticResource header falls back to at
      # send.
      sig { returns(T.nilable(Sentdm::TemplateHeader::Location)) }
      attr_reader :location

      sig do
        params(
          location: T.nilable(Sentdm::TemplateHeader::Location::OrHash)
        ).void
      end
      attr_writer :location

      # Whether the asset registered at creation is reused when a caller omits the
      # header's variable at send time. Default false — the caller must supply it per
      # message, which is the behaviour every existing template has. Written only when
      # true, so a default-valued header serializes byte-identically to one imported
      # from Meta.
      #
      # Stored and validated but not yet honoured at send: that lands with the Resumable
      # Upload work, alongside the code that lets such a template be approved in the
      # first place.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :static_resource

      sig { params(static_resource: T::Boolean).void }
      attr_writer :static_resource

      # The kind of header. One of:
      #
      # text — up to 60 characters, at most one variable. image — png, jpg or jpeg.
      # Needs ExampleUrl. video — mp4. Needs ExampleUrl. gif — mp4, max 3.5MB. WhatsApp
      # renders larger files as an ordinary video. Needs ExampleUrl. document — pdf or
      # docx; only the first page is shown as a thumbnail, so pdf is the practical
      # choice. Needs ExampleUrl. location — a map pin, supplied through Location.
      #
      # Kept lowercase because MetaToTemplateConverter writes Meta's format through
      # ToLowerInvariant() into this field on import, and the two are compared directly.
      sig { returns(T.nilable(String)) }
      attr_accessor :type

      # List of variables used in the header template
      sig { returns(T.nilable(T::Array[Sentdm::TemplateVariable])) }
      attr_accessor :variables

      # Header section of a message template
      sig do
        params(
          template: String,
          example_url: T.nilable(String),
          location: T.nilable(Sentdm::TemplateHeader::Location::OrHash),
          static_resource: T::Boolean,
          type: T.nilable(String),
          variables: T.nilable(T::Array[Sentdm::TemplateVariable::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(
        # The header template text with optional variable placeholders (e.g., "Welcome to
        # {{0:variable}}")
        template:,
        # Request-only. The s.dm URL of the asset Meta's reviewers see —
        # https://s.dm/s/{ID}, eight uppercase characters, uploaded to s.dm out of band.
        # NormalizeRichHeader folds it into the synthesized media variable's Props.Sample
        # and clears it, so it never persists and a stored definition is indistinguishable
        # from an imported one.
        #
        # Stricter than the send path on purpose:
        # TemplateUtils.ValidateMediaVariableValues accepts any absolute https URL for the
        # per-send asset, because that one is the customer's and may live behind a signed
        # CDN link. This one is the review sample, has to outlive every resubmission, and
        # so must be ours. Do not "fix" one to match the other.
        example_url: nil,
        # The map pin a location header drops. Meta wants none of this at creation — the
        # component is just {"type":"header","format":"location"} — so these values exist
        # for Sent: a preview, and the default a StaticResource header falls back to at
        # send.
        location: nil,
        # Whether the asset registered at creation is reused when a caller omits the
        # header's variable at send time. Default false — the caller must supply it per
        # message, which is the behaviour every existing template has. Written only when
        # true, so a default-valued header serializes byte-identically to one imported
        # from Meta.
        #
        # Stored and validated but not yet honoured at send: that lands with the Resumable
        # Upload work, alongside the code that lets such a template be approved in the
        # first place.
        static_resource: nil,
        # The kind of header. One of:
        #
        # text — up to 60 characters, at most one variable. image — png, jpg or jpeg.
        # Needs ExampleUrl. video — mp4. Needs ExampleUrl. gif — mp4, max 3.5MB. WhatsApp
        # renders larger files as an ordinary video. Needs ExampleUrl. document — pdf or
        # docx; only the first page is shown as a thumbnail, so pdf is the practical
        # choice. Needs ExampleUrl. location — a map pin, supplied through Location.
        #
        # Kept lowercase because MetaToTemplateConverter writes Meta's format through
        # ToLowerInvariant() into this field on import, and the two are compared directly.
        type: nil,
        # List of variables used in the header template
        variables: nil
      )
      end

      sig do
        override.returns(
          {
            template: String,
            example_url: T.nilable(String),
            location: T.nilable(Sentdm::TemplateHeader::Location),
            static_resource: T::Boolean,
            type: T.nilable(String),
            variables: T.nilable(T::Array[Sentdm::TemplateVariable])
          }
        )
      end
      def to_hash
      end

      class Location < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::TemplateHeader::Location, Sentdm::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :address

        sig { returns(String) }
        attr_accessor :latitude

        sig { returns(String) }
        attr_accessor :longitude

        sig { returns(String) }
        attr_accessor :name

        # The map pin a location header drops. Meta wants none of this at creation — the
        # component is just {"type":"header","format":"location"} — so these values exist
        # for Sent: a preview, and the default a StaticResource header falls back to at
        # send.
        sig do
          params(
            address: String,
            latitude: String,
            longitude: String,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(address:, latitude:, longitude:, name:)
        end

        sig do
          override.returns(
            {
              address: String,
              latitude: String,
              longitude: String,
              name: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
