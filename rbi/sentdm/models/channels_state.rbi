# typed: strong

module Sentdm
  module Models
    class ChannelsState < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::ChannelsState, Sentdm::Internal::AnyHash) }

      # Which customer these channels belong to — the key's own, or the profile named in
      # x-profile-id.
      #
      # Same reason the brand carries one: as the response to /v3/channels there is no
      # other id in the document, and under x-profile-id this is the profile the call
      # resolved to rather than the caller. Absent when nested inside a sender profile,
      # whose own id already says whose they are.
      sig { returns(T.nilable(String)) }
      attr_accessor :customer_id

      # The markets this profile can send MMS in, one entry per country, or empty when
      # none.
      #
      # Appears alongside sms rather than replacing an entry in it: the two are separate
      # senders on the same number and a caller needs to see both — a market can be live
      # for SMS while its MMS row is still provisioning, or MMS-incapable entirely
      # because the market's sender-type SKU does not carry it.
      sig { returns(T.nilable(T::Array[Sentdm::MmsMarket])) }
      attr_reader :mms

      sig { params(mms: T::Array[Sentdm::MmsMarket::OrHash]).void }
      attr_writer :mms

      # An RCS agent as its owner sees it: the order form back, plus where the
      # submission stands.
      #
      # Not RcsSenderResponse. That one is the admin projection and carries the pipeline
      # we track about a customer's request — internalStatus, statusReason, isLaunched —
      # and the S3 keys behind the assets. None of that is the customer's to read: an
      # internal status is a note to ourselves, and an S3 key is a storage detail that
      # would become a contract the moment it was published.
      #
      # What is here is what the caller sent, in the names it sent them under, plus the
      # three things only we can answer: the record's id, its status, and the number it
      # sends from. So a read after a write shows the form as stored rather than as
      # echoed.
      sig { returns(T.nilable(Sentdm::Channels::RcsAgent)) }
      attr_reader :rcs

      sig { params(rcs: T.nilable(Sentdm::Channels::RcsAgent::OrHash)).void }
      attr_writer :rcs

      sig { returns(T.nilable(T::Array[Sentdm::ChannelsState::SMS])) }
      attr_reader :sms

      sig { params(sms: T::Array[Sentdm::ChannelsState::SMS::OrHash]).void }
      attr_writer :sms

      # The numbers this profile carries phone calls on, one entry per number, or empty
      # when none. Voice is per number like an SMS market is per country: each number is
      # its own channel row, turned on and off on its own, and one of them is the line
      # app-originated calls fall back to.
      sig { returns(T.nilable(T::Array[Sentdm::Channels::VoiceNumber])) }
      attr_reader :voice

      sig do
        params(voice: T::Array[Sentdm::Channels::VoiceNumber::OrHash]).void
      end
      attr_writer :voice

      # The profile's WhatsApp account. Its status is Meta's verification state.
      sig { returns(T.nilable(Sentdm::Channels::WhatsappChannel)) }
      attr_reader :whatsapp

      sig do
        params(
          whatsapp: T.nilable(Sentdm::Channels::WhatsappChannel::OrHash)
        ).void
      end
      attr_writer :whatsapp

      # The channels a profile sends on. SMS is a list because a profile can send in
      # several markets; WhatsApp and RCS are single, because a profile has one business
      # account and one agent.
      sig do
        params(
          customer_id: T.nilable(String),
          mms: T::Array[Sentdm::MmsMarket::OrHash],
          rcs: T.nilable(Sentdm::Channels::RcsAgent::OrHash),
          sms: T::Array[Sentdm::ChannelsState::SMS::OrHash],
          voice: T::Array[Sentdm::Channels::VoiceNumber::OrHash],
          whatsapp: T.nilable(Sentdm::Channels::WhatsappChannel::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Which customer these channels belong to — the key's own, or the profile named in
        # x-profile-id.
        #
        # Same reason the brand carries one: as the response to /v3/channels there is no
        # other id in the document, and under x-profile-id this is the profile the call
        # resolved to rather than the caller. Absent when nested inside a sender profile,
        # whose own id already says whose they are.
        customer_id: nil,
        # The markets this profile can send MMS in, one entry per country, or empty when
        # none.
        #
        # Appears alongside sms rather than replacing an entry in it: the two are separate
        # senders on the same number and a caller needs to see both — a market can be live
        # for SMS while its MMS row is still provisioning, or MMS-incapable entirely
        # because the market's sender-type SKU does not carry it.
        mms: nil,
        # An RCS agent as its owner sees it: the order form back, plus where the
        # submission stands.
        #
        # Not RcsSenderResponse. That one is the admin projection and carries the pipeline
        # we track about a customer's request — internalStatus, statusReason, isLaunched —
        # and the S3 keys behind the assets. None of that is the customer's to read: an
        # internal status is a note to ourselves, and an S3 key is a storage detail that
        # would become a contract the moment it was published.
        #
        # What is here is what the caller sent, in the names it sent them under, plus the
        # three things only we can answer: the record's id, its status, and the number it
        # sends from. So a read after a write shows the form as stored rather than as
        # echoed.
        rcs: nil,
        sms: nil,
        # The numbers this profile carries phone calls on, one entry per number, or empty
        # when none. Voice is per number like an SMS market is per country: each number is
        # its own channel row, turned on and off on its own, and one of them is the line
        # app-originated calls fall back to.
        voice: nil,
        # The profile's WhatsApp account. Its status is Meta's verification state.
        whatsapp: nil
      )
      end

      sig do
        override.returns(
          {
            customer_id: T.nilable(String),
            mms: T::Array[Sentdm::MmsMarket],
            rcs: T.nilable(Sentdm::Channels::RcsAgent),
            sms: T::Array[Sentdm::ChannelsState::SMS],
            voice: T::Array[Sentdm::Channels::VoiceNumber],
            whatsapp: T.nilable(Sentdm::Channels::WhatsappChannel)
          }
        )
      end
      def to_hash
      end

      class SMS < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::ChannelsState::SMS, Sentdm::Internal::AnyHash)
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
            compliance: T.nilable(Sentdm::Channels::SuppliedCompliance::OrHash)
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
          returns(T.nilable(Sentdm::ChannelsState::SMS::Status::TaggedSymbol))
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
            compliance: T.nilable(Sentdm::Channels::SuppliedCompliance::OrHash),
            country: T.nilable(String),
            number_type: T.nilable(String),
            numbers: T::Array[Sentdm::Channels::SMSNumber::OrHash],
            reason: T.nilable(String),
            reason_code: T.nilable(String),
            status: T.nilable(Sentdm::ChannelsState::SMS::Status::OrSymbol)
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
                T.nilable(Sentdm::ChannelsState::SMS::Status::TaggedSymbol)
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
            T.type_alias { T.all(Symbol, Sentdm::ChannelsState::SMS::Status) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # We are working on it and there is nothing for you to do — a number is being procured, or a registration is being assembled. Minutes to hours.
          PROVISIONING =
            T.let(
              :PROVISIONING,
              Sentdm::ChannelsState::SMS::Status::TaggedSymbol
            )

          # **Waiting on you.** Something the market asks for has not been supplied, a regulator rejected what was, or we have asked you to correct and resubmit your identity data. Nothing progresses until you act. For an SMS market, `GET /v3/channels/sms/{country}/{type}` names what it wants and `PATCH` on the same path supplies it — compliance values, documents and numbers alike.
          ACTION_NEEDED =
            T.let(
              :ACTION_NEEDED,
              Sentdm::ChannelsState::SMS::Status::TaggedSymbol
            )

          # With a regulator or carrier — filed, or assembled and queued for us to file — and their answer is what moves it, to `ACTIVE` or back to `ACTION_NEEDED`. Nothing on your side changes it. Days for SMS, weeks for RCS.
          PENDING_REVIEW =
            T.let(
              :PENDING_REVIEW,
              Sentdm::ChannelsState::SMS::Status::TaggedSymbol
            )

          # Can carry traffic now. A channel a sender profile runs on its organization's reads `ACTIVE` too — it sends, which is what the field is about.
          ACTIVE =
            T.let(:ACTIVE, Sentdm::ChannelsState::SMS::Status::TaggedSymbol)

          # **It had a working sender and no longer does** — the number was released, or the campaign it carried lapsed. Distinct from `PROVISIONING`, which means it has never sent yet: the same absence of a sender, opposite news. Sends will fail until it returns to `ACTIVE`.
          INACTIVE =
            T.let(:INACTIVE, Sentdm::ChannelsState::SMS::Status::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Sentdm::ChannelsState::SMS::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
