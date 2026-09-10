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

      # Optional channel filter (sms, whatsapp)
      sig { returns(T.nilable(String)) }
      attr_accessor :channel

      # Page number (1-indexed)
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Number of items per page
      sig { returns(T.nilable(Integer)) }
      attr_reader :page_size

      sig { params(page_size: Integer).void }
      attr_writer :page_size

      # Optional phone number filter (alternative to list view)
      sig { returns(T.nilable(String)) }
      attr_accessor :phone

      # Optional search term for filtering contacts
      sig { returns(T.nilable(String)) }
      attr_accessor :search

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          channel: T.nilable(String),
          page: Integer,
          page_size: Integer,
          phone: T.nilable(String),
          search: T.nilable(String),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Optional channel filter (sms, whatsapp)
        channel: nil,
        # Page number (1-indexed)
        page: nil,
        # Number of items per page
        page_size: nil,
        # Optional phone number filter (alternative to list view)
        phone: nil,
        # Optional search term for filtering contacts
        search: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            channel: T.nilable(String),
            page: Integer,
            page_size: Integer,
            phone: T.nilable(String),
            search: T.nilable(String),
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
