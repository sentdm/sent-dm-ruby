# typed: strong

module SentDm
  module Models
    class ContactDeleteParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::ContactDeleteParams, SentDm::Internal::AnyHash)
        end

      # Request to delete/dissociate a contact
      sig { returns(SentDm::ContactDeleteParams::Body) }
      attr_reader :body

      sig { params(body: SentDm::ContactDeleteParams::Body::OrHash).void }
      attr_writer :body

      sig do
        params(
          body: SentDm::ContactDeleteParams::Body::OrHash,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Request to delete/dissociate a contact
        body:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body: SentDm::ContactDeleteParams::Body,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Body < SentDm::Models::MutationRequest
        OrHash =
          T.type_alias do
            T.any(SentDm::ContactDeleteParams::Body, SentDm::Internal::AnyHash)
          end

        # Request to delete/dissociate a contact
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end
    end
  end
end
