# frozen_string_literal: true

module Sentdm
  module Models
    class AccountSMSChannel < Sentdm::Internal::Type::BaseModel
      # @!attribute configured
      #   Whether SMS is configured for this account
      #
      #   @return [Boolean, nil]
      optional :configured, Sentdm::Internal::Type::Boolean

      # @!attribute phone_number
      #   Sending phone number in E.164 format
      #
      #   @return [String, nil]
      optional :phone_number, String, nil?: true

      # @!method initialize(configured: nil, phone_number: nil)
      #   SMS channel configuration. When configured, includes the sending phone number.
      #
      #   @param configured [Boolean] Whether SMS is configured for this account
      #
      #   @param phone_number [String, nil] Sending phone number in E.164 format
    end
  end
end
