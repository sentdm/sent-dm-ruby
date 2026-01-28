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

      # The page number (zero-indexed). Default is 0.
      sig { returns(Integer) }
      attr_accessor :page

      # The number of items per page. Default is 20.
      sig { returns(Integer) }
      attr_accessor :page_size

      sig do
        params(
          page: Integer,
          page_size: Integer,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The page number (zero-indexed). Default is 0.
        page:,
        # The number of items per page. Default is 20.
        page_size:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
