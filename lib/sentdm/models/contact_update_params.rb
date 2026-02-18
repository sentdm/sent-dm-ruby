# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#update
    class ContactUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

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

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, Sentdm::Internal::Type::Boolean

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(default_channel: nil, opt_out: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ContactUpdateParams} for more details.
      #
      #   @param default_channel [String, nil] Default messaging channel: "sms" or "whatsapp"
      #
      #   @param opt_out [Boolean, nil] Whether the contact has opted out of messaging
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
