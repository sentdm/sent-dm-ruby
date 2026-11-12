# typed: strong

module Sentdm
  module Models
    module TcrCampaignStatus
      extend Sentdm::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Sentdm::TcrCampaignStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      SENT_CREATED =
        T.let(:SENT_CREATED, Sentdm::TcrCampaignStatus::TaggedSymbol)
      ACTIVE = T.let(:ACTIVE, Sentdm::TcrCampaignStatus::TaggedSymbol)
      EXPIRED = T.let(:EXPIRED, Sentdm::TcrCampaignStatus::TaggedSymbol)

      sig do
        override.returns(T::Array[Sentdm::TcrCampaignStatus::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
