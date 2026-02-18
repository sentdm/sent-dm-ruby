# typed: strong

module SentDm
  module Models
    class TemplateListParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::TemplateListParams, SentDm::Internal::AnyHash)
        end

      # Page number (1-indexed)
      sig { returns(Integer) }
      attr_accessor :page

      sig { returns(Integer) }
      attr_accessor :page_size

      # Optional category filter: MARKETING, UTILITY, AUTHENTICATION
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # Optional search term for filtering templates
      sig { returns(T.nilable(String)) }
      attr_accessor :search

      # Optional status filter: APPROVED, PENDING, REJECTED
      sig { returns(T.nilable(String)) }
      attr_accessor :status

      sig do
        params(
          page: Integer,
          page_size: Integer,
          category: T.nilable(String),
          search: T.nilable(String),
          status: T.nilable(String),
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Page number (1-indexed)
        page:,
        page_size:,
        # Optional category filter: MARKETING, UTILITY, AUTHENTICATION
        category: nil,
        # Optional search term for filtering templates
        search: nil,
        # Optional status filter: APPROVED, PENDING, REJECTED
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
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
