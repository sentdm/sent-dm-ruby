# typed: strong

module Sentdm
  module Models
    class TemplatesList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::TemplatesList, Sentdm::Internal::AnyHash) }

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # The templates on this page.
      sig { returns(T.nilable(T::Array[Sentdm::Template])) }
      attr_reader :templates

      sig { params(templates: T::Array[Sentdm::Template::OrHash]).void }
      attr_writer :templates

      # A paginated list of templates.
      sig do
        params(
          pagination: Sentdm::PaginationMeta::OrHash,
          templates: T::Array[Sentdm::Template::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination metadata for list responses
        pagination: nil,
        # The templates on this page.
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
