# typed: strong

module Sentdm
  module Models
    class WebhookSecret < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::WebhookSecret, Sentdm::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_reader :signing_secret

      sig { params(signing_secret: String).void }
      attr_writer :signing_secret

      sig { params(signing_secret: String).returns(T.attached_class) }
      def self.new(signing_secret: nil)
      end

      sig { override.returns({ signing_secret: String }) }
      def to_hash
      end
    end
  end
end
