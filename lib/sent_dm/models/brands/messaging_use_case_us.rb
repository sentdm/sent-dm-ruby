# frozen_string_literal: true

module SentDm
  module Models
    module Brands
      module MessagingUseCaseUs
        extend SentDm::Internal::Type::Enum

        MARKETING = :MARKETING
        ACCOUNT_NOTIFICATION = :ACCOUNT_NOTIFICATION
        CUSTOMER_CARE = :CUSTOMER_CARE
        FRAUD_ALERT = :FRAUD_ALERT
        TWO_FA = :TWO_FA
        DELIVERY_NOTIFICATION = :DELIVERY_NOTIFICATION
        SECURITY_ALERT = :SECURITY_ALERT
        M2_M = :M2M
        MIXED = :MIXED
        HIGHER_EDUCATION = :HIGHER_EDUCATION
        POLLING_VOTING = :POLLING_VOTING
        PUBLIC_SERVICE_ANNOUNCEMENT = :PUBLIC_SERVICE_ANNOUNCEMENT
        LOW_VOLUME = :LOW_VOLUME

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
