# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::Whatsapp#create
      class APIResponseOfWhatsappChannel < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   The profile's WhatsApp account. Its status is Meta's verification state.
        #
        #   @return [Sentdm::Models::Channels::WhatsappChannel, nil]
        optional :data, -> { Sentdm::Channels::WhatsappChannel }, nil?: true

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
        #   @param data [Sentdm::Models::Channels::WhatsappChannel, nil] The profile's WhatsApp account. Its status is Meta's verification state.
        #
        #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
        #
        #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
        #
        #   @param success [Boolean] Indicates whether the request was successful
      end
    end

    APIResponseOfWhatsappChannel = Channels::APIResponseOfWhatsappChannel
  end
end
