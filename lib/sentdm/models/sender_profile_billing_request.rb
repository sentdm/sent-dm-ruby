# frozen_string_literal: true

module Sentdm
  module Models
    class SenderProfileBillingRequest < Sentdm::Internal::Type::BaseModel
      # @!attribute inherit
      #   Whether the parent organization pays. false is the profile paying for itself.
      #
      #   @return [Boolean, nil]
      optional :inherit, Sentdm::Internal::Type::Boolean

      # @!method initialize(inherit: nil)
      #   Who pays for what a sender profile sends.
      #
      #   Ownership reads the same way as BrandRequest and CampaignRequest: inherit: true
      #   is the organization paying; inherit: false (or an empty block) is the profile
      #   paying for itself.
      #
      #   An absent block is the one place billing differs from brand and campaign: a
      #   profile still has to be paid for, so omitting billing stores
      #   ProfileAndOrganizationBilling — the profile pays first and its organization
      #   covers what the profile's balance cannot (see ResolveStored). { "name": "..." }
      #   stays a complete request.
      #
      #   Billing carries no fields of its own yet, so a profile paying for itself is {
      #   "inherit": false } — or an empty block, which means the same. That is thinner
      #   than brand and campaign, where supplying data is the act of owning; it becomes
      #   ordinary the moment billing gains a contact or a payment method to carry.
      #
      #   @param inherit [Boolean] Whether the parent organization pays. false is the profile paying for itself.
    end
  end
end
