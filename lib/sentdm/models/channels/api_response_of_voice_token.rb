# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class APIResponseOfVoiceToken < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   A short-lived token your app passes to the voice client SDK to register
        #
        #   @return [Sentdm::Models::Channels::APIResponseOfVoiceToken::Data, nil]
        optional :data, -> { Sentdm::Channels::APIResponseOfVoiceToken::Data }, nil?: true

        # @!attribute error
        #   Error information
        #
        #   @return [Sentdm::Models::ErrorDetail, nil]
        optional :error, -> { Sentdm::ErrorDetail }, nil?: true

        # @!attribute meta
        #   Request and response metadata
        #
        #   @return [Sentdm::Models::APIMeta, nil]
        optional :meta, -> { Sentdm::APIMeta }

        # @!attribute success
        #   Indicates whether the request was successful
        #
        #   @return [Boolean, nil]
        optional :success, Sentdm::Internal::Type::Boolean

        # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
        #   Standard API response envelope for all v3 endpoints
        #
        #   @param data [Sentdm::Models::Channels::APIResponseOfVoiceToken::Data, nil] A short-lived token your app passes to the voice client SDK to register
        #
        #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
        #
        #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
        #
        #   @param success [Boolean] Indicates whether the request was successful

        # @see Sentdm::Models::Channels::APIResponseOfVoiceToken#data
        class Data < Sentdm::Internal::Type::BaseModel
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
          #   {Sentdm::Models::Channels::APIResponseOfVoiceToken::Data} for more details.
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
    end
  end
end
