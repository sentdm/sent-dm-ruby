# frozen_string_literal: true

module Sentdm
  module Models
    module TcrBrandIdentityStatus
      extend Sentdm::Internal::Type::Enum

      SELF_DECLARED = :SELF_DECLARED
      UNVERIFIED = :UNVERIFIED
      VERIFIED = :VERIFIED
      VETTED_VERIFIED = :VETTED_VERIFIED

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
