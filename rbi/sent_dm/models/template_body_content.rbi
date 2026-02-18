# typed: strong

module SentDm
  module Models
    class TemplateBodyContent < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::TemplateBodyContent, SentDm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :template

      sig { params(template: String).void }
      attr_writer :template

      sig { returns(T.nilable(String)) }
      attr_accessor :type

      sig { returns(T.nilable(T::Array[SentDm::TemplateVariable])) }
      attr_accessor :variables

      sig do
        params(
          template: String,
          type: T.nilable(String),
          variables: T.nilable(T::Array[SentDm::TemplateVariable::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(template: nil, type: nil, variables: nil)
      end

      sig do
        override.returns(
          {
            template: String,
            type: T.nilable(String),
            variables: T.nilable(T::Array[SentDm::TemplateVariable])
          }
        )
      end
      def to_hash
      end
    end
  end
end
