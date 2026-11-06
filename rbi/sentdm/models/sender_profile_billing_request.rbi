# typed: strong

module Sentdm
  module Models
    class SenderProfileBillingRequest < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::SenderProfileBillingRequest, Sentdm::Internal::AnyHash)
        end

      # Whether the parent organization pays. false is the profile paying for itself.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :inherit

      sig { params(inherit: T::Boolean).void }
      attr_writer :inherit

      # Who pays for what a sender profile sends.
      #
      # Ownership reads the same way as BrandRequest and CampaignRequest: inherit: true
      # is the organization paying; inherit: false (or an empty block) is the profile
      # paying for itself.
      #
      # An absent block is the one place billing differs from brand and campaign: a
      # profile still has to be paid for, so omitting billing stores
      # ProfileAndOrganizationBilling — the profile pays first and its organization
      # covers what the profile's balance cannot (see ResolveStored). { "name": "..." }
      # stays a complete request.
      #
      # Billing carries no fields of its own yet, so a profile paying for itself is {
      # "inherit": false } — or an empty block, which means the same. That is thinner
      # than brand and campaign, where supplying data is the act of owning; it becomes
      # ordinary the moment billing gains a contact or a payment method to carry.
      sig { params(inherit: T::Boolean).returns(T.attached_class) }
      def self.new(
        # Whether the parent organization pays. false is the profile paying for itself.
        inherit: nil
      )
      end

      sig { override.returns({ inherit: T::Boolean }) }
      def to_hash
      end
    end
  end
end
