# typed: strong

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateFooter < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::SentDmServicesCommonContractsPocOsTemplateFooter,
            Sentdm::Internal::AnyHash
          )
        end

      # The footer template text with optional variable placeholders
      sig { returns(T.nilable(String)) }
      attr_reader :template

      sig { params(template: String).void }
      attr_writer :template

      # The type of footer (typically "text")
      sig { returns(T.nilable(String)) }
      attr_accessor :type

      # List of variables used in the footer template
      sig { returns(T.nilable(T::Array[Sentdm::TemplateVariable])) }
      attr_accessor :variables

      # Footer section of a message template
      sig do
        params(
          template: String,
          type: T.nilable(String),
          variables: T.nilable(T::Array[Sentdm::TemplateVariable::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(
        # The footer template text with optional variable placeholders
        template: nil,
        # The type of footer (typically "text")
        type: nil,
        # List of variables used in the footer template
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
