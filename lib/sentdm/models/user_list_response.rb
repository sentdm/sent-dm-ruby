# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Users#list
    class UserListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The users in the organization.
      #
      #   @return [Sentdm::Models::UserListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::UserListResponse::Data }, nil?: true

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
      #   @param data [Sentdm::Models::UserListResponse::Data, nil] The users in the organization.
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::UserListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!attribute users
        #   The users on this page.
        #
        #   @return [Array<Sentdm::Models::UserResponse>, nil]
        optional :users, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::UserResponse] }

        # @!method initialize(pagination: nil, users: nil)
        #   The users in the organization.
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
        #
        #   @param users [Array<Sentdm::Models::UserResponse>] The users on this page.
      end
    end
  end
end
