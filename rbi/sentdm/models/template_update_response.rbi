# typed: strong

module Sentdm
  module Models
    class TemplateUpdateResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::TemplateUpdateResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # Template response for v3 API
      sig { returns(T.nilable(Sentdm::Models::TemplateUpdateResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::TemplateUpdateResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::Models::TemplateUpdateResponse::Error)) }
      attr_reader :error

      sig do
        params(
          error:
            T.nilable(Sentdm::Models::TemplateUpdateResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::Models::TemplateUpdateResponse::Meta)) }
      attr_reader :meta

      sig do
        params(meta: Sentdm::Models::TemplateUpdateResponse::Meta::OrHash).void
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
          data: T.nilable(Sentdm::Models::TemplateUpdateResponse::Data::OrHash),
          error:
            T.nilable(Sentdm::Models::TemplateUpdateResponse::Error::OrHash),
          meta: Sentdm::Models::TemplateUpdateResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Template response for v3 API
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
            data: T.nilable(Sentdm::Models::TemplateUpdateResponse::Data),
            error: T.nilable(Sentdm::Models::TemplateUpdateResponse::Error),
            meta: Sentdm::Models::TemplateUpdateResponse::Meta,
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
              Sentdm::Models::TemplateUpdateResponse::Data,
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

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::TemplateUpdateResponse::Error,
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
              Sentdm::Models::TemplateUpdateResponse::Meta,
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
