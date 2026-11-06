# typed: strong

module Sentdm
  module Models
    class BillingContact < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::BillingContact, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :address

      sig { returns(T.nilable(String)) }
      attr_accessor :email

      sig { returns(T.nilable(String)) }
      attr_accessor :name

      sig { returns(T.nilable(String)) }
      attr_accessor :phone

      # Billing contact info returned in profile responses
      sig do
        params(
          address: T.nilable(String),
          email: T.nilable(String),
          name: T.nilable(String),
          phone: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(address: nil, email: nil, name: nil, phone: nil)
      end

      sig do
        override.returns(
          {
            address: T.nilable(String),
            email: T.nilable(String),
            name: T.nilable(String),
            phone: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
