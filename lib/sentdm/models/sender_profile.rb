# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::SenderProfiles#list
    class SenderProfile < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute api_key
      #   The API key for this profile.
      #
      #   Returned by create and by nothing else. It is shown once; a read that repeated
      #   it would turn every profile list into a credential dump and put the key into any
      #   log or cache that keeps a response body.
      #
      #   Omitted rather than null on a read. A key field that is always present and
      #   always empty suggests it could be populated, which is an invitation to populate
      #   it; absent says there is nothing to look for. Doing it with a serializer
      #   condition rather than a second response type keeps create and read on one shape,
      #   which is what stops them drifting.
      #
      #   @return [String, nil]
      optional :api_key, String, nil?: true

      # @!attribute billing
      #   Who pays for a sender profile's traffic, as a read reports it.
      #
      #   Its own type, field for field the same as BillingRequest. Same reason as the
      #   brand: a response is not a request, whatever it carries.
      #
      #   @return [Sentdm::Models::SenderProfileBilling, nil]
      optional :billing, -> { Sentdm::SenderProfileBilling }, nil?: true

      # @!attribute channels
      #   The channels a profile sends on. SMS is a list because a profile can send in
      #   several markets; WhatsApp and RCS are single, because a profile has one business
      #   account and one agent.
      #
      #   @return [Sentdm::Models::ChannelsState, nil]
      optional :channels, -> { Sentdm::ChannelsState }, nil?: true

      # @!attribute compliance
      #   What a market has been given: the identity it registers under, its programme,
      #   and any documents attached.
      #
      #   What it does not carry is what the market asks for. That is the subject of GET
      #   /v3/compliance/requirements, and it is the same answer for every caller — a
      #   description of what a compliance regime wants, not a record of one customer's
      #   progress through it. It was reported here as well for a while, which put the
      #   same array in six response shapes and left a caller deciding which of two
      #   sources to believe.
      #
      #   Present on a list read for markets that register (carrying brand and campaign),
      #   but with documents absent — documents are not fetched for a list, because a
      #   catalog lookup and a document read per market would multiply across a page.
      #   Absent documents is distinct from an empty list: absent says they were not
      #   fetched; empty says the market has been given none. The parent object is null
      #   only when the market registers with nobody and compliance was not computed —
      #   nothing to show at all.
      #
      #   @return [Sentdm::Models::Channels::SuppliedCompliance, nil]
      optional :compliance, -> { Sentdm::Channels::SuppliedCompliance }, nil?: true

      # @!attribute created_at
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute notifications
      #   Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
      #   ORGANIZATION_AND_SENDER_PROFILE. Always present — a profile that never chose
      #   reports as ORGANIZATION, the value a create would send to get the default
      #   behaviour.
      #
      #   @return [String, nil]
      optional :notifications, String, nil?: true

      # @!attribute organization_id
      #
      #   @return [String, nil]
      optional :organization_id, String, nil?: true

      # @!attribute short_name
      #
      #   @return [String, nil]
      optional :short_name, String, nil?: true

      # @!method initialize(id: nil, api_key: nil, billing: nil, channels: nil, compliance: nil, created_at: nil, description: nil, name: nil, notifications: nil, organization_id: nil, short_name: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::SenderProfile} for more details.
      #
      #   A sender profile as the API reports it — the same document the create call
      #   accepts, plus the read-only facts it cannot: each market's status and what it
      #   still owes.
      #
      #   No status at the profile, brand or campaign level. Brand and campaign are
      #   identity, and identity has no lifecycle. What has one is the registration of a
      #   sender in a market, and the approval of a channel — so status lives there, where
      #   it says which specific thing is blocked rather than flattening several answers
      #   into one.
      #
      #   @param id [String]
      #
      #   @param api_key [String, nil] The API key for this profile.
      #
      #   @param billing [Sentdm::Models::SenderProfileBilling, nil] Who pays for a sender profile's traffic, as a read reports it.
      #
      #   @param channels [Sentdm::Models::ChannelsState, nil] The channels a profile sends on. SMS is a list because a profile can send in sev
      #
      #   @param compliance [Sentdm::Models::Channels::SuppliedCompliance, nil] What a market has been given: the identity it registers under, its programme, an
      #
      #   @param created_at [Time]
      #
      #   @param description [String, nil]
      #
      #   @param name [String]
      #
      #   @param notifications [String, nil] Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
      #
      #   @param organization_id [String, nil]
      #
      #   @param short_name [String, nil]
    end
  end
end
