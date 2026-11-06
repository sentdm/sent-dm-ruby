# frozen_string_literal: true

module Sentdm
  module Models
    class SenderProfileBilling < Sentdm::Internal::Type::BaseModel
      # @!attribute inherit
      #   Whether the organization pays, rather than the profile.
      #
      #   @return [Boolean, nil]
      optional :inherit, Sentdm::Internal::Type::Boolean

      # @!method initialize(inherit: nil)
      #   Who pays for a sender profile's traffic, as a read reports it.
      #
      #   Its own type, field for field the same as BillingRequest. Same reason as the
      #   brand: a response is not a request, whatever it carries.
      #
      #   @param inherit [Boolean] Whether the organization pays, rather than the profile.
    end
  end
end
