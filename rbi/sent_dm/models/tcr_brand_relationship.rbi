# typed: strong

module SentDm
  module Models
    module TcrBrandRelationship
      extend SentDm::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, SentDm::TcrBrandRelationship) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      BASIC_ACCOUNT =
        T.let(:BASIC_ACCOUNT, SentDm::TcrBrandRelationship::TaggedSymbol)
      MEDIUM_ACCOUNT =
        T.let(:MEDIUM_ACCOUNT, SentDm::TcrBrandRelationship::TaggedSymbol)
      LARGE_ACCOUNT =
        T.let(:LARGE_ACCOUNT, SentDm::TcrBrandRelationship::TaggedSymbol)
      SMALL_ACCOUNT =
        T.let(:SMALL_ACCOUNT, SentDm::TcrBrandRelationship::TaggedSymbol)
      KEY_ACCOUNT =
        T.let(:KEY_ACCOUNT, SentDm::TcrBrandRelationship::TaggedSymbol)

      sig do
        override.returns(T::Array[SentDm::TcrBrandRelationship::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
