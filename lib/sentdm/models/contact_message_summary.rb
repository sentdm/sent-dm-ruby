# frozen_string_literal: true

module Sentdm
  module Models
    class ContactMessageSummary < Sentdm::Internal::Type::BaseModel
      # @!attribute channel_scores
      #
      #   @return [Array<Sentdm::Models::ChannelScore>, nil]
      optional :channel_scores, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ChannelScore] }

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
      #   @param channel_scores [Array<Sentdm::Models::ChannelScore>]
      #   @param channels_used [Array<String>]
      #   @param contact_id [String]
      #   @param first_message_at [Time, nil]
      #   @param last_message_at [Time, nil]
      #   @param message_count [Integer]
    end
  end
end
