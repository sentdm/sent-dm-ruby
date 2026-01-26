# typed: strong

module SentDm
  module Models
    class ContactListParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::ContactListParams, SentDm::Internal::AnyHash)
        end

      # The page number (zero-indexed). Default is 0.
      sig { returns(Integer) }
      attr_accessor :page

      # The number of items per page. Default is 20.
      sig { returns(Integer) }
      attr_accessor :page_size

      sig { returns(String) }
      attr_accessor :x_api_key

      sig { returns(String) }
      attr_accessor :x_sender_id

      sig do
        params(
          page: Integer,
          page_size: Integer,
          x_api_key: String,
          x_sender_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The page number (zero-indexed). Default is 0.
        page:,
        # The number of items per page. Default is 20.
        page_size:,
        x_api_key:,
        x_sender_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            x_api_key: String,
            x_sender_id: String,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
