# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#retrieve_message_summary
    class ContactRetrieveMessageSummaryResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ContactRetrieveMessageSummaryResponse::Error, nil]
      optional :error, -> { Sentdm::Models::ContactRetrieveMessageSummaryResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::ContactRetrieveMessageSummaryResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::ContactRetrieveMessageSummaryResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data, nil] The response data (null if error)
      #
      #   @param error [Sentdm::Models::ContactRetrieveMessageSummaryResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::ContactRetrieveMessageSummaryResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ContactRetrieveMessageSummaryResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute channel_scores
        #
        #   @return [Array<Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::ChannelScore>, nil]
        optional :channel_scores,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::ChannelScore] }

        # @!attribute channels_used
        #
        #   @return [Array<String>, nil]
        optional :channels_used, Sentdm::Internal::Type::ArrayOf[String]

        # @!attribute contact_id
        #
        #   @return [String, nil]
        optional :contact_id, String

        # @!attribute first_message_at
        #
        #   @return [Time, nil]
        optional :first_message_at, Time, nil?: true

        # @!attribute last_message_at
        #
        #   @return [Time, nil]
        optional :last_message_at, Time, nil?: true

        # @!attribute message_count
        #
        #   @return [Integer, nil]
        optional :message_count, Integer

        # @!method initialize(channel_scores: nil, channels_used: nil, contact_id: nil, first_message_at: nil, last_message_at: nil, message_count: nil)
        #   The response data (null if error)
        #
        #   @param channel_scores [Array<Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::ChannelScore>]
        #   @param channels_used [Array<String>]
        #   @param contact_id [String]
        #   @param first_message_at [Time, nil]
        #   @param last_message_at [Time, nil]
        #   @param message_count [Integer]

        class ChannelScore < Sentdm::Internal::Type::BaseModel
          # @!attribute channel
          #
          #   @return [String, nil]
          optional :channel, String

          # @!attribute fail_score
          #   Percentage (0-100) of messages on this channel that ended in FAILED.
          #
          #   @return [Integer, nil]
          optional :fail_score, Integer

          # @!attribute success_score
          #   Percentage (0-100) of messages on this channel that reached a successful
          #   terminal state: SENT/DELIVERED/READ for outbound, RECEIVED for inbound.
          #
          #   @return [Integer, nil]
          optional :success_score, Integer

          # @!method initialize(channel: nil, fail_score: nil, success_score: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::ChannelScore} for
          #   more details.
          #
          #   @param channel [String]
          #
          #   @param fail_score [Integer] Percentage (0-100) of messages on this channel that ended in FAILED.
          #
          #   @param success_score [Integer] Percentage (0-100) of messages on this channel that reached a successful termina
        end
      end

      # @see Sentdm::Models::ContactRetrieveMessageSummaryResponse#error
      class Error < Sentdm::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @return [String, nil]
        optional :code, String

        # @!attribute details
        #   Additional validation error details (field-level errors)
        #
        #   @return [Hash{Symbol=>Array<String>}, nil]
        optional :details, Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]], nil?: true

        # @!attribute doc_url
        #   URL to documentation about this error
        #
        #   @return [String, nil]
        optional :doc_url, String, nil?: true

        # @!attribute message
        #   Human-readable error message
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(code: nil, details: nil, doc_url: nil, message: nil)
        #   Error information
        #
        #   @param code [String] Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @param details [Hash{Symbol=>Array<String>}, nil] Additional validation error details (field-level errors)
        #
        #   @param doc_url [String, nil] URL to documentation about this error
        #
        #   @param message [String] Human-readable error message
      end

      # @see Sentdm::Models::ContactRetrieveMessageSummaryResponse#meta
      class Meta < Sentdm::Internal::Type::BaseModel
        # @!attribute request_id
        #   Unique identifier for this request (for tracing and support)
        #
        #   @return [String, nil]
        optional :request_id, String

        # @!attribute timestamp
        #   Server timestamp when the response was generated
        #
        #   @return [Time, nil]
        optional :timestamp, Time

        # @!attribute version
        #   API version used for this request
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(request_id: nil, timestamp: nil, version: nil)
        #   Request and response metadata
        #
        #   @param request_id [String] Unique identifier for this request (for tracing and support)
        #
        #   @param timestamp [Time] Server timestamp when the response was generated
        #
        #   @param version [String] API version used for this request
      end
    end
  end
end
