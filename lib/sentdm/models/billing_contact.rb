# frozen_string_literal: true

module Sentdm
  module Models
    class BillingContact < Sentdm::Internal::Type::BaseModel
      # @!attribute address
      #
      #   @return [String, nil]
      optional :address, String, nil?: true

      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute phone
      #
      #   @return [String, nil]
      optional :phone, String, nil?: true

      # @!method initialize(address: nil, email: nil, name: nil, phone: nil)
      #   Billing contact info returned in profile responses
      #
      #   @param address [String, nil]
      #   @param email [String, nil]
      #   @param name [String, nil]
      #   @param phone [String, nil]
    end
  end
end
