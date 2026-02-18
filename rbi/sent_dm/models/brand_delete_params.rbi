# typed: strong

module SentDm
  module Models
    class BrandDeleteParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::BrandDeleteParams, SentDm::Internal::AnyHash)
        end

      # Request to delete a brand
      sig { returns(SentDm::BrandDeleteParams::Body) }
      attr_reader :body

      sig { params(body: SentDm::BrandDeleteParams::Body::OrHash).void }
      attr_writer :body

      sig do
        params(
          body: SentDm::BrandDeleteParams::Body::OrHash,
          request_options: SentDm::RequestOptions::OrHash
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
            body: SentDm::BrandDeleteParams::Body,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Body < SentDm::Models::MutationRequest
        OrHash =
          T.type_alias do
            T.any(SentDm::BrandDeleteParams::Body, SentDm::Internal::AnyHash)
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
