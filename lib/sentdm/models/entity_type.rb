# frozen_string_literal: true

module Sentdm
  module Models
    module EntityType
      extend Sentdm::Internal::Type::Enum

      PRIVATE_PROFIT = :PRIVATE_PROFIT
      PUBLIC_PROFIT = :PUBLIC_PROFIT
      NON_PROFIT = :NON_PROFIT
      SOLE_PROPRIETOR = :SOLE_PROPRIETOR
      GOVERNMENT = :GOVERNMENT

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
