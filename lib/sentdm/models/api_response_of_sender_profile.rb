# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::SenderProfiles#create
    class APIResponseOfSenderProfile < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   A sender profile as the API reports it — the same document the create call
      #   accepts, plus the read-only facts it cannot: each market's status and what it
      #   still owes.
      #
      #   No status at the profile, brand or campaign level. Brand and campaign are
      #   identity, and identity has no lifecycle. What has one is the registration of a
      #   sender in a market, and the approval of a channel — so status lives there, where
      #   it says which specific thing is blocked rather than flattening several answers
      #   into one.
      #
      #   @return [Sentdm::Models::SenderProfile, nil]
      optional :data, -> { Sentdm::SenderProfile }, nil?: true

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
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::APIResponseOfSenderProfile} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::SenderProfile, nil] A sender profile as the API reports it — the same document the create call accep
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
