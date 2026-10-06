# frozen_string_literal: true

module Sentdm
  module Models
    class CallParty < Sentdm::Internal::Type::BaseModel
      # @!attribute kind
      #   user for one of your app users, number for a phone number, conference for a
      #   room, anonymous for a caller who withheld their number
      #
      #   @return [String, nil]
      optional :kind, String

      # @!attribute value
      #   The app user's identity, the phone number in E.164 format, or the room name.
      #   Null when the kind is anonymous
      #
      #   @return [String, nil]
      optional :value, String, nil?: true

      # @!method initialize(kind: nil, value: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::CallParty} for more details.
      #
      #   One end of a call
      #
      #   @param kind [String] user for one of your app users, number for a phone number, conference for a room
      #
      #   @param value [String, nil] The app user's identity, the phone number in E.164 format, or the room name. Nul
    end
  end
end
