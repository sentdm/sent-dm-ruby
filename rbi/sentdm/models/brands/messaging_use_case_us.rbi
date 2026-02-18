# typed: strong

module Sentdm
  module Models
    module Brands
      module MessagingUseCaseUs
        extend Sentdm::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Sentdm::Brands::MessagingUseCaseUs) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MARKETING =
          T.let(:MARKETING, Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol)
        ACCOUNT_NOTIFICATION =
          T.let(
            :ACCOUNT_NOTIFICATION,
            Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        CUSTOMER_CARE =
          T.let(
            :CUSTOMER_CARE,
            Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        FRAUD_ALERT =
          T.let(:FRAUD_ALERT, Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol)
        TWO_FA =
          T.let(:TWO_FA, Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol)
        DELIVERY_NOTIFICATION =
          T.let(
            :DELIVERY_NOTIFICATION,
            Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        SECURITY_ALERT =
          T.let(
            :SECURITY_ALERT,
            Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        M2_M = T.let(:M2M, Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol)
        MIXED = T.let(:MIXED, Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol)
        HIGHER_EDUCATION =
          T.let(
            :HIGHER_EDUCATION,
            Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        POLLING_VOTING =
          T.let(
            :POLLING_VOTING,
            Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        PUBLIC_SERVICE_ANNOUNCEMENT =
          T.let(
            :PUBLIC_SERVICE_ANNOUNCEMENT,
            Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        LOW_VOLUME =
          T.let(:LOW_VOLUME, Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Sentdm::Brands::MessagingUseCaseUs::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
