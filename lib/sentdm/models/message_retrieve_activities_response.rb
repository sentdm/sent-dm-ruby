# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#retrieve_activities
    class MessageRetrieveActivitiesResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [Sentdm::Models::MessageRetrieveActivitiesResponse::Data, nil]
      optional :data, -> { Sentdm::Models::MessageRetrieveActivitiesResponse::Data }, nil?: true

      # @!attribute error
      #   Error details (null if successful)
      #
      #   @return [Sentdm::Models::APIError, nil]
      optional :error, -> { Sentdm::APIError }, nil?: true

      # @!attribute meta
      #   Metadata about the request and response
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
      #   @param data [Sentdm::Models::MessageRetrieveActivitiesResponse::Data, nil] The response data (null if error)
      #
      #   @param error [Sentdm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [Sentdm::Models::APIMeta] Metadata about the request and response
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

        # @!method initialize(activities: nil, message_id: nil)
        #   The response data (null if error)
        #
        #   @param activities [Array<Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity>] List of activity events ordered by most recent first
        #
        #   @param message_id [String] The message ID these activities belong to

        class Activity < Sentdm::Internal::Type::BaseModel
          # @!attribute content
          #   Additional content or payload for the activity (e.g., channel response)
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!attribute description
          #   Human-readable description of the activity
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute status
          #   Activity status (e.g., ACCEPTED, PROCESSED, SENT, DELIVERED, FAILED)
          #
          #   @return [String, nil]
          optional :status, String

          # @!attribute timestamp
          #   When this activity occurred
          #
          #   @return [Time, nil]
          optional :timestamp, Time

          # @!method initialize(content: nil, description: nil, status: nil, timestamp: nil)
          #   A single message activity event for v3 API
          #
          #   @param content [String, nil] Additional content or payload for the activity (e.g., channel response)
          #
          #   @param description [String] Human-readable description of the activity
          #
          #   @param status [String] Activity status (e.g., ACCEPTED, PROCESSED, SENT, DELIVERED, FAILED)
          #
          #   @param timestamp [Time] When this activity occurred
        end
      end
    end
  end
end
