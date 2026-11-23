# typed: strong

module Sentdm
  module Models
    module Channels
      class SMSCreateResponse < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::Channels::SMSCreateResponse,
              Sentdm::Internal::AnyHash
            )
          end

        # One market the profile sends in on a channel — its sender, where that sender
        # stands, and what the market wants. Named for no one channel, as the routes it
        # answers are not (/v3/channels/{channel}/{country}/{type}); SMS is the channel
        # with markets today.
        #
        # A profile may send in several: it is a tenant, not a market. Each carries its
        # own status, because a profile can be live in one country and mid-registration in
        # another — and each carries what it still owes, rather than that being reported
        # in a separate array a caller has to join on.
        sig do
          returns(T.nilable(Sentdm::Models::Channels::SMSCreateResponse::Data))
        end
        attr_reader :data

        sig do
          params(
            data:
              T.nilable(
                Sentdm::Models::Channels::SMSCreateResponse::Data::OrHash
              )
          ).void
        end
        attr_writer :data

        # Error information
        sig { returns(T.nilable(Sentdm::ErrorDetail)) }
        attr_reader :error

        sig { params(error: T.nilable(Sentdm::ErrorDetail::OrHash)).void }
        attr_writer :error

        # Request and response metadata
        sig { returns(T.nilable(Sentdm::APIMeta)) }
        attr_reader :meta

        sig { params(meta: Sentdm::APIMeta::OrHash).void }
        attr_writer :meta

        # Indicates whether the request was successful
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :success

        sig { params(success: T::Boolean).void }
        attr_writer :success

        # Standard API response envelope for all v3 endpoints
        sig do
          params(
            data:
              T.nilable(
                Sentdm::Models::Channels::SMSCreateResponse::Data::OrHash
              ),
            error: T.nilable(Sentdm::ErrorDetail::OrHash),
            meta: Sentdm::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # One market the profile sends in on a channel — its sender, where that sender
          # stands, and what the market wants. Named for no one channel, as the routes it
          # answers are not (/v3/channels/{channel}/{country}/{type}); SMS is the channel
          # with markets today.
          #
          # A profile may send in several: it is a tenant, not a market. Each carries its
          # own status, because a profile can be live in one country and mid-registration in
          # another — and each carries what it still owes, rather than that being reported
          # in a separate array a caller has to join on.
          data: nil,
          # Error information
          error: nil,
          # Request and response metadata
          meta: nil,
          # Indicates whether the request was successful
          success: nil
        )
        end

        sig do
          override.returns(
            {
              data:
                T.nilable(Sentdm::Models::Channels::SMSCreateResponse::Data),
              error: T.nilable(Sentdm::ErrorDetail),
              meta: Sentdm::APIMeta,
              success: T::Boolean
            }
          )
        end
        def to_hash
        end

        class Data < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::Channels::SMSCreateResponse::Data,
                Sentdm::Internal::AnyHash
              )
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
          sig { returns(T.nilable(Sentdm::Channels::SuppliedCompliance)) }
          attr_reader :compliance

          sig do
            params(
              compliance:
                T.nilable(Sentdm::Channels::SuppliedCompliance::OrHash)
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
            returns(
              T.nilable(
                Sentdm::Models::Channels::SMSCreateResponse::Data::Status::TaggedSymbol
              )
            )
          end
          attr_accessor :status

          # One market the profile sends in on a channel — its sender, where that sender
          # stands, and what the market wants. Named for no one channel, as the routes it
          # answers are not (/v3/channels/{channel}/{country}/{type}); SMS is the channel
          # with markets today.
          #
          # A profile may send in several: it is a tenant, not a market. Each carries its
          # own status, because a profile can be live in one country and mid-registration in
          # another — and each carries what it still owes, rather than that being reported
          # in a separate array a caller has to join on.
          sig do
            params(
              compliance:
                T.nilable(Sentdm::Channels::SuppliedCompliance::OrHash),
              country: T.nilable(String),
              number_type: T.nilable(String),
              numbers: T::Array[Sentdm::Channels::SMSNumber::OrHash],
              reason: T.nilable(String),
              reason_code: T.nilable(String),
              status:
                T.nilable(
                  Sentdm::Models::Channels::SMSCreateResponse::Data::Status::OrSymbol
                )
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
                compliance: T.nilable(Sentdm::Channels::SuppliedCompliance),
                country: T.nilable(String),
                number_type: T.nilable(String),
                numbers: T::Array[Sentdm::Channels::SMSNumber],
                reason: T.nilable(String),
                reason_code: T.nilable(String),
                status:
                  T.nilable(
                    Sentdm::Models::Channels::SMSCreateResponse::Data::Status::TaggedSymbol
                  )
              }
            )
          end
          def to_hash
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
              T.type_alias do
                T.all(
                  Symbol,
                  Sentdm::Models::Channels::SMSCreateResponse::Data::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # We are working on it and there is nothing for you to do — a number is being procured, or a registration is being assembled. Minutes to hours.
            PROVISIONING =
              T.let(
                :PROVISIONING,
                Sentdm::Models::Channels::SMSCreateResponse::Data::Status::TaggedSymbol
              )

            # **Waiting on you.** Something the market asks for has not been supplied, a regulator rejected what was, or we have asked you to correct and resubmit your identity data. Nothing progresses until you act. For an SMS market, `GET /v3/channels/sms/{country}/{type}` names what it wants and `PATCH` on the same path supplies it — compliance values, documents and numbers alike.
            ACTION_NEEDED =
              T.let(
                :ACTION_NEEDED,
                Sentdm::Models::Channels::SMSCreateResponse::Data::Status::TaggedSymbol
              )

            # With a regulator or carrier — filed, or assembled and queued for us to file — and their answer is what moves it, to `ACTIVE` or back to `ACTION_NEEDED`. Nothing on your side changes it. Days for SMS, weeks for RCS.
            PENDING_REVIEW =
              T.let(
                :PENDING_REVIEW,
                Sentdm::Models::Channels::SMSCreateResponse::Data::Status::TaggedSymbol
              )

            # Can carry traffic now. A channel a sender profile runs on its organization's reads `ACTIVE` too — it sends, which is what the field is about.
            ACTIVE =
              T.let(
                :ACTIVE,
                Sentdm::Models::Channels::SMSCreateResponse::Data::Status::TaggedSymbol
              )

            # **It had a working sender and no longer does** — the number was released, or the campaign it carried lapsed. Distinct from `PROVISIONING`, which means it has never sent yet: the same absence of a sender, opposite news. Sends will fail until it returns to `ACTIVE`.
            INACTIVE =
              T.let(
                :INACTIVE,
                Sentdm::Models::Channels::SMSCreateResponse::Data::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Sentdm::Models::Channels::SMSCreateResponse::Data::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
