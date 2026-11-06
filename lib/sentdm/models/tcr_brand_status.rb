# frozen_string_literal: true

module Sentdm
  module Models
    module TcrBrandStatus
      extend Sentdm::Internal::Type::Enum

      ACTIVE = :ACTIVE
      INACTIVE = :INACTIVE
      SUSPENDED = :SUSPENDED

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
