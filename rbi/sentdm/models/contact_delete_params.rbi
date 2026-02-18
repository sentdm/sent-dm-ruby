# typed: strong

module Sentdm
  module Models
    class ContactDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::ContactDeleteParams, Sentdm::Internal::AnyHash)
        end

      # Request to delete/dissociate a contact
      sig { returns(Sentdm::ContactDeleteParams::Body) }
      attr_reader :body

      sig { params(body: Sentdm::ContactDeleteParams::Body::OrHash).void }
      attr_writer :body

      sig do
        params(
          body: Sentdm::ContactDeleteParams::Body::OrHash,
          request_options: Sentdm::RequestOptions::OrHash
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
            body: Sentdm::ContactDeleteParams::Body,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Body < Sentdm::Models::MutationRequest
        OrHash =
          T.type_alias do
            T.any(Sentdm::ContactDeleteParams::Body, Sentdm::Internal::AnyHash)
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
