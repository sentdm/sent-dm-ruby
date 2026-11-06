# typed: strong

module Sentdm
  module Models
    class ComplianceRequirement < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ComplianceRequirement, Sentdm::Internal::AnyHash)
        end

      # Refinement of type where the market demands a specific shape, e.g. e164, url,
      # email, iso3166_alpha2, csv_keywords.
      sig { returns(T.nilable(String)) }
      attr_accessor :format_

      # Shape of each entry, when this requirement is a list of objects rather than of
      # scalars.
      #
      # The compliance value stays null in the setup body like every other blank — a
      # body that carries a half-filled object is one the endpoint refuses, which would
      # break the promise that the published body can be sent as it stands. So the shape
      # is described here instead, and each entry the caller composes has these keys.
      sig { returns(T.nilable(T::Array[Sentdm::ComplianceRequirement])) }
      attr_accessor :item_fields

      # Key to use in the compliance map.
      sig { returns(T.nilable(String)) }
      attr_reader :key

      sig { params(key: String).void }
      attr_writer :key

      # Human label, suitable for a form field.
      sig { returns(T.nilable(String)) }
      attr_accessor :label

      # Most entries this value accepts, where the market caps it.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_items

      # Shortest acceptable value, where the market sets one. TCR refuses a consent
      # narrative under 40 characters, and finding that out at submission time is the
      # round trip this exists to save.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :min_length

      # Why the market asks for this.
      sig { returns(T.nilable(String)) }
      attr_accessor :notes

      # Accepted values, when the type is an enum or a constrained array.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :options

      # Whether the market always demands this value.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :required

      sig { params(required: T::Boolean).void }
      attr_writer :required

      # Condition that makes this value required, when it is only required in some cases
      # — e.g. brand.entity_type == PUBLIC_PROFIT. Evaluate it against your own payload
      # to know whether to collect the field.
      sig { returns(T.nilable(String)) }
      attr_accessor :required_when

      # Value type: string, number, boolean, date, enum, object, array or document.
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # One value a market expects in a channel call's compliance map.
      sig do
        params(
          format_: T.nilable(String),
          item_fields: T.nilable(T::Array[Sentdm::ComplianceRequirement]),
          key: String,
          label: T.nilable(String),
          max_items: T.nilable(Integer),
          min_length: T.nilable(Integer),
          notes: T.nilable(String),
          options: T.nilable(T::Array[String]),
          required: T::Boolean,
          required_when: T.nilable(String),
          type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Refinement of type where the market demands a specific shape, e.g. e164, url,
        # email, iso3166_alpha2, csv_keywords.
        format_: nil,
        # Shape of each entry, when this requirement is a list of objects rather than of
        # scalars.
        #
        # The compliance value stays null in the setup body like every other blank — a
        # body that carries a half-filled object is one the endpoint refuses, which would
        # break the promise that the published body can be sent as it stands. So the shape
        # is described here instead, and each entry the caller composes has these keys.
        item_fields: nil,
        # Key to use in the compliance map.
        key: nil,
        # Human label, suitable for a form field.
        label: nil,
        # Most entries this value accepts, where the market caps it.
        max_items: nil,
        # Shortest acceptable value, where the market sets one. TCR refuses a consent
        # narrative under 40 characters, and finding that out at submission time is the
        # round trip this exists to save.
        min_length: nil,
        # Why the market asks for this.
        notes: nil,
        # Accepted values, when the type is an enum or a constrained array.
        options: nil,
        # Whether the market always demands this value.
        required: nil,
        # Condition that makes this value required, when it is only required in some cases
        # — e.g. brand.entity_type == PUBLIC_PROFIT. Evaluate it against your own payload
        # to know whether to collect the field.
        required_when: nil,
        # Value type: string, number, boolean, date, enum, object, array or document.
        type: nil
      )
      end

      sig do
        override.returns(
          {
            format_: T.nilable(String),
            item_fields: T.nilable(T::Array[Sentdm::ComplianceRequirement]),
            key: String,
            label: T.nilable(String),
            max_items: T.nilable(Integer),
            min_length: T.nilable(Integer),
            notes: T.nilable(String),
            options: T.nilable(T::Array[String]),
            required: T::Boolean,
            required_when: T.nilable(String),
            type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
