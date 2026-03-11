# typed: strong

module Sentdm
  module Models
    module Profiles
      module MessagingUseCaseUs
        extend Sentdm::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Sentdm::Profiles::MessagingUseCaseUs) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MARKETING =
          T.let(:MARKETING, Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol)
        ACCOUNT_NOTIFICATION =
          T.let(
            :ACCOUNT_NOTIFICATION,
            Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol
          )
        CUSTOMER_CARE =
          T.let(
            :CUSTOMER_CARE,
            Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol
          )
        FRAUD_ALERT =
          T.let(
            :FRAUD_ALERT,
            Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol
          )
        TWO_FA =
          T.let(:TWO_FA, Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol)
        DELIVERY_NOTIFICATION =
          T.let(
            :DELIVERY_NOTIFICATION,
            Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol
          )
        SECURITY_ALERT =
          T.let(
            :SECURITY_ALERT,
            Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol
          )
        M2_M = T.let(:M2M, Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol)
        MIXED =
          T.let(:MIXED, Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol)
        HIGHER_EDUCATION =
          T.let(
            :HIGHER_EDUCATION,
            Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol
          )
        POLLING_VOTING =
          T.let(
            :POLLING_VOTING,
            Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol
          )
        PUBLIC_SERVICE_ANNOUNCEMENT =
          T.let(
            :PUBLIC_SERVICE_ANNOUNCEMENT,
            Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol
          )
        LOW_VOLUME =
          T.let(:LOW_VOLUME, Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
