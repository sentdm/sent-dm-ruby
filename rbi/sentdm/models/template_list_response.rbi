# typed: strong

module Sentdm
  module Models
    class TemplateListResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::TemplateListResponse, Sentdm::Internal::AnyHash)
        end

      # Paginated list of templates
      sig { returns(T.nilable(Sentdm::Models::TemplateListResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::TemplateListResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::Models::TemplateListResponse::Error)) }
      attr_reader :error

      sig do
        params(
          error: T.nilable(Sentdm::Models::TemplateListResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::Models::TemplateListResponse::Meta)) }
      attr_reader :meta

      sig do
        params(meta: Sentdm::Models::TemplateListResponse::Meta::OrHash).void
      end
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(Sentdm::Models::TemplateListResponse::Data::OrHash),
          error: T.nilable(Sentdm::Models::TemplateListResponse::Error::OrHash),
          meta: Sentdm::Models::TemplateListResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Paginated list of templates
        data: nil,
        # Error information
        error: nil,
        # Request and response metadata
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(Sentdm::Models::TemplateListResponse::Data),
            error: T.nilable(Sentdm::Models::TemplateListResponse::Error),
            meta: Sentdm::Models::TemplateListResponse::Meta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::TemplateListResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # Pagination metadata for list responses
        sig do
          returns(
            T.nilable(Sentdm::Models::TemplateListResponse::Data::Pagination)
          )
        end
        attr_reader :pagination

        sig do
          params(
            pagination:
              Sentdm::Models::TemplateListResponse::Data::Pagination::OrHash
          ).void
        end
        attr_writer :pagination

        # List of templates
        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::Models::TemplateListResponse::Data::Template]
            )
          )
        end
        attr_reader :templates

        sig do
          params(
            templates:
              T::Array[
                Sentdm::Models::TemplateListResponse::Data::Template::OrHash
              ]
          ).void
        end
        attr_writer :templates

        # Paginated list of templates
        sig do
          params(
            pagination:
              Sentdm::Models::TemplateListResponse::Data::Pagination::OrHash,
            templates:
              T::Array[
                Sentdm::Models::TemplateListResponse::Data::Template::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Pagination metadata for list responses
          pagination: nil,
          # List of templates
          templates: nil
        )
        end

        sig do
          override.returns(
            {
              pagination:
                Sentdm::Models::TemplateListResponse::Data::Pagination,
              templates:
                T::Array[Sentdm::Models::TemplateListResponse::Data::Template]
            }
          )
        end
        def to_hash
        end

        class Pagination < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::TemplateListResponse::Data::Pagination,
                Sentdm::Internal::AnyHash
              )
            end

          # Cursor-based pagination pointers
          sig do
            returns(
              T.nilable(
                Sentdm::Models::TemplateListResponse::Data::Pagination::Cursors
              )
            )
          end
          attr_reader :cursors

          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::TemplateListResponse::Data::Pagination::Cursors::OrHash
                )
            ).void
          end
          attr_writer :cursors

          # Whether there are more pages after this one
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :has_more

          sig { params(has_more: T::Boolean).void }
          attr_writer :has_more

          # Current page number (1-indexed)
          sig { returns(T.nilable(Integer)) }
          attr_reader :page

          sig { params(page: Integer).void }
          attr_writer :page

          # Number of items per page
          sig { returns(T.nilable(Integer)) }
          attr_reader :page_size

          sig { params(page_size: Integer).void }
          attr_writer :page_size

          # Total number of items across all pages
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_count

          sig { params(total_count: Integer).void }
          attr_writer :total_count

          # Total number of pages
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_pages

          sig { params(total_pages: Integer).void }
          attr_writer :total_pages

          # Pagination metadata for list responses
          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::TemplateListResponse::Data::Pagination::Cursors::OrHash
                ),
              has_more: T::Boolean,
              page: Integer,
              page_size: Integer,
              total_count: Integer,
              total_pages: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Cursor-based pagination pointers
            cursors: nil,
            # Whether there are more pages after this one
            has_more: nil,
            # Current page number (1-indexed)
            page: nil,
            # Number of items per page
            page_size: nil,
            # Total number of items across all pages
            total_count: nil,
            # Total number of pages
            total_pages: nil
          )
          end

          sig do
            override.returns(
              {
                cursors:
                  T.nilable(
                    Sentdm::Models::TemplateListResponse::Data::Pagination::Cursors
                  ),
                has_more: T::Boolean,
                page: Integer,
                page_size: Integer,
                total_count: Integer,
                total_pages: Integer
              }
            )
          end
          def to_hash
          end

          class Cursors < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::TemplateListResponse::Data::Pagination::Cursors,
                  Sentdm::Internal::AnyHash
                )
              end

            # Cursor to fetch the next page
            sig { returns(T.nilable(String)) }
            attr_accessor :after

            # Cursor to fetch the previous page
            sig { returns(T.nilable(String)) }
            attr_accessor :before

            # Cursor-based pagination pointers
            sig do
              params(
                after: T.nilable(String),
                before: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Cursor to fetch the next page
              after: nil,
              # Cursor to fetch the previous page
              before: nil
            )
            end

            sig do
              override.returns(
                { after: T.nilable(String), before: T.nilable(String) }
              )
            end
            def to_hash
            end
          end
        end

        class Template < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::TemplateListResponse::Data::Template,
                Sentdm::Internal::AnyHash
              )
            end

          # Unique template identifier
          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          # Template category: MARKETING, UTILITY, AUTHENTICATION
          sig { returns(T.nilable(String)) }
          attr_reader :category

          sig { params(category: String).void }
          attr_writer :category

          # Supported channels: sms, whatsapp
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :channels

          # When the template was created
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          # Whether the template is published and active
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :is_published

          sig { params(is_published: T::Boolean).void }
          attr_writer :is_published

          # Template language code (e.g., en_US)
          sig { returns(T.nilable(String)) }
          attr_reader :language

          sig { params(language: String).void }
          attr_writer :language

          # Template display name
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # Template status: APPROVED, PENDING, REJECTED
          sig { returns(T.nilable(String)) }
          attr_reader :status

          sig { params(status: String).void }
          attr_writer :status

          # When the template was last updated
          sig { returns(T.nilable(Time)) }
          attr_accessor :updated_at

          # Template variables for personalization
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :variables

          # Template response for v3 API
          sig do
            params(
              id: String,
              category: String,
              channels: T.nilable(T::Array[String]),
              created_at: Time,
              is_published: T::Boolean,
              language: String,
              name: String,
              status: String,
              updated_at: T.nilable(Time),
              variables: T.nilable(T::Array[String])
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique template identifier
            id: nil,
            # Template category: MARKETING, UTILITY, AUTHENTICATION
            category: nil,
            # Supported channels: sms, whatsapp
            channels: nil,
            # When the template was created
            created_at: nil,
            # Whether the template is published and active
            is_published: nil,
            # Template language code (e.g., en_US)
            language: nil,
            # Template display name
            name: nil,
            # Template status: APPROVED, PENDING, REJECTED
            status: nil,
            # When the template was last updated
            updated_at: nil,
            # Template variables for personalization
            variables: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                category: String,
                channels: T.nilable(T::Array[String]),
                created_at: Time,
                is_published: T::Boolean,
                language: String,
                name: String,
                status: String,
                updated_at: T.nilable(Time),
                variables: T.nilable(T::Array[String])
              }
            )
          end
          def to_hash
          end
        end
      end

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::TemplateListResponse::Error,
              Sentdm::Internal::AnyHash
            )
          end

        # Machine-readable error code (e.g., "RESOURCE_001")
        sig { returns(T.nilable(String)) }
        attr_reader :code

        sig { params(code: String).void }
        attr_writer :code

        # Additional validation error details (field-level errors)
        sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
        attr_accessor :details

        # URL to documentation about this error
        sig { returns(T.nilable(String)) }
        attr_accessor :doc_url

        # Human-readable error message
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Error information
        sig do
          params(
            code: String,
            details: T.nilable(T::Hash[Symbol, T::Array[String]]),
            doc_url: T.nilable(String),
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Machine-readable error code (e.g., "RESOURCE_001")
          code: nil,
          # Additional validation error details (field-level errors)
          details: nil,
          # URL to documentation about this error
          doc_url: nil,
          # Human-readable error message
          message: nil
        )
        end

        sig do
          override.returns(
            {
              code: String,
              details: T.nilable(T::Hash[Symbol, T::Array[String]]),
              doc_url: T.nilable(String),
              message: String
            }
          )
        end
        def to_hash
        end
      end

      class Meta < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::TemplateListResponse::Meta,
              Sentdm::Internal::AnyHash
            )
          end

        # Unique identifier for this request (for tracing and support)
        sig { returns(T.nilable(String)) }
        attr_reader :request_id

        sig { params(request_id: String).void }
        attr_writer :request_id

        # Server timestamp when the response was generated
        sig { returns(T.nilable(Time)) }
        attr_reader :timestamp

        sig { params(timestamp: Time).void }
        attr_writer :timestamp

        # API version used for this request
        sig { returns(T.nilable(String)) }
        attr_reader :version

        sig { params(version: String).void }
        attr_writer :version

        # Request and response metadata
        sig do
          params(request_id: String, timestamp: Time, version: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Unique identifier for this request (for tracing and support)
          request_id: nil,
          # Server timestamp when the response was generated
          timestamp: nil,
          # API version used for this request
          version: nil
        )
        end

        sig do
          override.returns(
            { request_id: String, timestamp: Time, version: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
