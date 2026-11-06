# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#retrieve_status
    class APIResponseOfMessage < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Message response for v3 API — same shape as v2 with snake_case JSON conventions.
      #
      #   The shape of a message that was sent immediately: it never has a scheduled_at
      #   key. A message that is or was held for a later instant is a
      #   ScheduledMessageResponse, and the endpoint decides which of the two to answer
      #   with. From always returns this type.
      #
      #   @return [Sentdm::Models::Message, nil]
      optional :data, -> { Sentdm::Message }, nil?: true

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
      #   {Sentdm::Models::APIResponseOfMessage} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::Message, nil] Message response for v3 API — same shape as v2 with snake_case JSON conventions.
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
