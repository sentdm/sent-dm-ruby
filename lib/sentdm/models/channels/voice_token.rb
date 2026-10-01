# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class VoiceToken < Sentdm::Internal::Type::BaseModel
        # @!attribute token
        #   The signed token. Hand it to the client SDK unchanged.
        #
        #   @return [String, nil]
        optional :token, String

        # @!attribute expires_at
        #   When the token expires (UTC)
        #
        #   @return [Time, nil]
        optional :expires_at, Time

        # @!attribute identity
        #   The identity the token was minted for
        #
        #   @return [String, nil]
        optional :identity, String

        # @!attribute number
        #   The phone number this identity is now bound to, in E.164 format
        #
        #   @return [String, nil]
        optional :number, String

        # @!method initialize(token: nil, expires_at: nil, identity: nil, number: nil)
        #   A short-lived token your app passes to the voice client SDK to register
        #
        #   @param token [String] The signed token. Hand it to the client SDK unchanged.
        #
        #   @param expires_at [Time] When the token expires (UTC)
        #
        #   @param identity [String] The identity the token was minted for
        #
        #   @param number [String] The phone number this identity is now bound to, in E.164 format
      end
    end
  end
end
