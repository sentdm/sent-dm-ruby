# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#list
    class ProfileListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The profiles in the organization.
      #
      #   @return [Sentdm::Models::ProfileListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ProfileListResponse::Data }, nil?: true

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
      #   @param data [Sentdm::Models::ProfileListResponse::Data, nil] The profiles in the organization.
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ProfileListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!attribute profiles
        #   The profiles on this page.
        #
        #   @return [Array<Sentdm::Models::ProfileDetail>, nil]
        optional :profiles, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ProfileDetail] }

        # @!method initialize(pagination: nil, profiles: nil)
        #   The profiles in the organization.
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
        #
        #   @param profiles [Array<Sentdm::Models::ProfileDetail>] The profiles on this page.
      end
    end
  end
end
