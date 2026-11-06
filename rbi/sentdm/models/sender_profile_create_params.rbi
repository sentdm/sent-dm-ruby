# typed: strong

module Sentdm
  module Models
    class SenderProfileCreateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::SenderProfileCreateParams, Sentdm::Internal::AnyHash)
        end

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
      sig { returns(T.nilable(Sentdm::SenderProfileBillingRequest)) }
      attr_reader :billing

      sig do
        params(
          billing: T.nilable(Sentdm::SenderProfileBillingRequest::OrHash)
        ).void
      end
      attr_writer :billing

      # The channels the profile sends on. Each is independently the profile's own or
      # absent — none can be inherited, so none carries a mode and presence is the whole
      # of the request.
      #
      # A profile can send SMS in several markets, but create takes one — the market it
      # starts in. Further markets are added through POST /v3/channels/sms with
      # x-profile-id, and a read returns them all as a list. Create stays singular
      # permanently rather than being a list that accepts one entry: the constraint is
      # in the type, and there is no later widening to break the contract.
      sig { returns(T.nilable(Sentdm::SenderProfileChannels)) }
      attr_reader :channels

      sig do
        params(channels: T.nilable(Sentdm::SenderProfileChannels::OrHash)).void
      end
      attr_writer :channels

      # The compliance values a market registers with. `brand` and `campaign` apply to
      # US `TEN_DLC`; other markets fill this map with the document keys their own
      # requirements name.
      sig { returns(T.nilable(Sentdm::Channels::MarketCompliance)) }
      attr_reader :compliance

      sig do
        params(compliance: Sentdm::Channels::MarketCompliance::OrHash).void
      end
      attr_writer :compliance

      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Display name for the profile. Required.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
      # ORGANIZATION_AND_SENDER_PROFILE. Omitting it leaves the profile on the
      # Organization default.
      sig { returns(T.nilable(String)) }
      attr_accessor :notifications

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      # Short name, which is also the SMS sender id — required. 3–11 characters of
      # letters, numbers and spaces, with at least one letter.
      sig { returns(T.nilable(String)) }
      attr_reader :short_name

      sig { params(short_name: String).void }
      attr_writer :short_name

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          billing: T.nilable(Sentdm::SenderProfileBillingRequest::OrHash),
          channels: T.nilable(Sentdm::SenderProfileChannels::OrHash),
          compliance: Sentdm::Channels::MarketCompliance::OrHash,
          description: T.nilable(String),
          name: String,
          notifications: T.nilable(String),
          sandbox: T::Boolean,
          short_name: String,
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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
        billing: nil,
        # The channels the profile sends on. Each is independently the profile's own or
        # absent — none can be inherited, so none carries a mode and presence is the whole
        # of the request.
        #
        # A profile can send SMS in several markets, but create takes one — the market it
        # starts in. Further markets are added through POST /v3/channels/sms with
        # x-profile-id, and a read returns them all as a list. Create stays singular
        # permanently rather than being a list that accepts one entry: the constraint is
        # in the type, and there is no later widening to break the contract.
        channels: nil,
        # The compliance values a market registers with. `brand` and `campaign` apply to
        # US `TEN_DLC`; other markets fill this map with the document keys their own
        # requirements name.
        compliance: nil,
        description: nil,
        # Display name for the profile. Required.
        name: nil,
        # Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
        # ORGANIZATION_AND_SENDER_PROFILE. Omitting it leaves the profile on the
        # Organization default.
        notifications: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        # Short name, which is also the SMS sender id — required. 3–11 characters of
        # letters, numbers and spaces, with at least one letter.
        short_name: nil,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            billing: T.nilable(Sentdm::SenderProfileBillingRequest),
            channels: T.nilable(Sentdm::SenderProfileChannels),
            compliance: Sentdm::Channels::MarketCompliance,
            description: T.nilable(String),
            name: String,
            notifications: T.nilable(String),
            sandbox: T::Boolean,
            short_name: String,
            idempotency_key: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
