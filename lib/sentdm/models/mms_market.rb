# frozen_string_literal: true

module Sentdm
  module Models
    class MmsMarket < Sentdm::Internal::Type::BaseModel
      # @!attribute country
      #   ISO-3166 alpha-2 of the market.
      #
      #   @return [String, nil]
      optional :country, String, nil?: true

      # @!attribute number_type
      #   The sender type the market sends from, mirroring the SMS sender.
      #
      #   @return [String, nil]
      optional :number_type, String, nil?: true

      # @!attribute sender_value
      #   The sending number. Null while the market is still being provisioned.
      #
      #   @return [String, nil]
      optional :sender_value, String, nil?: true

      # @!attribute status
      #   Where this market's MMS sender stands. Read-only.
      #
      #   @return [String, nil]
      optional :status, String, nil?: true

      # @!method initialize(country: nil, number_type: nil, sender_value: nil, status: nil)
      #   One market the profile can send MMS in.
      #
      #   Deliberately not SmsMarketState: an MMS market carries no compliance of its own.
      #   It is the same number, carrier and registration as the SMS market on it in that
      #   country — MMS files nothing separately — so a compliance block here would always
      #   be null and would invite the question of what an MMS market owes. It owes what
      #   the SMS market owes, reported there.
      #
      #   @param country [String, nil] ISO-3166 alpha-2 of the market.
      #
      #   @param number_type [String, nil] The sender type the market sends from, mirroring the SMS sender.
      #
      #   @param sender_value [String, nil] The sending number. Null while the market is still being provisioned.
      #
      #   @param status [String, nil] Where this market's MMS sender stands. Read-only.
    end
  end
end
