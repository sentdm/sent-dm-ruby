# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::Voice#create
      class VoiceCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute callback_url
        #   Where Sent asks what to do with each call on this number: an absolute HTTP or
        #   HTTPS URL on a public host. A signed question is POSTed here when a call arrives
        #   or a caller presses a key, and the answer decides the call. Every question is
        #   signed with the callback_secret the response returns, the same way your webhooks
        #   are signed. Turning the number on again with a different URL replaces it and
        #   keeps the secret.
        #
        #   @return [String]
        required :callback_url, String

        # @!attribute number
        #   One of your phone numbers, in E.164 format.
        #
        #   @return [String]
        required :number, String

        # @!attribute default_for_app_calls
        #   Make this the line app-originated calls are placed from when a voice token names
        #   no number. Omit it and your first voice number takes that role; a later one
        #   leaves it where it is.
        #
        #   @return [Boolean, nil]
        optional :default_for_app_calls, Sentdm::Internal::Type::Boolean, nil?: true

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(callback_url:, number:, default_for_app_calls: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::VoiceCreateParams} for more details.
        #
        #   @param callback_url [String] Where Sent asks what to do with each call on this number: an absolute HTTP or HT
        #
        #   @param number [String] One of your phone numbers, in E.164 format.
        #
        #   @param default_for_app_calls [Boolean, nil] Make this the line app-originated calls are placed from when a voice token names
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
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
