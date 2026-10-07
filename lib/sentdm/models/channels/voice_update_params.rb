# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::Voice#update
      class VoiceUpdateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute number
        #
        #   @return [String]
        required :number, String

        # @!attribute callback_url
        #   A new callback URL for the number, active or not: an absolute HTTP or HTTPS URL
        #   on a public host, where Sent asks what to do with each call. The signing secret
        #   is kept.
        #
        #   @return [String, nil]
        optional :callback_url, String, nil?: true

        # @!attribute default_for_app_calls
        #   true makes this the line app-originated calls are placed from when a voice token
        #   names no number. false is refused: an account with active voice numbers always
        #   has exactly one default, so the default moves by giving it to another number.
        #
        #   @return [Boolean, nil]
        optional :default_for_app_calls, Sentdm::Internal::Type::Boolean, nil?: true

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute status
        #   ACTIVE turns calls on for the number again, INACTIVE turns them off. Matched
        #   ignoring case. Turning the default line off is refused while other active voice
        #   numbers remain.
        #
        #   @return [Symbol, Sentdm::Models::Channels::VoiceUpdateParams::Status, nil]
        optional :status, enum: -> { Sentdm::Channels::VoiceUpdateParams::Status }, nil?: true

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(number:, callback_url: nil, default_for_app_calls: nil, sandbox: nil, status: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::VoiceUpdateParams} for more details.
        #
        #   @param number [String]
        #
        #   @param callback_url [String, nil] A new callback URL for the number, active or not: an absolute HTTP or HTTPS URL
        #
        #   @param default_for_app_calls [Boolean, nil] true makes this the line app-originated calls are placed from when a voice token
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
        #
        #   @param status [Symbol, Sentdm::Models::Channels::VoiceUpdateParams::Status, nil] ACTIVE turns calls on for the number again, INACTIVE turns them off. Matched
        #
        #   @param idempotency_key [String]
        #
        #   @param x_profile_id [String]
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

        # ACTIVE turns calls on for the number again, INACTIVE turns them off. Matched
        # ignoring case. Turning the default line off is refused while other active voice
        # numbers remain.
        module Status
          extend Sentdm::Internal::Type::Enum

          # Turns calls on for the number again. The callback URL and the signing secret it had are kept; send `callback_url` in the same call to replace the URL.
          ACTIVE = :ACTIVE

          # Turns calls off for the number. Refused while the number is the default line for app calls and other active voice numbers remain; move the default first. The callback URL and the secret stay on the number.
          INACTIVE = :INACTIVE

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
