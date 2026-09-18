# typed: strong

module Sentdm
  module Models
    class TemplateBodyContent < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateBodyContent, Sentdm::Internal::AnyHash)
        end

      # The body copy, with variables written as {{index:variable}}.
      #
      # Length cap depends on which channel this body belongs to:
      # TemplateContentLimits.MaxBodyLength (1024) for multiChannel, sms and whatsapp —
      # Meta's BODY limit, which a multiChannel body may be delivered under — and
      # TemplateContentLimits.MaxRcsBodyLength (3072) for an rcs body, which never
      # reaches Meta. The maxLength advertised on this schema is the 1024 one, because
      # all four channel bodies share this single schema — an rcs body between the two
      # is accepted.
      #
      # Meta requires every variable to carry surrounding context, so a body is refused
      # unless it also satisfies all of the following (enforced by
      # TemplateDefinitionValidator): At least one letter before the first variable and
      # after the last — trailing punctuation such as "... {{1:variable}}." does not
      # count. At least (2 × variable count) + 1 words once the placeholders are
      # removed. No two variables adjacent with only whitespace between them. No leading
      # or trailing newline, no more than two consecutive line breaks, and no more than
      # four consecutive spaces.
      #
      # Example: "Hello {{0:variable}}! Welcome to {{1:variable}}. We are glad to have
      # you on board." — two variables, so at least five words are required, and the
      # copy after the final variable contains letters.
      sig { returns(String) }
      attr_accessor :template

      # The type of body content — send "text". It is dropped from the stored definition
      # when null, so a body posted without it is saved with no type key at all and the
      # template editor has nothing to render the block from.
      sig { returns(T.nilable(String)) }
      attr_accessor :type

      # The variables referenced by the body copy, one entry per {{index:variable}}
      # placeholder.
      sig { returns(T.nilable(T::Array[Sentdm::TemplateVariable])) }
      attr_accessor :variables

      sig do
        params(
          template: String,
          type: T.nilable(String),
          variables: T.nilable(T::Array[Sentdm::TemplateVariable::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(
        # The body copy, with variables written as {{index:variable}}.
        #
        # Length cap depends on which channel this body belongs to:
        # TemplateContentLimits.MaxBodyLength (1024) for multiChannel, sms and whatsapp —
        # Meta's BODY limit, which a multiChannel body may be delivered under — and
        # TemplateContentLimits.MaxRcsBodyLength (3072) for an rcs body, which never
        # reaches Meta. The maxLength advertised on this schema is the 1024 one, because
        # all four channel bodies share this single schema — an rcs body between the two
        # is accepted.
        #
        # Meta requires every variable to carry surrounding context, so a body is refused
        # unless it also satisfies all of the following (enforced by
        # TemplateDefinitionValidator): At least one letter before the first variable and
        # after the last — trailing punctuation such as "... {{1:variable}}." does not
        # count. At least (2 × variable count) + 1 words once the placeholders are
        # removed. No two variables adjacent with only whitespace between them. No leading
        # or trailing newline, no more than two consecutive line breaks, and no more than
        # four consecutive spaces.
        #
        # Example: "Hello {{0:variable}}! Welcome to {{1:variable}}. We are glad to have
        # you on board." — two variables, so at least five words are required, and the
        # copy after the final variable contains letters.
        template:,
        # The type of body content — send "text". It is dropped from the stored definition
        # when null, so a body posted without it is saved with no type key at all and the
        # template editor has nothing to render the block from.
        type: nil,
        # The variables referenced by the body copy, one entry per {{index:variable}}
        # placeholder.
        variables: nil
      )
      end

      sig do
        override.returns(
          {
            template: String,
            type: T.nilable(String),
            variables: T.nilable(T::Array[Sentdm::TemplateVariable])
          }
        )
      end
      def to_hash
      end
    end
  end
end
