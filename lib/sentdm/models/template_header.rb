# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateHeader < Sentdm::Internal::Type::BaseModel
      # @!attribute template
      #   The header template text with optional variable placeholders (e.g., "Welcome to
      #   {{0:variable}}")
      #
      #   @return [String]
      required :template, String

      # @!attribute example_url
      #   Request-only. The s.dm URL of the asset Meta's reviewers see —
      #   https://s.dm/s/{ID}, eight uppercase characters, uploaded to s.dm out of band.
      #   NormalizeRichHeader folds it into the synthesized media variable's Props.Sample
      #   and clears it, so it never persists and a stored definition is indistinguishable
      #   from an imported one.
      #
      #   Stricter than the send path on purpose:
      #   TemplateUtils.ValidateMediaVariableValues accepts any absolute https URL for the
      #   per-send asset, because that one is the customer's and may live behind a signed
      #   CDN link. This one is the review sample, has to outlive every resubmission, and
      #   so must be ours. Do not "fix" one to match the other.
      #
      #   @return [String, nil]
      optional :example_url, String, nil?: true

      # @!attribute location
      #   The map pin a location header drops. Meta wants none of this at creation — the
      #   component is just {"type":"header","format":"location"} — so these values exist
      #   for Sent: a preview, and the default a StaticResource header falls back to at
      #   send.
      #
      #   @return [Sentdm::Models::TemplateHeader::Location, nil]
      optional :location, -> { Sentdm::TemplateHeader::Location }, nil?: true

      # @!attribute static_resource
      #   Whether the asset registered at creation is reused when a caller omits the
      #   header's variable at send time. Default false — the caller must supply it per
      #   message, which is the behaviour every existing template has. Written only when
      #   true, so a default-valued header serializes byte-identically to one imported
      #   from Meta.
      #
      #   Stored and validated but not yet honoured at send: that lands with the Resumable
      #   Upload work, alongside the code that lets such a template be approved in the
      #   first place.
      #
      #   @return [Boolean, nil]
      optional :static_resource, Sentdm::Internal::Type::Boolean

      # @!attribute type
      #   The kind of header. One of:
      #
      #   text — up to 60 characters, at most one variable. image — png, jpg or jpeg.
      #   Needs ExampleUrl. video — mp4. Needs ExampleUrl. gif — mp4, max 3.5MB. WhatsApp
      #   renders larger files as an ordinary video. Needs ExampleUrl. document — pdf or
      #   docx; only the first page is shown as a thumbnail, so pdf is the practical
      #   choice. Needs ExampleUrl. location — a map pin, supplied through Location.
      #
      #   Kept lowercase because MetaToTemplateConverter writes Meta's format through
      #   ToLowerInvariant() into this field on import, and the two are compared directly.
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!attribute variables
      #   List of variables used in the header template
      #
      #   @return [Array<Sentdm::Models::TemplateVariable>, nil]
      optional :variables, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateVariable] }, nil?: true

      # @!method initialize(template:, example_url: nil, location: nil, static_resource: nil, type: nil, variables: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateHeader} for more details.
      #
      #   Header section of a message template
      #
      #   @param template [String] The header template text with optional variable placeholders (e.g., "Welcome to
      #
      #   @param example_url [String, nil] Request-only. The s.dm URL of the asset Meta's reviewers see — https://s.dm/s/{I
      #
      #   @param location [Sentdm::Models::TemplateHeader::Location, nil] The map pin a location header drops. Meta wants none of this at creation — the c
      #
      #   @param static_resource [Boolean] Whether the asset registered at creation is reused when a caller omits the heade
      #
      #   @param type [String, nil] The kind of header. One of:
      #
      #   @param variables [Array<Sentdm::Models::TemplateVariable>, nil] List of variables used in the header template

      # @see Sentdm::Models::TemplateHeader#location
      class Location < Sentdm::Internal::Type::BaseModel
        # @!attribute address
        #
        #   @return [String]
        required :address, String

        # @!attribute latitude
        #
        #   @return [String]
        required :latitude, String

        # @!attribute longitude
        #
        #   @return [String]
        required :longitude, String

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!method initialize(address:, latitude:, longitude:, name:)
        #   The map pin a location header drops. Meta wants none of this at creation — the
        #   component is just {"type":"header","format":"location"} — so these values exist
        #   for Sent: a preview, and the default a StaticResource header falls back to at
        #   send.
        #
        #   @param address [String]
        #   @param latitude [String]
        #   @param longitude [String]
        #   @param name [String]
      end
    end
  end
end
