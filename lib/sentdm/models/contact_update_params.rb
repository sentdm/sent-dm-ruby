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

      # @!attribute default_channel
      #   Default messaging channel: "sms" or "whatsapp"
      #
      #   @return [String, nil]
      optional :default_channel, String, nil?: true

      # @!attribute opt_out
      #   Whether the contact has opted out of messaging
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

      # @!method initialize(id:, default_channel: nil, opt_out: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ContactUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param default_channel [String, nil] Default messaging channel: "sms" or "whatsapp"
      #
      #   @param opt_out [Boolean, nil] Whether the contact has opted out of messaging
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
