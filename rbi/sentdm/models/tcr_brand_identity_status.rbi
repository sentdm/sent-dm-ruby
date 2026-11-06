# typed: strong

module Sentdm
  module Models
    module TcrBrandIdentityStatus
      extend Sentdm::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Sentdm::TcrBrandIdentityStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      SELF_DECLARED =
        T.let(:SELF_DECLARED, Sentdm::TcrBrandIdentityStatus::TaggedSymbol)
      UNVERIFIED =
        T.let(:UNVERIFIED, Sentdm::TcrBrandIdentityStatus::TaggedSymbol)
      VERIFIED = T.let(:VERIFIED, Sentdm::TcrBrandIdentityStatus::TaggedSymbol)
      VETTED_VERIFIED =
        T.let(:VETTED_VERIFIED, Sentdm::TcrBrandIdentityStatus::TaggedSymbol)

      sig do
        override.returns(T::Array[Sentdm::TcrBrandIdentityStatus::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
