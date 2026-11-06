# frozen_string_literal: true

module Sentdm
  module Models
    module TcrCampaignStatus
      extend Sentdm::Internal::Type::Enum

      SENT_CREATED = :SENT_CREATED
      ACTIVE = :ACTIVE
      EXPIRED = :EXPIRED

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
