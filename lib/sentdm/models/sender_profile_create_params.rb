# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::SenderProfiles#create
    class SenderProfileCreateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute billing
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
      #   @return [Sentdm::Models::SenderProfileBillingRequest, nil]
      optional :billing, -> { Sentdm::SenderProfileBillingRequest }, nil?: true

      # @!attribute channels
      #   The channels the profile sends on. Each is independently the profile's own or
      #   absent — none can be inherited, so none carries a mode and presence is the whole
      #   of the request.
      #
      #   A profile can send SMS in several markets, but create takes one — the market it
      #   starts in. Further markets are added through POST /v3/channels/sms with
      #   x-profile-id, and a read returns them all as a list. Create stays singular
      #   permanently rather than being a list that accepts one entry: the constraint is
      #   in the type, and there is no later widening to break the contract.
      #
      #   @return [Sentdm::Models::SenderProfileChannels, nil]
      optional :channels, -> { Sentdm::SenderProfileChannels }, nil?: true

      # @!attribute compliance
      #   The compliance values a market registers with. `brand` and `campaign` apply to
      #   US `TEN_DLC`; other markets fill this map with the document keys their own
      #   requirements name.
      #
      #   @return [Sentdm::Models::Channels::MarketCompliance, nil]
      optional :compliance, -> { Sentdm::Channels::MarketCompliance }

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute name
      #   Display name for the profile. Required.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute notifications
      #   Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
      #   ORGANIZATION_AND_SENDER_PROFILE. Omitting it leaves the profile on the
      #   Organization default.
      #
      #   @return [String, nil]
      optional :notifications, String, nil?: true

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute short_name
      #   Short name, which is also the SMS sender id — required. 3–11 characters of
      #   letters, numbers and spaces, with at least one letter.
      #
      #   @return [String, nil]
      optional :short_name, String

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(billing: nil, channels: nil, compliance: nil, description: nil, name: nil, notifications: nil, sandbox: nil, short_name: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::SenderProfileCreateParams} for more details.
      #
      #   @param billing [Sentdm::Models::SenderProfileBillingRequest, nil] Who pays for what a sender profile sends.
      #
      #   @param channels [Sentdm::Models::SenderProfileChannels, nil] The channels the profile sends on. Each is independently the profile's own or ab
      #
      #   @param compliance [Sentdm::Models::Channels::MarketCompliance] The compliance values a market registers with. `brand` and `campaign` apply to U
      #
      #   @param description [String, nil]
      #
      #   @param name [String] Display name for the profile. Required.
      #
      #   @param notifications [String, nil] Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param short_name [String] Short name, which is also the SMS sender id — required. 3–11 characters of lette
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
