# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::Voice#rotate_secret
      class VoiceRotateSecretParams < Sentdm::Models::MutationRequest
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute number
        #
        #   @return [String]
        required :number, String

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(number:, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   @param number [String]
        #   @param idempotency_key [String]
        #   @param x_profile_id [String]
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
