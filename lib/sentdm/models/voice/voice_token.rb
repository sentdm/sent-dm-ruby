# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceToken < Sentdm::Internal::Type::BaseModel
        # @!attribute token
        #   The signed token. Hand it to the client SDK unchanged. Treat it as opaque: read
        #   the identity, number, and expiry from this response, not from the token.
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
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::VoiceToken} for more details.
        #
        #   A short-lived token your app passes to the voice client SDK to register
        #
        #   @param token [String] The signed token. Hand it to the client SDK unchanged. Treat it as opaque: read
        #
        #   @param expires_at [Time] When the token expires (UTC)
        #
        #   @param identity [String] The identity the token was minted for
        #
        #   @param number [String] The phone number this identity is now bound to, in E.164 format
      end
    end

    VoiceToken = Voice::VoiceToken
  end
end
