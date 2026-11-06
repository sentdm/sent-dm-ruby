# typed: strong

module Sentdm
  module Models
    class TemplateVariableProps < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateVariableProps, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :media_type

      # Example value substituted into the template when previewing it and when
      # submitting it to Meta for review. Free text by nature, so the converter accepts
      # a JSON number or boolean here and normalizes it — see
      # JsonScalarToStringConverter for why — and guarantees it is always serialized
      # back out as a JSON string.
      sig { returns(String) }
      attr_accessor :sample

      sig { returns(String) }
      attr_accessor :url

      sig { returns(String) }
      attr_accessor :variable_type

      sig { returns(T.nilable(String)) }
      attr_accessor :alt

      sig { returns(T.nilable(String)) }
      attr_accessor :regex

      sig { returns(T.nilable(String)) }
      attr_accessor :short_url

      sig do
        params(
          media_type: String,
          sample: String,
          url: String,
          variable_type: String,
          alt: T.nilable(String),
          regex: T.nilable(String),
          short_url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        media_type:,
        # Example value substituted into the template when previewing it and when
        # submitting it to Meta for review. Free text by nature, so the converter accepts
        # a JSON number or boolean here and normalizes it — see
        # JsonScalarToStringConverter for why — and guarantees it is always serialized
        # back out as a JSON string.
        sample:,
        url:,
        variable_type:,
        alt: nil,
        regex: nil,
        short_url: nil
      )
      end

      sig do
        override.returns(
          {
            media_type: String,
            sample: String,
            url: String,
            variable_type: String,
            alt: T.nilable(String),
            regex: T.nilable(String),
            short_url: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
