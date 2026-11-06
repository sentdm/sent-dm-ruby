# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#resend
    class MessageSendResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The result of a multi-recipient send.
      #
      #   Declared here rather than in the service layer. POST /v3/messages used to
      #   publish MessageSendResult — a type in Common.Services.Messaging.Contracts — so
      #   the public contract was whatever the send service happened to return, and
      #   changing that service for an internal reason changed the API. The service keeps
      #   its result; this is what a caller sees, and the mapping between them is a
      #   decision the endpoint makes.
      #
      #   The shape of an immediate send: it never has a scheduled_at key. A send that
      #   carried scheduled_at is a ScheduledSendMessageResponse, and the endpoint decides
      #   which of the two to answer with. From always returns this type.
      #
      #   @return [Sentdm::Models::MessageSendResult, nil]
      optional :data, -> { Sentdm::MessageSendResult }, nil?: true

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
      #   {Sentdm::Models::MessageSendResponse} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::MessageSendResult, nil] The result of a multi-recipient send.
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
