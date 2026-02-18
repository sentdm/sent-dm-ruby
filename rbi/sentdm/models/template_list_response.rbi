# typed: strong

module Sentdm
  module Models
    class TemplateListResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::TemplateListResponse, Sentdm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(Sentdm::Models::TemplateListResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::TemplateListResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error details (null if successful)
      sig { returns(T.nilable(Sentdm::APIError)) }
      attr_reader :error

      sig { params(error: T.nilable(Sentdm::APIError::OrHash)).void }
      attr_writer :error

      # Metadata about the request and response
      sig { returns(T.nilable(Sentdm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: Sentdm::APIMeta::OrHash).void }
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
          error: T.nilable(Sentdm::APIError::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The response data (null if error)
        data: nil,
        # Error details (null if successful)
        error: nil,
        # Metadata about the request and response
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(Sentdm::Models::TemplateListResponse::Data),
            error: T.nilable(Sentdm::APIError),
            meta: Sentdm::APIMeta,
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

        # Pagination metadata
        sig { returns(T.nilable(Sentdm::PaginationMeta)) }
        attr_reader :pagination

        sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
        attr_writer :pagination

        # List of templates
        sig { returns(T.nilable(T::Array[Sentdm::Template])) }
        attr_reader :templates

        sig { params(templates: T::Array[Sentdm::Template::OrHash]).void }
        attr_writer :templates

        # The response data (null if error)
        sig do
          params(
            pagination: Sentdm::PaginationMeta::OrHash,
            templates: T::Array[Sentdm::Template::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # Pagination metadata
          pagination: nil,
          # List of templates
          templates: nil
        )
        end

        sig do
          override.returns(
            {
              pagination: Sentdm::PaginationMeta,
              templates: T::Array[Sentdm::Template]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
