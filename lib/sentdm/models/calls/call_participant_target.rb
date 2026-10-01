# frozen_string_literal: true

module Sentdm
  module Models
    module Calls
      class CallParticipantTarget < Sentdm::Internal::Type::BaseModel
        # @!attribute kind
        #   user for one of your app users, number for a phone number
        #
        #   @return [String, nil]
        optional :kind, String

        # @!attribute value
        #   The app user's identity, or the phone number in E.164 format
        #
        #   @return [String, nil]
        optional :value, String

        # @!method initialize(kind: nil, value: nil)
        #   A participant to add to a call
        #
        #   @param kind [String] user for one of your app users, number for a phone number
        #
        #   @param value [String] The app user's identity, or the phone number in E.164 format
      end
    end

    CallParticipantTarget = Calls::CallParticipantTarget
  end
end
