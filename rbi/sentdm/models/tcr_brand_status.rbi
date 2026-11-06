# typed: strong

module Sentdm
  module Models
    module TcrBrandStatus
      extend Sentdm::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Sentdm::TcrBrandStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      ACTIVE = T.let(:ACTIVE, Sentdm::TcrBrandStatus::TaggedSymbol)
      INACTIVE = T.let(:INACTIVE, Sentdm::TcrBrandStatus::TaggedSymbol)
      SUSPENDED = T.let(:SUSPENDED, Sentdm::TcrBrandStatus::TaggedSymbol)

      sig { override.returns(T::Array[Sentdm::TcrBrandStatus::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
