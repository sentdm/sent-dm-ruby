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

      sig { returns(String) }
      attr_accessor :id

      # Request to delete/dissociate a contact
      sig { returns(Sentdm::ContactDeleteParams::Body) }
      attr_reader :body

      sig { params(body: Sentdm::ContactDeleteParams::Body::OrHash).void }
      attr_writer :body

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          id: String,
          body: Sentdm::ContactDeleteParams::Body::OrHash,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Request to delete/dissociate a contact
        body:,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            body: Sentdm::ContactDeleteParams::Body,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Body < Sentdm::Models::MutationRequestBase
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
