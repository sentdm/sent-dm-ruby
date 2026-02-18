# typed: strong

module Sentdm
  module Models
    module TcrBrandRelationship
      extend Sentdm::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Sentdm::TcrBrandRelationship) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      BASIC_ACCOUNT =
        T.let(:BASIC_ACCOUNT, Sentdm::TcrBrandRelationship::TaggedSymbol)
      MEDIUM_ACCOUNT =
        T.let(:MEDIUM_ACCOUNT, Sentdm::TcrBrandRelationship::TaggedSymbol)
      LARGE_ACCOUNT =
        T.let(:LARGE_ACCOUNT, Sentdm::TcrBrandRelationship::TaggedSymbol)
      SMALL_ACCOUNT =
        T.let(:SMALL_ACCOUNT, Sentdm::TcrBrandRelationship::TaggedSymbol)
      KEY_ACCOUNT =
        T.let(:KEY_ACCOUNT, Sentdm::TcrBrandRelationship::TaggedSymbol)

      sig do
        override.returns(T::Array[Sentdm::TcrBrandRelationship::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
