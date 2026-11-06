# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::SMS#create
      class APIResponseOfSMSMarket < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   One SMS market the profile sends in — its sender, where that sender stands, and
        #   what the market wants.
        #
        #   A profile may send in several: it is a tenant, not a market. Each carries its
        #   own status, because a profile can be live in one country and mid-registration in
        #   another — and each carries what it still owes, rather than that being reported
        #   in a separate array a caller has to join on.
        #
        #   @return [Sentdm::Models::Channels::SMSMarket, nil]
        optional :data, -> { Sentdm::Channels::SMSMarket }, nil?: true

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
        #   {Sentdm::Models::Channels::APIResponseOfSMSMarket} for more details.
        #
        #   Standard API response envelope for all v3 endpoints
        #
        #   @param data [Sentdm::Models::Channels::SMSMarket, nil] One SMS market the profile sends in — its sender, where that sender stands, and
        #
        #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
        #
        #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
        #
        #   @param success [Boolean] Indicates whether the request was successful
      end
    end
  end
end
