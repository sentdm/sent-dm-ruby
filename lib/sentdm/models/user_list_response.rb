# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Users#list
    class UserListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   List of users response
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
      #   @param data [Sentdm::Models::UserListResponse::Data, nil] List of users response
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::UserListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute users
        #   List of users in the organization
        #
        #   @return [Array<Sentdm::Models::UserResponse>, nil]
        optional :users, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::UserResponse] }

        # @!method initialize(users: nil)
        #   List of users response
        #
        #   @param users [Array<Sentdm::Models::UserResponse>] List of users in the organization
      end
    end
  end
end
