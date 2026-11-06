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

      sig { returns(T.nilable(T::Array[Sentdm::Channels::SMSMarket])) }
      attr_reader :sms

      sig { params(sms: T::Array[Sentdm::Channels::SMSMarket::OrHash]).void }
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
          sms: T::Array[Sentdm::Channels::SMSMarket::OrHash],
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
            sms: T::Array[Sentdm::Channels::SMSMarket],
            voice: T::Array[Sentdm::Channels::VoiceNumber],
            whatsapp: T.nilable(Sentdm::Channels::WhatsappChannel)
          }
        )
      end
      def to_hash
      end
    end
  end
end
