# typed: strong

module Sentdm
  module Models
    class ContactListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::ContactListParams, Sentdm::Internal::AnyHash)
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
          request_options: Sentdm::RequestOptions::OrHash
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
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
