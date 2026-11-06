# typed: strong

module Sentdm
  module Models
    class SenderProfile < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::SenderProfile, Sentdm::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # The API key for this profile.
      #
      # Returned by create and by nothing else. It is shown once; a read that repeated
      # it would turn every profile list into a credential dump and put the key into any
      # log or cache that keeps a response body.
      #
      # Omitted rather than null on a read. A key field that is always present and
      # always empty suggests it could be populated, which is an invitation to populate
      # it; absent says there is nothing to look for. Doing it with a serializer
      # condition rather than a second response type keeps create and read on one shape,
      # which is what stops them drifting.
      sig { returns(T.nilable(String)) }
      attr_accessor :api_key

      # Who pays for a sender profile's traffic, as a read reports it.
      #
      # Its own type, field for field the same as BillingRequest. Same reason as the
      # brand: a response is not a request, whatever it carries.
      sig { returns(T.nilable(Sentdm::SenderProfileBilling)) }
      attr_reader :billing

      sig do
        params(billing: T.nilable(Sentdm::SenderProfileBilling::OrHash)).void
      end
      attr_writer :billing

      # The channels a profile sends on. SMS is a list because a profile can send in
      # several markets; WhatsApp and RCS are single, because a profile has one business
      # account and one agent.
      sig { returns(T.nilable(Sentdm::ChannelsState)) }
      attr_reader :channels

      sig { params(channels: T.nilable(Sentdm::ChannelsState::OrHash)).void }
      attr_writer :channels

      # What a market has been given: the identity it registers under, its programme,
      # and any documents attached.
      #
      # What it does not carry is what the market asks for. That is the subject of GET
      # /v3/compliance/requirements, and it is the same answer for every caller — a
      # description of what a compliance regime wants, not a record of one customer's
      # progress through it. It was reported here as well for a while, which put the
      # same array in six response shapes and left a caller deciding which of two
      # sources to believe.
      #
      # Present on a list read for markets that register (carrying brand and campaign),
      # but with documents absent — documents are not fetched for a list, because a
      # catalog lookup and a document read per market would multiply across a page.
      # Absent documents is distinct from an empty list: absent says they were not
      # fetched; empty says the market has been given none. The parent object is null
      # only when the market registers with nobody and compliance was not computed —
      # nothing to show at all.
      sig { returns(T.nilable(Sentdm::SenderProfile::Compliance)) }
      attr_reader :compliance

      sig do
        params(
          compliance: T.nilable(Sentdm::SenderProfile::Compliance::OrHash)
        ).void
      end
      attr_writer :compliance

      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
      # ORGANIZATION_AND_SENDER_PROFILE. Always present — a profile that never chose
      # reports as ORGANIZATION, the value a create would send to get the default
      # behaviour.
      sig { returns(T.nilable(String)) }
      attr_accessor :notifications

      sig { returns(T.nilable(String)) }
      attr_accessor :organization_id

      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # A sender profile as the API reports it — the same document the create call
      # accepts, plus the read-only facts it cannot: each market's status and what it
      # still owes.
      #
      # No status at the profile, brand or campaign level. Brand and campaign are
      # identity, and identity has no lifecycle. What has one is the registration of a
      # sender in a market, and the approval of a channel — so status lives there, where
      # it says which specific thing is blocked rather than flattening several answers
      # into one.
      sig do
        params(
          id: String,
          api_key: T.nilable(String),
          billing: T.nilable(Sentdm::SenderProfileBilling::OrHash),
          channels: T.nilable(Sentdm::ChannelsState::OrHash),
          compliance: T.nilable(Sentdm::SenderProfile::Compliance::OrHash),
          created_at: Time,
          description: T.nilable(String),
          name: String,
          notifications: T.nilable(String),
          organization_id: T.nilable(String),
          short_name: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        id: nil,
        # The API key for this profile.
        #
        # Returned by create and by nothing else. It is shown once; a read that repeated
        # it would turn every profile list into a credential dump and put the key into any
        # log or cache that keeps a response body.
        #
        # Omitted rather than null on a read. A key field that is always present and
        # always empty suggests it could be populated, which is an invitation to populate
        # it; absent says there is nothing to look for. Doing it with a serializer
        # condition rather than a second response type keeps create and read on one shape,
        # which is what stops them drifting.
        api_key: nil,
        # Who pays for a sender profile's traffic, as a read reports it.
        #
        # Its own type, field for field the same as BillingRequest. Same reason as the
        # brand: a response is not a request, whatever it carries.
        billing: nil,
        # The channels a profile sends on. SMS is a list because a profile can send in
        # several markets; WhatsApp and RCS are single, because a profile has one business
        # account and one agent.
        channels: nil,
        # What a market has been given: the identity it registers under, its programme,
        # and any documents attached.
        #
        # What it does not carry is what the market asks for. That is the subject of GET
        # /v3/compliance/requirements, and it is the same answer for every caller — a
        # description of what a compliance regime wants, not a record of one customer's
        # progress through it. It was reported here as well for a while, which put the
        # same array in six response shapes and left a caller deciding which of two
        # sources to believe.
        #
        # Present on a list read for markets that register (carrying brand and campaign),
        # but with documents absent — documents are not fetched for a list, because a
        # catalog lookup and a document read per market would multiply across a page.
        # Absent documents is distinct from an empty list: absent says they were not
        # fetched; empty says the market has been given none. The parent object is null
        # only when the market registers with nobody and compliance was not computed —
        # nothing to show at all.
        compliance: nil,
        created_at: nil,
        description: nil,
        name: nil,
        # Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
        # ORGANIZATION_AND_SENDER_PROFILE. Always present — a profile that never chose
        # reports as ORGANIZATION, the value a create would send to get the default
        # behaviour.
        notifications: nil,
        organization_id: nil,
        short_name: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            api_key: T.nilable(String),
            billing: T.nilable(Sentdm::SenderProfileBilling),
            channels: T.nilable(Sentdm::ChannelsState),
            compliance: T.nilable(Sentdm::SenderProfile::Compliance),
            created_at: Time,
            description: T.nilable(String),
            name: String,
            notifications: T.nilable(String),
            organization_id: T.nilable(String),
            short_name: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Compliance < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::SenderProfile::Compliance, Sentdm::Internal::AnyHash)
          end

        # The identity this market registers under, with inherit saying whose it is.
        #
        # Reported here rather than on the profile because it belongs to the registration
        # this market files, and only one market files one. It was a top-level block for a
        # while, which put a per-registration value beside a list of markets and left a
        # caller to work out which market it belonged to.
        #
        # Absent for a market that registers with nobody — such a market asks for no
        # identity, so there is none to report. Absent and null mean different things:
        # absent says this market does not ask, null would say it asks and nothing was
        # supplied.
        #
        # Untyped, like the request side, because its members are declared by the market's
        # own schema rather than by a C# class. A typed pair here would be a second
        # definition of what a market wants, free to drift from the one that validates.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :brand

        # The programme this market registers, with inherit saying whose it is.
        #
        # One, not a list. TcrCampaigns permits several and an account built on the admin
        # side may hold them, but this surface offers one — which is what lets the
        # market's PATCH be an upsert rather than a collection with an addressable create
        # behind it. An account holding several is reported as its first and refused on
        # write, rather than half-edited.
        #
        # Carries no id. Nothing addresses a campaign, and an undeclared key would be
        # refused if the caller sent this object back — which it is meant to be able to
        # do.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :campaign

        # What has been supplied for this market.
        #
        # Files, not values — the declared halves above carry the values. A document
        # cannot be a JSON value, so it is sent as multipart on the channel call and
        # reported here as a reference.
        #
        # Absent on a list read, which fetches identity but does not compute compliance
        # documents per market. Absent and empty mean different things: absent says the
        # documents were not fetched; empty says the market has been given none.
        sig do
          returns(
            T.nilable(T::Array[Sentdm::SenderProfile::Compliance::Document])
          )
        end
        attr_accessor :documents

        # What a market has been given: the identity it registers under, its programme,
        # and any documents attached.
        #
        # What it does not carry is what the market asks for. That is the subject of GET
        # /v3/compliance/requirements, and it is the same answer for every caller — a
        # description of what a compliance regime wants, not a record of one customer's
        # progress through it. It was reported here as well for a while, which put the
        # same array in six response shapes and left a caller deciding which of two
        # sources to believe.
        #
        # Present on a list read for markets that register (carrying brand and campaign),
        # but with documents absent — documents are not fetched for a list, because a
        # catalog lookup and a document read per market would multiply across a page.
        # Absent documents is distinct from an empty list: absent says they were not
        # fetched; empty says the market has been given none. The parent object is null
        # only when the market registers with nobody and compliance was not computed —
        # nothing to show at all.
        sig do
          params(
            brand: T.nilable(T::Hash[Symbol, T.anything]),
            campaign: T.nilable(T::Hash[Symbol, T.anything]),
            documents:
              T.nilable(
                T::Array[Sentdm::SenderProfile::Compliance::Document::OrHash]
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The identity this market registers under, with inherit saying whose it is.
          #
          # Reported here rather than on the profile because it belongs to the registration
          # this market files, and only one market files one. It was a top-level block for a
          # while, which put a per-registration value beside a list of markets and left a
          # caller to work out which market it belonged to.
          #
          # Absent for a market that registers with nobody — such a market asks for no
          # identity, so there is none to report. Absent and null mean different things:
          # absent says this market does not ask, null would say it asks and nothing was
          # supplied.
          #
          # Untyped, like the request side, because its members are declared by the market's
          # own schema rather than by a C# class. A typed pair here would be a second
          # definition of what a market wants, free to drift from the one that validates.
          brand: nil,
          # The programme this market registers, with inherit saying whose it is.
          #
          # One, not a list. TcrCampaigns permits several and an account built on the admin
          # side may hold them, but this surface offers one — which is what lets the
          # market's PATCH be an upsert rather than a collection with an addressable create
          # behind it. An account holding several is reported as its first and refused on
          # write, rather than half-edited.
          #
          # Carries no id. Nothing addresses a campaign, and an undeclared key would be
          # refused if the caller sent this object back — which it is meant to be able to
          # do.
          campaign: nil,
          # What has been supplied for this market.
          #
          # Files, not values — the declared halves above carry the values. A document
          # cannot be a JSON value, so it is sent as multipart on the channel call and
          # reported here as a reference.
          #
          # Absent on a list read, which fetches identity but does not compute compliance
          # documents per market. Absent and empty mean different things: absent says the
          # documents were not fetched; empty says the market has been given none.
          documents: nil
        )
        end

        sig do
          override.returns(
            {
              brand: T.nilable(T::Hash[Symbol, T.anything]),
              campaign: T.nilable(T::Hash[Symbol, T.anything]),
              documents:
                T.nilable(T::Array[Sentdm::SenderProfile::Compliance::Document])
            }
          )
        end
        def to_hash
        end

        class Document < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::SenderProfile::Compliance::Document,
                Sentdm::Internal::AnyHash
              )
            end

          # Identifier of the upload, for fetching it back through the documents endpoints.
          sig { returns(T.nilable(String)) }
          attr_accessor :document_id

          sig { returns(T.nilable(String)) }
          attr_accessor :file_name

          # The catalog's name for this document, matching the requirement it satisfies.
          sig { returns(T.nilable(String)) }
          attr_reader :key

          sig { params(key: String).void }
          attr_writer :key

          # A document a market asked for and has been given.
          sig do
            params(
              document_id: T.nilable(String),
              file_name: T.nilable(String),
              key: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Identifier of the upload, for fetching it back through the documents endpoints.
            document_id: nil,
            file_name: nil,
            # The catalog's name for this document, matching the requirement it satisfies.
            key: nil
          )
          end

          sig do
            override.returns(
              {
                document_id: T.nilable(String),
                file_name: T.nilable(String),
                key: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
