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

      # Page number (1-indexed)
      sig { returns(Integer) }
      attr_accessor :page

      sig { returns(Integer) }
      attr_accessor :page_size

      # Optional channel filter (sms, whatsapp)
      sig { returns(T.nilable(String)) }
      attr_accessor :channel

      # Optional phone number filter (alternative to list view)
      sig { returns(T.nilable(String)) }
      attr_accessor :phone

      # Optional search term for filtering contacts
      sig { returns(T.nilable(String)) }
      attr_accessor :search

      sig do
        params(
          page: Integer,
          page_size: Integer,
          channel: T.nilable(String),
          phone: T.nilable(String),
          search: T.nilable(String),
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Page number (1-indexed)
        page:,
        page_size:,
        # Optional channel filter (sms, whatsapp)
        channel: nil,
        # Optional phone number filter (alternative to list view)
        phone: nil,
        # Optional search term for filtering contacts
        search: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            channel: T.nilable(String),
            phone: T.nilable(String),
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
