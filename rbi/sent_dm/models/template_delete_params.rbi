# typed: strong

module SentDm
  module Models
    class TemplateDeleteParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::TemplateDeleteParams, SentDm::Internal::AnyHash)
        end

      sig do
        params(request_options: SentDm::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: SentDm::RequestOptions }) }
      def to_hash
      end
    end
  end
end
