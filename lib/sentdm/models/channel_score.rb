# frozen_string_literal: true

module Sentdm
  module Models
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
      #   {Sentdm::Models::ChannelScore} for more details.
      #
      #   @param channel [String]
      #
      #   @param fail_score [Integer] Percentage (0-100) of messages on this channel that ended in FAILED.
      #
      #   @param success_score [Integer] Percentage (0-100) of messages on this channel that reached a successful termina
    end
  end
end
