# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      module SMS
        # @see Sentdm::Resources::Channels::SMS::TenDlc#add_numbers
        class TenDlcAddNumbersParams < Sentdm::Internal::Type::BaseModel
          extend Sentdm::Internal::Type::RequestParameters::Converter
          include Sentdm::Internal::Type::RequestParameters

          # @!attribute campaign_id
          #   The campaign to add the numbers to, as compliance.campaigns[].id reports it.
          #   Required.
          #
          #   @return [String]
          required :campaign_id, String

          # @!attribute numbers
          #   The numbers to add, one entry per area code, e.g. [{"area_code": "415",
          #   "quantity": 2}, {"quantity": 1}]. quantity defaults to 1, and an entry without
          #   area_code means any area code. Required.
          #
          #   Added to what the campaign already asks for, never replacing it.
          #
          #   @return [Array<Sentdm::Models::Channels::SMSNumberRequest, nil>]
          required :numbers, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Channels::SMSNumberRequest, nil?: true] }

          # @!attribute idempotency_key
          #
          #   @return [String]
          required :idempotency_key, String

          # @!attribute sandbox
          #   Sandbox flag - when true, the operation is simulated without side effects Useful
          #   for testing integrations without actual execution
          #
          #   @return [Boolean, nil]
          optional :sandbox, Sentdm::Internal::Type::Boolean

          # @!attribute x_profile_id
          #
          #   @return [String, nil]
          optional :x_profile_id, String

          # @!method initialize(campaign_id:, numbers:, idempotency_key:, sandbox: nil, x_profile_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::Channels::SMS::TenDlcAddNumbersParams} for more details.
          #
          #   @param campaign_id [String] The campaign to add the numbers to, as compliance.campaigns[].id reports it. Req
          #
          #   @param numbers [Array<Sentdm::Models::Channels::SMSNumberRequest, nil>] The numbers to add, one entry per area code, e.g. [{"area_code": "415", "quantit
          #
          #   @param idempotency_key [String]
          #
          #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
          #
          #   @param x_profile_id [String]
          #
          #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
