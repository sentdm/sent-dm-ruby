# frozen_string_literal: true

module Sentdm
  module Models
    class MessageChannelOptions < Sentdm::Internal::Type::BaseModel
      # @!attribute country
      #   Recipient country this entry is meant for (ISO 3166-1 alpha-2, e.g. US).
      #   Optional. Accepted and stored, not acted on yet.
      #
      #   @return [String, nil]
      optional :country, String, nil?: true

      # @!attribute from
      #   Sender numbers in E.164. Each must be an active sender on your account for this
      #   channel. That is account state rather than request shape, so it is decided per
      #   message: the request is accepted with 202 and a message naming an unusable
      #   number is recorded BLOCKED with error code BUSINESS_029.
      #
      #   @return [Array<String>, nil]
      optional :from, Sentdm::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute strategy
      #   How to pick a number from From, e.g. sticky or geo. Optional. Accepted and
      #   stored, not acted on yet.
      #
      #   @return [String, nil]
      optional :strategy, String, nil?: true

      # @!method initialize(country: nil, from: nil, strategy: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageChannelOptions} for more details.
      #
      #   One entry of a channel's list in Channels, e.g. {"country": "US", "from":
      #   ["+15559990002", "+15559990003"], "strategy": "sticky"}.
      #
      #   @param country [String, nil] Recipient country this entry is meant for (ISO 3166-1 alpha-2, e.g. US). Optiona
      #
      #   @param from [Array<String>, nil] Sender numbers in E.164. Each must be an active sender on your account for this
      #
      #   @param strategy [String, nil] How to pick a number from From, e.g. sticky or geo. Optional. Accepted
    end
  end
end
