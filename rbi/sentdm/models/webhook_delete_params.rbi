# typed: strong

module Sentdm
  module Models
    class WebhookDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookDeleteParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(id:, request_options: {})
      end

      sig do
        override.returns(
          { id: String, request_options: Sentdm::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
