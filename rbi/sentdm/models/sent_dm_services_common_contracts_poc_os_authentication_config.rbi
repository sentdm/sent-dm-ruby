# typed: strong

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsAuthenticationConfig < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::SentDmServicesCommonContractsPocOsAuthenticationConfig,
            Sentdm::Internal::AnyHash
          )
        end

      # Whether to add the security recommendation text: "For your security, do not
      # share this code."
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :add_security_recommendation

      sig { params(add_security_recommendation: T::Boolean).void }
      attr_writer :add_security_recommendation

      # Code expiration time in minutes (1-90). If set, adds footer: "This code expires
      # in X minutes."
      sig { returns(T.nilable(Integer)) }
      attr_accessor :code_expiration_minutes

      # Configuration for AUTHENTICATION category templates
      sig do
        params(
          add_security_recommendation: T::Boolean,
          code_expiration_minutes: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether to add the security recommendation text: "For your security, do not
        # share this code."
        add_security_recommendation: nil,
        # Code expiration time in minutes (1-90). If set, adds footer: "This code expires
        # in X minutes."
        code_expiration_minutes: nil
      )
      end

      sig do
        override.returns(
          {
            add_security_recommendation: T::Boolean,
            code_expiration_minutes: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
