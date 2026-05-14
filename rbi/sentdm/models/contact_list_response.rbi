# typed: strong

module Sentdm
  module Models
    class ContactListResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::ContactListResponse, Sentdm::Internal::AnyHash)
        end

      # Paginated list of contacts response
      sig { returns(T.nilable(Sentdm::Models::ContactListResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::ContactListResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::Models::ContactListResponse::Error)) }
      attr_reader :error

      sig do
        params(
          error: T.nilable(Sentdm::Models::ContactListResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::Models::ContactListResponse::Meta)) }
      attr_reader :meta

      sig do
        params(meta: Sentdm::Models::ContactListResponse::Meta::OrHash).void
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
          data: T.nilable(Sentdm::Models::ContactListResponse::Data::OrHash),
          error: T.nilable(Sentdm::Models::ContactListResponse::Error::OrHash),
          meta: Sentdm::Models::ContactListResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Paginated list of contacts response
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
            data: T.nilable(Sentdm::Models::ContactListResponse::Data),
            error: T.nilable(Sentdm::Models::ContactListResponse::Error),
            meta: Sentdm::Models::ContactListResponse::Meta,
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
              Sentdm::Models::ContactListResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # List of contacts
        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::Models::ContactListResponse::Data::Contact]
            )
          )
        end
        attr_reader :contacts

        sig do
          params(
            contacts:
              T::Array[
                Sentdm::Models::ContactListResponse::Data::Contact::OrHash
              ]
          ).void
        end
        attr_writer :contacts

        # Pagination metadata for list responses
        sig do
          returns(
            T.nilable(Sentdm::Models::ContactListResponse::Data::Pagination)
          )
        end
        attr_reader :pagination

        sig do
          params(
            pagination:
              Sentdm::Models::ContactListResponse::Data::Pagination::OrHash
          ).void
        end
        attr_writer :pagination

        # Paginated list of contacts response
        sig do
          params(
            contacts:
              T::Array[
                Sentdm::Models::ContactListResponse::Data::Contact::OrHash
              ],
            pagination:
              Sentdm::Models::ContactListResponse::Data::Pagination::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # List of contacts
          contacts: nil,
          # Pagination metadata for list responses
          pagination: nil
        )
        end

        sig do
          override.returns(
            {
              contacts:
                T::Array[Sentdm::Models::ContactListResponse::Data::Contact],
              pagination: Sentdm::Models::ContactListResponse::Data::Pagination
            }
          )
        end
        def to_hash
        end

        class Contact < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::ContactListResponse::Data::Contact,
                Sentdm::Internal::AnyHash
              )
            end

          # Unique identifier for the contact
          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          # Comma-separated list of available messaging channels (e.g., "sms,whatsapp")
          sig { returns(T.nilable(String)) }
          attr_reader :available_channels

          sig { params(available_channels: String).void }
          attr_writer :available_channels

          # Country calling code (e.g., 1 for US/Canada)
          sig { returns(T.nilable(String)) }
          attr_reader :country_code

          sig { params(country_code: String).void }
          attr_writer :country_code

          # When the contact was created
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          # Default messaging channel to use (e.g., "sms" or "whatsapp")
          sig { returns(T.nilable(String)) }
          attr_reader :default_channel

          sig { params(default_channel: String).void }
          attr_writer :default_channel

          # Phone number in E.164 format (e.g., +1234567890)
          sig { returns(T.nilable(String)) }
          attr_reader :format_e164

          sig { params(format_e164: String).void }
          attr_writer :format_e164

          # Phone number in international format (e.g., +1 234-567-890)
          sig { returns(T.nilable(String)) }
          attr_reader :format_international

          sig { params(format_international: String).void }
          attr_writer :format_international

          # Phone number in national format (e.g., (234) 567-890)
          sig { returns(T.nilable(String)) }
          attr_reader :format_national

          sig { params(format_national: String).void }
          attr_writer :format_national

          # Phone number in RFC 3966 format (e.g., tel:+1-234-567-890)
          sig { returns(T.nilable(String)) }
          attr_reader :format_rfc

          sig { params(format_rfc: String).void }
          attr_writer :format_rfc

          # Whether this is an inherited contact (read-only)
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :is_inherited

          sig { params(is_inherited: T::Boolean).void }
          attr_writer :is_inherited

          # Whether the contact has opted out of messaging. Single source of truth — opt-out
          # is per-contact, not per-channel.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :opt_out

          sig { params(opt_out: T::Boolean).void }
          attr_writer :opt_out

          # Phone number in original format
          sig { returns(T.nilable(String)) }
          attr_reader :phone_number

          sig { params(phone_number: String).void }
          attr_writer :phone_number

          # ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
          sig { returns(T.nilable(String)) }
          attr_reader :region_code

          sig { params(region_code: String).void }
          attr_writer :region_code

          # When the contact was last updated
          sig { returns(T.nilable(Time)) }
          attr_accessor :updated_at

          # Contact response for v3 API Uses snake_case for JSON property names
          sig do
            params(
              id: String,
              available_channels: String,
              country_code: String,
              created_at: Time,
              default_channel: String,
              format_e164: String,
              format_international: String,
              format_national: String,
              format_rfc: String,
              is_inherited: T::Boolean,
              opt_out: T::Boolean,
              phone_number: String,
              region_code: String,
              updated_at: T.nilable(Time)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for the contact
            id: nil,
            # Comma-separated list of available messaging channels (e.g., "sms,whatsapp")
            available_channels: nil,
            # Country calling code (e.g., 1 for US/Canada)
            country_code: nil,
            # When the contact was created
            created_at: nil,
            # Default messaging channel to use (e.g., "sms" or "whatsapp")
            default_channel: nil,
            # Phone number in E.164 format (e.g., +1234567890)
            format_e164: nil,
            # Phone number in international format (e.g., +1 234-567-890)
            format_international: nil,
            # Phone number in national format (e.g., (234) 567-890)
            format_national: nil,
            # Phone number in RFC 3966 format (e.g., tel:+1-234-567-890)
            format_rfc: nil,
            # Whether this is an inherited contact (read-only)
            is_inherited: nil,
            # Whether the contact has opted out of messaging. Single source of truth — opt-out
            # is per-contact, not per-channel.
            opt_out: nil,
            # Phone number in original format
            phone_number: nil,
            # ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
            region_code: nil,
            # When the contact was last updated
            updated_at: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                available_channels: String,
                country_code: String,
                created_at: Time,
                default_channel: String,
                format_e164: String,
                format_international: String,
                format_national: String,
                format_rfc: String,
                is_inherited: T::Boolean,
                opt_out: T::Boolean,
                phone_number: String,
                region_code: String,
                updated_at: T.nilable(Time)
              }
            )
          end
          def to_hash
          end
        end

        class Pagination < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::ContactListResponse::Data::Pagination,
                Sentdm::Internal::AnyHash
              )
            end

          # Cursor-based pagination pointers
          sig do
            returns(
              T.nilable(
                Sentdm::Models::ContactListResponse::Data::Pagination::Cursors
              )
            )
          end
          attr_reader :cursors

          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::ContactListResponse::Data::Pagination::Cursors::OrHash
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
                  Sentdm::Models::ContactListResponse::Data::Pagination::Cursors::OrHash
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
                    Sentdm::Models::ContactListResponse::Data::Pagination::Cursors
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
                  Sentdm::Models::ContactListResponse::Data::Pagination::Cursors,
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
      end

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::ContactListResponse::Error,
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
              Sentdm::Models::ContactListResponse::Meta,
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
