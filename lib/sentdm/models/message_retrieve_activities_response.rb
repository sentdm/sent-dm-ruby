# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#retrieve_activities
    class MessageRetrieveActivitiesResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Response for GET /messages/{id}/activities
      #
      #   @return [Sentdm::Models::MessageRetrieveActivitiesResponse::Data, nil]
      optional :data, -> { Sentdm::Models::MessageRetrieveActivitiesResponse::Data }, nil?: true

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
      #   @param data [Sentdm::Models::MessageRetrieveActivitiesResponse::Data, nil] Response for GET /messages/{id}/activities
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::MessageRetrieveActivitiesResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute activities
        #   List of activity events ordered by most recent first
        #
        #   @return [Array<Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity>, nil]
        optional :activities,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity] }

        # @!attribute message_id
        #   The message ID these activities belong to
        #
        #   @return [String, nil]
        optional :message_id, String

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!method initialize(activities: nil, message_id: nil, pagination: nil)
        #   Response for GET /messages/{id}/activities
        #
        #   @param activities [Array<Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity>] List of activity events ordered by most recent first
        #
        #   @param message_id [String] The message ID these activities belong to
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses

        class Activity < Sentdm::Internal::Type::BaseModel
          # @!attribute active_contact_price
          #   Active contact markup applied on top of the channel cost, formatted to 4 decimal
          #   places.
          #
          #   @return [String, nil]
          optional :active_contact_price, String, nil?: true

          # @!attribute description
          #   Human-readable description of the activity
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute from
          #   Sender phone number for this activity (the customer's sending number for
          #   outbound, the external sender for inbound). Null when not reported by the
          #   provider.
          #
          #   @return [String, nil]
          optional :from, String, nil?: true

          # @!attribute price
          #   Channel cost for this activity (e.g., SMS/WhatsApp provider cost), formatted to
          #   4 decimal places.
          #
          #   @return [String, nil]
          optional :price, String, nil?: true

          # @!attribute reason
          #   A human-readable sentence for reason_code, for example "The recipient is not
          #   registered on this channel" Omitted whenever reason_code is.
          #
          #   @return [String, nil]
          optional :reason, String, nil?: true

          # @!attribute reason_code
          #   Why the message reached this status, as a stable platform code such as
          #   DELIVERY_007 or BUSINESS_003. Present on FAILED, FILTERED and BLOCKED
          #   activities; omitted on every status that needs no explanation. Switch on this
          #   rather than on reason: the code is stable, the wording may be improved. Same
          #   wire name and vocabulary as on the message and the webhook.
          #
          #   @return [String, nil]
          optional :reason_code, String, nil?: true

          # @!attribute scheduled_at
          #   SCHEDULED activities only: when the held message will be released for delivery,
          #   in UTC. Same wire name as on the send response, the message and the webhook.
          #   Omitted on every other activity. A message that quiet hours moved at release has
          #   two SCHEDULED entries, each carrying the instant as it stood at that moment.
          #
          #   @return [Time, nil]
          optional :scheduled_at, Time, nil?: true

          # @!attribute status
          #   Activity status. Outbound: QUEUED, PROCESSED, ROUTED, SCHEDULED, SENT,
          #   DELIVERED, READ, FAILED. Inbound (from contact): RECEIVED (terminal).
          #
          #   @return [String, nil]
          optional :status, String

          # @!attribute timestamp
          #   When this activity occurred
          #
          #   @return [Time, nil]
          optional :timestamp, Time

          # @!method initialize(active_contact_price: nil, description: nil, from: nil, price: nil, reason: nil, reason_code: nil, scheduled_at: nil, status: nil, timestamp: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity} for more
          #   details.
          #
          #   A single message activity event for v3 API.
          #
          #   The activity list mixes statuses, so unlike a message it is one shape rather
          #   than two: a SCHEDULED entry carries scheduled_at, and every other entry has no
          #   such key.
          #
          #   @param active_contact_price [String, nil] Active contact markup applied on top of the channel cost, formatted to 4 decimal
          #
          #   @param description [String] Human-readable description of the activity
          #
          #   @param from [String, nil] Sender phone number for this activity (the customer's sending number for outboun
          #
          #   @param price [String, nil] Channel cost for this activity (e.g., SMS/WhatsApp provider cost), formatted to
          #
          #   @param reason [String, nil] A human-readable sentence for reason_code, for example "The recipient is not reg
          #
          #   @param reason_code [String, nil] Why the message reached this status, as a stable platform code such as
          #   DELIVERY\_
          #
          #   @param scheduled_at [Time, nil] SCHEDULED activities only: when the held message will be released for delivery,
          #
          #   @param status [String] Activity status. Outbound: QUEUED, PROCESSED, ROUTED, SCHEDULED, SENT, DELIVERED
          #
          #   @param timestamp [Time] When this activity occurred
        end
      end
    end
  end
end
