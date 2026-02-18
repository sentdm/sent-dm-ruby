# typed: strong

module SentDm
  module Models
    module Brands
      module MessagingUseCaseUs
        extend SentDm::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SentDm::Brands::MessagingUseCaseUs) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MARKETING =
          T.let(:MARKETING, SentDm::Brands::MessagingUseCaseUs::TaggedSymbol)
        ACCOUNT_NOTIFICATION =
          T.let(
            :ACCOUNT_NOTIFICATION,
            SentDm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        CUSTOMER_CARE =
          T.let(
            :CUSTOMER_CARE,
            SentDm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        FRAUD_ALERT =
          T.let(:FRAUD_ALERT, SentDm::Brands::MessagingUseCaseUs::TaggedSymbol)
        TWO_FA =
          T.let(:TWO_FA, SentDm::Brands::MessagingUseCaseUs::TaggedSymbol)
        DELIVERY_NOTIFICATION =
          T.let(
            :DELIVERY_NOTIFICATION,
            SentDm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        SECURITY_ALERT =
          T.let(
            :SECURITY_ALERT,
            SentDm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        M2_M = T.let(:M2M, SentDm::Brands::MessagingUseCaseUs::TaggedSymbol)
        MIXED = T.let(:MIXED, SentDm::Brands::MessagingUseCaseUs::TaggedSymbol)
        HIGHER_EDUCATION =
          T.let(
            :HIGHER_EDUCATION,
            SentDm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        POLLING_VOTING =
          T.let(
            :POLLING_VOTING,
            SentDm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        PUBLIC_SERVICE_ANNOUNCEMENT =
          T.let(
            :PUBLIC_SERVICE_ANNOUNCEMENT,
            SentDm::Brands::MessagingUseCaseUs::TaggedSymbol
          )
        LOW_VOLUME =
          T.let(:LOW_VOLUME, SentDm::Brands::MessagingUseCaseUs::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SentDm::Brands::MessagingUseCaseUs::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
