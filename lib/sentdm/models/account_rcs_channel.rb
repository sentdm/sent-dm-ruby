# frozen_string_literal: true

module Sentdm
  module Models
    class AccountRcsChannel < Sentdm::Internal::Type::BaseModel
      # @!attribute configured
      #   Whether RCS is configured for this account
      #
      #   @return [Boolean, nil]
      optional :configured, Sentdm::Internal::Type::Boolean

      # @!attribute phone_number
      #   RCS-enabled phone number in E.164 format
      #
      #   @return [String, nil]
      optional :phone_number, String, nil?: true

      # @!method initialize(configured: nil, phone_number: nil)
      #   RCS channel configuration. When configured, includes the RCS phone number.
      #
      #   @param configured [Boolean] Whether RCS is configured for this account
      #
      #   @param phone_number [String, nil] RCS-enabled phone number in E.164 format
    end
  end
end
