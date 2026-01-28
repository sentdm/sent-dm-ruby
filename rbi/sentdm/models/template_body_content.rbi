# typed: strong

module Sentdm
  module Models
    class TemplateBodyContent < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateBodyContent, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :template

      sig { params(template: String).void }
      attr_writer :template

      sig { returns(T.nilable(String)) }
      attr_accessor :type

      sig { returns(T.nilable(T::Array[Sentdm::TemplateVariable])) }
      attr_accessor :variables

      sig do
        params(
          template: String,
          type: T.nilable(String),
          variables: T.nilable(T::Array[Sentdm::TemplateVariable::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(template: nil, type: nil, variables: nil)
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
