# frozen_string_literal: true

module Sentdm
  module Models
    class ComplianceRequirement < Sentdm::Internal::Type::BaseModel
      # @!attribute format_
      #   Refinement of type where the market demands a specific shape, e.g. e164, url,
      #   email, iso3166_alpha2, csv_keywords.
      #
      #   @return [String, nil]
      optional :format_, String, api_name: :format, nil?: true

      # @!attribute item_fields
      #   Shape of each entry, when this requirement is a list of objects rather than of
      #   scalars.
      #
      #   The compliance value stays null in the setup body like every other blank — a
      #   body that carries a half-filled object is one the endpoint refuses, which would
      #   break the promise that the published body can be sent as it stands. So the shape
      #   is described here instead, and each entry the caller composes has these keys.
      #
      #   @return [Array<Sentdm::Models::ComplianceRequirement>, nil]
      optional :item_fields, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ComplianceRequirement] }, nil?: true

      # @!attribute key
      #   Key to use in the compliance map.
      #
      #   @return [String, nil]
      optional :key, String

      # @!attribute label
      #   Human label, suitable for a form field.
      #
      #   @return [String, nil]
      optional :label, String, nil?: true

      # @!attribute max_items
      #   Most entries this value accepts, where the market caps it.
      #
      #   @return [Integer, nil]
      optional :max_items, Integer, nil?: true

      # @!attribute min_length
      #   Shortest acceptable value, where the market sets one. TCR refuses a consent
      #   narrative under 40 characters, and finding that out at submission time is the
      #   round trip this exists to save.
      #
      #   @return [Integer, nil]
      optional :min_length, Integer, nil?: true

      # @!attribute notes
      #   Why the market asks for this.
      #
      #   @return [String, nil]
      optional :notes, String, nil?: true

      # @!attribute options
      #   Accepted values, when the type is an enum or a constrained array.
      #
      #   @return [Array<String>, nil]
      optional :options, Sentdm::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute required
      #   Whether the market always demands this value.
      #
      #   @return [Boolean, nil]
      optional :required, Sentdm::Internal::Type::Boolean

      # @!attribute required_when
      #   Condition that makes this value required, when it is only required in some cases
      #   — e.g. brand.entity_type == PUBLIC_PROFIT. Evaluate it against your own payload
      #   to know whether to collect the field.
      #
      #   @return [String, nil]
      optional :required_when, String, nil?: true

      # @!attribute type
      #   Value type: string, number, boolean, date, enum, object, array or document.
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(format_: nil, item_fields: nil, key: nil, label: nil, max_items: nil, min_length: nil, notes: nil, options: nil, required: nil, required_when: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ComplianceRequirement} for more details.
      #
      #   One value a market expects in a channel call's compliance map.
      #
      #   @param format_ [String, nil] Refinement of type where the market demands a specific shape, e.g. e164,
      #
      #   @param item_fields [Array<Sentdm::Models::ComplianceRequirement>, nil] Shape of each entry, when this requirement is a list of objects rather than of s
      #
      #   @param key [String] Key to use in the compliance map.
      #
      #   @param label [String, nil] Human label, suitable for a form field.
      #
      #   @param max_items [Integer, nil] Most entries this value accepts, where the market caps it.
      #
      #   @param min_length [Integer, nil] Shortest acceptable value, where the market sets one. TCR refuses a consent narr
      #
      #   @param notes [String, nil] Why the market asks for this.
      #
      #   @param options [Array<String>, nil] Accepted values, when the type is an enum or a constrained array.
      #
      #   @param required [Boolean] Whether the market always demands this value.
      #
      #   @param required_when [String, nil] Condition that makes this value required, when it is only required in some cases
      #
      #   @param type [String] Value type: string, number, boolean, date, enum,
    end
  end
end
