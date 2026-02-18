# typed: strong

module SentDm
  module Models
    class WebhookListParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::WebhookListParams, SentDm::Internal::AnyHash)
        end

      sig { returns(Integer) }
      attr_accessor :page

      sig { returns(Integer) }
      attr_accessor :page_size

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_active

      sig { returns(T.nilable(String)) }
      attr_accessor :search

      sig do
        params(
          page: Integer,
          page_size: Integer,
          is_active: T.nilable(T::Boolean),
          search: T.nilable(String),
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        page:,
        page_size:,
        is_active: nil,
        search: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            is_active: T.nilable(T::Boolean),
            search: T.nilable(String),
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
