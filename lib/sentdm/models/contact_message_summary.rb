# frozen_string_literal: true

module Sentdm
  module Models
    class ContactMessageSummary < Sentdm::Internal::Type::BaseModel
      # @!attribute channel_scores
      #
      #   @return [Array<Sentdm::Models::ContactMessageSummary::ChannelScore>, nil]
      optional :channel_scores,
               -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ContactMessageSummary::ChannelScore] }

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
      #   @param channel_scores [Array<Sentdm::Models::ContactMessageSummary::ChannelScore>]
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
        #   {Sentdm::Models::ContactMessageSummary::ChannelScore} for more details.
        #
        #   @param channel [String]
        #
        #   @param fail_score [Integer] Percentage (0-100) of messages on this channel that ended in FAILED.
        #
        #   @param success_score [Integer] Percentage (0-100) of messages on this channel that reached a successful termina
      end
    end
  end
end
