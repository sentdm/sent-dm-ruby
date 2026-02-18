# frozen_string_literal: true

module SentDm
  module Models
    module TcrBrandRelationship
      extend SentDm::Internal::Type::Enum

      BASIC_ACCOUNT = :BASIC_ACCOUNT
      MEDIUM_ACCOUNT = :MEDIUM_ACCOUNT
      LARGE_ACCOUNT = :LARGE_ACCOUNT
      SMALL_ACCOUNT = :SMALL_ACCOUNT
      KEY_ACCOUNT = :KEY_ACCOUNT

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
