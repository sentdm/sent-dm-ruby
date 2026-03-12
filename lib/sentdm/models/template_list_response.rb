# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#list
    class TemplateListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Paginated list of templates
      #
      #   @return [Sentdm::Models::TemplateListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::TemplateListResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ErrorDetail, nil]
      optional :error, -> { Sentdm::ErrorDetail }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::APIMeta, nil]
      optional :meta, -> { Sentdm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::TemplateListResponse::Data, nil] Paginated list of templates
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::TemplateListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!attribute templates
        #   List of templates
        #
        #   @return [Array<Sentdm::Models::Template>, nil]
        optional :templates, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Template] }

        # @!method initialize(pagination: nil, templates: nil)
        #   Paginated list of templates
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
        #
        #   @param templates [Array<Sentdm::Models::Template>] List of templates
      end
    end
  end
end
