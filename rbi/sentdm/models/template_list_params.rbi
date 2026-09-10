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

      # Optional category filter: MARKETING, UTILITY, AUTHENTICATION
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # Accepted and ignored. It used to filter on the welcome-playground marker inside
      # a template's LOB details; that filter is gone and nothing reads this value, so
      # sending it neither narrows nor widens the result. Retained only so a client
      # still passing is_welcome_playground keeps binding instead of the request shape
      # changing under it.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_welcome_playground

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

      # Optional search term for filtering templates
      sig { returns(T.nilable(String)) }
      attr_accessor :search

      # Optional status filter: APPROVED, PENDING, REJECTED
      sig { returns(T.nilable(String)) }
      attr_accessor :status

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          category: T.nilable(String),
          is_welcome_playground: T.nilable(T::Boolean),
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          status: T.nilable(String),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Optional category filter: MARKETING, UTILITY, AUTHENTICATION
        category: nil,
        # Accepted and ignored. It used to filter on the welcome-playground marker inside
        # a template's LOB details; that filter is gone and nothing reads this value, so
        # sending it neither narrows nor widens the result. Retained only so a client
        # still passing is_welcome_playground keeps binding instead of the request shape
        # changing under it.
        is_welcome_playground: nil,
        # Page number (1-indexed)
        page: nil,
        # Number of items per page
        page_size: nil,
        # Optional search term for filtering templates
        search: nil,
        # Optional status filter: APPROVED, PENDING, REJECTED
        status: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            category: T.nilable(String),
            is_welcome_playground: T.nilable(T::Boolean),
            page: Integer,
            page_size: Integer,
            search: T.nilable(String),
            status: T.nilable(String),
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
