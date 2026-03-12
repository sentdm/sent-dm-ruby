# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#list
    class ProfileListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   List of profiles response
      #
      #   @return [Sentdm::Models::ProfileListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ProfileListResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::APIError, nil]
      optional :error, -> { Sentdm::APIError }, nil?: true

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
      #   @param data [Sentdm::Models::ProfileListResponse::Data, nil] List of profiles response
      #
      #   @param error [Sentdm::Models::APIError, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ProfileListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute profiles
        #   List of profiles in the organization
        #
        #   @return [Array<Sentdm::Models::ProfileDetail>, nil]
        optional :profiles, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ProfileDetail] }

        # @!method initialize(profiles: nil)
        #   List of profiles response
        #
        #   @param profiles [Array<Sentdm::Models::ProfileDetail>] List of profiles in the organization
      end
    end
  end
end
