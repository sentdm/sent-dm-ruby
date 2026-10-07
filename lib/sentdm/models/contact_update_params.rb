# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#update
    class ContactUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute api_key
      #   API key from the x-api-key header, or empty when the caller sent it as
      #   Authorization: Bearer instead.
      #
      #   Optional on purpose. CustomerV3AuthenticationHandler accepts the key in either
      #   header, and [FromHeader] is required by default, so a Bearer-only request would
      #   authenticate and then be refused with a 400 for a header it never needed.
      #   Endpoints read the customer from the CustomerId claim, not from this value.
      #
      #   @return [String, nil]
      optional :api_key, String, api_name: :apiKey

      # @!attribute default_channel
      #   Default messaging channel: "sms" or "whatsapp"
      #
      #   @return [String, nil]
      optional :default_channel, String, nil?: true

      # @!attribute opt_out
      #   Whether the contact has opted out of messaging. Single source of truth — opt-out
      #   is per-contact, not per-channel.
      #
      #   @return [Boolean, nil]
      optional :opt_out, Sentdm::Internal::Type::Boolean, nil?: true

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

      # @!method initialize(id:, api_key: nil, default_channel: nil, opt_out: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ContactUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param api_key [String] API key from the x-api-key header, or empty when the caller sent it as
      #
      #   @param default_channel [String, nil] Default messaging channel: "sms" or "whatsapp"
      #
      #   @param opt_out [Boolean, nil] Whether the contact has opted out of messaging. Single source of truth — opt-out
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
