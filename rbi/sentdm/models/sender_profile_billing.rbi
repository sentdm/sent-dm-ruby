# typed: strong

module Sentdm
  module Models
    class SenderProfileBilling < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::SenderProfileBilling, Sentdm::Internal::AnyHash)
        end

      # Whether the organization pays, rather than the profile.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :inherit

      sig { params(inherit: T::Boolean).void }
      attr_writer :inherit

      # Who pays for a sender profile's traffic, as a read reports it.
      #
      # Its own type, field for field the same as BillingRequest. Same reason as the
      # brand: a response is not a request, whatever it carries.
      sig { params(inherit: T::Boolean).returns(T.attached_class) }
      def self.new(
        # Whether the organization pays, rather than the profile.
        inherit: nil
      )
      end

      sig { override.returns({ inherit: T::Boolean }) }
      def to_hash
      end
    end
  end
end
