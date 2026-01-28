# typed: strong

module Sentdm
  module Models
    class TemplateListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateListParams, Sentdm::Internal::AnyHash)
        end

      # The page number (zero-indexed). Default is 0.
      sig { returns(Integer) }
      attr_accessor :page

      # The number of items per page (1-1000). Default is 100.
      sig { returns(Integer) }
      attr_accessor :page_size

      # Optional filter by template category (e.g., MARKETING, UTILITY, AUTHENTICATION)
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # Optional search term to filter templates by name or content
      sig { returns(T.nilable(String)) }
      attr_accessor :search

      # Optional filter by template status (e.g., APPROVED, PENDING, REJECTED, DRAFT)
      sig { returns(T.nilable(String)) }
      attr_accessor :status

      sig do
        params(
          page: Integer,
          page_size: Integer,
          category: T.nilable(String),
          search: T.nilable(String),
          status: T.nilable(String),
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The page number (zero-indexed). Default is 0.
        page:,
        # The number of items per page (1-1000). Default is 100.
        page_size:,
        # Optional filter by template category (e.g., MARKETING, UTILITY, AUTHENTICATION)
        category: nil,
        # Optional search term to filter templates by name or content
        search: nil,
        # Optional filter by template status (e.g., APPROVED, PENDING, REJECTED, DRAFT)
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            category: T.nilable(String),
            search: T.nilable(String),
            status: T.nilable(String),
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
