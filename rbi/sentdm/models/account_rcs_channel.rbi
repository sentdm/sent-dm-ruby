# typed: strong

module Sentdm
  module Models
    class AccountRcsChannel < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::AccountRcsChannel, Sentdm::Internal::AnyHash)
        end

      # Whether RCS is configured for this account
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :configured

      sig { params(configured: T::Boolean).void }
      attr_writer :configured

      # RCS-enabled phone number in E.164 format
      sig { returns(T.nilable(String)) }
      attr_accessor :phone_number

      # RCS channel configuration. When configured, includes the RCS phone number.
      sig do
        params(configured: T::Boolean, phone_number: T.nilable(String)).returns(
          T.attached_class
        )
      end
      def self.new(
        # Whether RCS is configured for this account
        configured: nil,
        # RCS-enabled phone number in E.164 format
        phone_number: nil
      )
      end

      sig do
        override.returns(
          { configured: T::Boolean, phone_number: T.nilable(String) }
        )
      end
      def to_hash
      end
    end
  end
end
