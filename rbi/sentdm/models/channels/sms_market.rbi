# typed: strong

module Sentdm
  module Models
    module Channels
      class SMSMarket < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::SMSMarket, Sentdm::Internal::AnyHash)
          end

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
        sig { returns(T.nilable(Sentdm::Channels::SMSMarket::Compliance)) }
        attr_reader :compliance

        sig do
          params(
            compliance:
              T.nilable(Sentdm::Channels::SMSMarket::Compliance::OrHash)
          ).void
        end
        attr_writer :compliance

        sig { returns(T.nilable(String)) }
        attr_accessor :country

        sig { returns(T.nilable(String)) }
        attr_accessor :number_type

        # Every number this market holds or is still owed, each with its area code and its
        # own status (ACTIVE once it can send, PROVISIONING while it is still to be
        # assigned, INACTIVE once it could send and no longer can). One entry for a market
        # holding one number. US 10DLC numbers are assigned when the campaign is approved,
        # so they read as owed until then. Read-only.
        sig { returns(T.nilable(T::Array[Sentdm::Channels::SMSNumber])) }
        attr_reader :numbers

        sig do
          params(numbers: T::Array[Sentdm::Channels::SMSNumber::OrHash]).void
        end
        attr_writer :numbers

        # A sentence for reason_code: this market's own explanation, naming what is
        # outstanding where that is you. Omitted while ACTIVE.
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        # Why the market is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
        # such as CHANNEL_001 (something you owe) or CHANNEL_009 (under review). Switch on
        # this rather than on reason. Omitted while ACTIVE. Read-only; when nothing more
        # specific is known it is the generic reason for the status.
        sig { returns(T.nilable(String)) }
        attr_accessor :reason_code

        # The sender itself. Null until a carrier-assigned number is procured. For a
        # market holding several numbers, the first active one (the first assigned while
        # none is active) — every number is in numbers.
        sig { returns(T.nilable(String)) }
        attr_accessor :sender_value

        # Where this market's sender stands, in terms of who is holding it up —
        # PROVISIONING, ACTION_NEEDED, PENDING_REVIEW or ACTIVE. Read-only.
        #
        # Resolved rather than reported raw: a live sender reads ACTIVE whatever it still
        # owes, a market with outstanding requirements or an open resubmission request
        # reads ACTION_NEEDED, and a market that registers with a regime reads
        # PENDING_REVIEW once its brand exists — filing to The Campaign Registry is ours
        # to do and need not have happened yet, so a dedicated brand created through this
        # API reads PENDING_REVIEW from the moment it is stored.
        #
        # Describes whether the market can send, not each number: a market holding several
        # numbers reads ACTIVE as soon as one of them is, whatever the others are doing.
        # Each number's own status is in numbers.
        sig do
          returns(T.nilable(Sentdm::Channels::SMSMarket::Status::TaggedSymbol))
        end
        attr_accessor :status

        # One SMS market the profile sends in — its sender, where that sender stands, and
        # what the market wants.
        #
        # A profile may send in several: it is a tenant, not a market. Each carries its
        # own status, because a profile can be live in one country and mid-registration in
        # another — and each carries what it still owes, rather than that being reported
        # in a separate array a caller has to join on.
        sig do
          params(
            compliance:
              T.nilable(Sentdm::Channels::SMSMarket::Compliance::OrHash),
            country: T.nilable(String),
            number_type: T.nilable(String),
            numbers: T::Array[Sentdm::Channels::SMSNumber::OrHash],
            reason: T.nilable(String),
            reason_code: T.nilable(String),
            sender_value: T.nilable(String),
            status: T.nilable(Sentdm::Channels::SMSMarket::Status::OrSymbol)
          ).returns(T.attached_class)
        end
        def self.new(
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
          country: nil,
          number_type: nil,
          # Every number this market holds or is still owed, each with its area code and its
          # own status (ACTIVE once it can send, PROVISIONING while it is still to be
          # assigned, INACTIVE once it could send and no longer can). One entry for a market
          # holding one number. US 10DLC numbers are assigned when the campaign is approved,
          # so they read as owed until then. Read-only.
          numbers: nil,
          # A sentence for reason_code: this market's own explanation, naming what is
          # outstanding where that is you. Omitted while ACTIVE.
          reason: nil,
          # Why the market is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
          # such as CHANNEL_001 (something you owe) or CHANNEL_009 (under review). Switch on
          # this rather than on reason. Omitted while ACTIVE. Read-only; when nothing more
          # specific is known it is the generic reason for the status.
          reason_code: nil,
          # The sender itself. Null until a carrier-assigned number is procured. For a
          # market holding several numbers, the first active one (the first assigned while
          # none is active) — every number is in numbers.
          sender_value: nil,
          # Where this market's sender stands, in terms of who is holding it up —
          # PROVISIONING, ACTION_NEEDED, PENDING_REVIEW or ACTIVE. Read-only.
          #
          # Resolved rather than reported raw: a live sender reads ACTIVE whatever it still
          # owes, a market with outstanding requirements or an open resubmission request
          # reads ACTION_NEEDED, and a market that registers with a regime reads
          # PENDING_REVIEW once its brand exists — filing to The Campaign Registry is ours
          # to do and need not have happened yet, so a dedicated brand created through this
          # API reads PENDING_REVIEW from the moment it is stored.
          #
          # Describes whether the market can send, not each number: a market holding several
          # numbers reads ACTIVE as soon as one of them is, whatever the others are doing.
          # Each number's own status is in numbers.
          status: nil
        )
        end

        sig do
          override.returns(
            {
              compliance: T.nilable(Sentdm::Channels::SMSMarket::Compliance),
              country: T.nilable(String),
              number_type: T.nilable(String),
              numbers: T::Array[Sentdm::Channels::SMSNumber],
              reason: T.nilable(String),
              reason_code: T.nilable(String),
              sender_value: T.nilable(String),
              status:
                T.nilable(Sentdm::Channels::SMSMarket::Status::TaggedSymbol)
            }
          )
        end
        def to_hash
        end

        class Compliance < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Channels::SMSMarket::Compliance,
                Sentdm::Internal::AnyHash
              )
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
              T.nilable(
                T::Array[Sentdm::Channels::SMSMarket::Compliance::Document]
              )
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
                  T::Array[
                    Sentdm::Channels::SMSMarket::Compliance::Document::OrHash
                  ]
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
                  T.nilable(
                    T::Array[Sentdm::Channels::SMSMarket::Compliance::Document]
                  )
              }
            )
          end
          def to_hash
          end

          class Document < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Channels::SMSMarket::Compliance::Document,
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

        # Where this market's sender stands, in terms of who is holding it up —
        # PROVISIONING, ACTION_NEEDED, PENDING_REVIEW or ACTIVE. Read-only.
        #
        # Resolved rather than reported raw: a live sender reads ACTIVE whatever it still
        # owes, a market with outstanding requirements or an open resubmission request
        # reads ACTION_NEEDED, and a market that registers with a regime reads
        # PENDING_REVIEW once its brand exists — filing to The Campaign Registry is ours
        # to do and need not have happened yet, so a dedicated brand created through this
        # API reads PENDING_REVIEW from the moment it is stored.
        #
        # Describes whether the market can send, not each number: a market holding several
        # numbers reads ACTIVE as soon as one of them is, whatever the others are doing.
        # Each number's own status is in numbers.
        module Status
          extend Sentdm::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Sentdm::Channels::SMSMarket::Status) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PROVISIONING =
            T.let(
              :PROVISIONING,
              Sentdm::Channels::SMSMarket::Status::TaggedSymbol
            )
          ACTION_NEEDED =
            T.let(
              :ACTION_NEEDED,
              Sentdm::Channels::SMSMarket::Status::TaggedSymbol
            )
          PENDING_REVIEW =
            T.let(
              :PENDING_REVIEW,
              Sentdm::Channels::SMSMarket::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(:ACTIVE, Sentdm::Channels::SMSMarket::Status::TaggedSymbol)
          INACTIVE =
            T.let(:INACTIVE, Sentdm::Channels::SMSMarket::Status::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Sentdm::Channels::SMSMarket::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
