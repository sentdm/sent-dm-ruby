# typed: strong

module Sentdm
  module Models
    class BrandDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::BrandDeleteParams, Sentdm::Internal::AnyHash)
        end

      # Request to delete a brand
      sig { returns(Sentdm::BrandDeleteParams::Body) }
      attr_reader :body

      sig { params(body: Sentdm::BrandDeleteParams::Body::OrHash).void }
      attr_writer :body

      sig do
        params(
          body: Sentdm::BrandDeleteParams::Body::OrHash,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Request to delete a brand
        body:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body: Sentdm::BrandDeleteParams::Body,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Body < Sentdm::Models::MutationRequest
        OrHash =
          T.type_alias do
            T.any(Sentdm::BrandDeleteParams::Body, Sentdm::Internal::AnyHash)
          end

        # Request to delete a brand
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
