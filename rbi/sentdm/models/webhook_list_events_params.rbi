# typed: strong

module Sentdm
  module Models
    class WebhookListEventsParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookListEventsParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(Integer) }
      attr_accessor :page

      sig { returns(Integer) }
      attr_accessor :page_size

      sig { returns(T.nilable(String)) }
      attr_accessor :search

      sig do
        params(
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(page:, page_size:, search: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            search: T.nilable(String),
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
