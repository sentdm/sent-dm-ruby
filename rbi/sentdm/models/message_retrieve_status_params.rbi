# typed: strong

module Sentdm
  module Models
    class MessageRetrieveStatusParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageRetrieveStatusParams, Sentdm::Internal::AnyHash)
        end

      sig do
        params(request_options: Sentdm::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Sentdm::RequestOptions }) }
      def to_hash
      end
    end
  end
end
