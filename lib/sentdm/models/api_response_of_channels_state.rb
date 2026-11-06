# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Channels#list
    class APIResponseOfChannelsState < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The channels a profile sends on. SMS is a list because a profile can send in
      #   several markets; WhatsApp and RCS are single, because a profile has one business
      #   account and one agent.
      #
      #   @return [Sentdm::Models::ChannelsState, nil]
      optional :data, -> { Sentdm::ChannelsState }, nil?: true

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
      #   {Sentdm::Models::APIResponseOfChannelsState} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ChannelsState, nil] The channels a profile sends on. SMS is a list because a profile can send in sev
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
