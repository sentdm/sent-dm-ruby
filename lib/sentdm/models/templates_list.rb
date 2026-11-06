# frozen_string_literal: true

module Sentdm
  module Models
    class TemplatesList < Sentdm::Internal::Type::BaseModel
      # @!attribute pagination
      #   Pagination metadata for list responses
      #
      #   @return [Sentdm::Models::PaginationMeta, nil]
      optional :pagination, -> { Sentdm::PaginationMeta }

      # @!attribute templates
      #   The templates on this page.
      #
      #   @return [Array<Sentdm::Models::Template>, nil]
      optional :templates, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Template] }

      # @!method initialize(pagination: nil, templates: nil)
      #   A paginated list of templates.
      #
      #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
      #
      #   @param templates [Array<Sentdm::Models::Template>] The templates on this page.
    end
  end
end
