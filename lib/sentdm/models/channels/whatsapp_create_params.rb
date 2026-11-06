# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::Whatsapp#create
      class WhatsappCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute phone_number_id
        #   The Meta phone-number id of the number on WabaId, which assigns it to this
        #   profile as the number it sends from. It is not checked against the account here,
        #   so name the account's number; it is refused if another profile already uses it.
        #
        #   Optional: omit it to connect the account and settle the number later. Nothing
        #   picks one on your behalf.
        #
        #   @return [String, nil]
        optional :phone_number_id, String, nil?: true

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute waba_id
        #   WhatsApp Business Account id — one of the accounts shared into your
        #   organization. Required: the organization holds one per client, and nothing but
        #   the caller says which is meant here.
        #
        #   @return [String, nil]
        optional :waba_id, String

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(phone_number_id: nil, sandbox: nil, waba_id: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::WhatsappCreateParams} for more details.
        #
        #   @param phone_number_id [String, nil] The Meta phone-number id of the number on WabaId, which assigns it to this profi
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
        #
        #   @param waba_id [String] WhatsApp Business Account id — one of the accounts shared into your organization
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
