# typed: strong

module Sentdm
  module Models
    module EntityType
      extend Sentdm::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Sentdm::EntityType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PRIVATE_PROFIT = T.let(:PRIVATE_PROFIT, Sentdm::EntityType::TaggedSymbol)
      PUBLIC_PROFIT = T.let(:PUBLIC_PROFIT, Sentdm::EntityType::TaggedSymbol)
      NON_PROFIT = T.let(:NON_PROFIT, Sentdm::EntityType::TaggedSymbol)
      SOLE_PROPRIETOR =
        T.let(:SOLE_PROPRIETOR, Sentdm::EntityType::TaggedSymbol)
      GOVERNMENT = T.let(:GOVERNMENT, Sentdm::EntityType::TaggedSymbol)

      sig { override.returns(T::Array[Sentdm::EntityType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
