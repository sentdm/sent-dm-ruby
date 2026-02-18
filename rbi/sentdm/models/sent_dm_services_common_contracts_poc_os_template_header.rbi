# typed: strong

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateHeader < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::SentDmServicesCommonContractsPocOsTemplateHeader,
            Sentdm::Internal::AnyHash
          )
        end

      # The header template text with optional variable placeholders (e.g., "Welcome to
      # {{0:variable}}")
      sig { returns(T.nilable(String)) }
      attr_reader :template

      sig { params(template: String).void }
      attr_writer :template

      # The type of header (e.g., "text", "image", "video", "document")
      sig { returns(T.nilable(String)) }
      attr_accessor :type

      # List of variables used in the header template
      sig { returns(T.nilable(T::Array[Sentdm::TemplateVariable])) }
      attr_accessor :variables

      # Header section of a message template
      sig do
        params(
          template: String,
          type: T.nilable(String),
          variables: T.nilable(T::Array[Sentdm::TemplateVariable::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(
        # The header template text with optional variable placeholders (e.g., "Welcome to
        # {{0:variable}}")
        template: nil,
        # The type of header (e.g., "text", "image", "video", "document")
        type: nil,
        # List of variables used in the header template
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
