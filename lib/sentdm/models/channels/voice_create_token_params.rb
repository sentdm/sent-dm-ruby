# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::Voice#create_token
      class VoiceCreateTokenParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute identity
        #   Your identifier for the app user, such as an agent or account id. Letters,
        #   digits, hyphens and underscores only, up to 200 characters.
        #
        #   @return [String, nil]
        optional :identity, String

        # @!attribute number
        #   One of your voice-enabled phone numbers in E.164 format. Calls placed by this
        #   identity are routed through that number. Omit to use your default app-call
        #   number.
        #
        #   @return [String, nil]
        optional :number, String, nil?: true

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute ttl
        #   Token lifetime in seconds. Defaults to 600 and cannot exceed 3600.
        #
        #   @return [Integer, nil]
        optional :ttl, Integer, nil?: true

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(identity: nil, number: nil, sandbox: nil, ttl: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::VoiceCreateTokenParams} for more details.
        #
        #   @param identity [String] Your identifier for the app user, such as an agent or account id. Letters, digit
        #
        #   @param number [String, nil] One of your voice-enabled phone numbers in E.164 format. Calls placed by this id
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
        #
        #   @param ttl [Integer, nil] Token lifetime in seconds. Defaults to 600 and cannot exceed 3600.
        #
        #   @param idempotency_key [String]
        #
        #   @param x_profile_id [String]
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
