# typed: strong

module Sentdm
  module Models
    class ContactEventPayload < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ContactEventPayload, Sentdm::Internal::AnyHash)
        end

      # Whether the contact is opted out after this signal — the state to write to your
      # own record. Same meaning as opt_out on the contact resource. On contact.help
      # this reports the contact's existing state, which help does not change.
      #
      # Two signals from the same contact can arrive out of order, because each one is
      # queued on its own rather than against the contact. Compare the envelope's
      # timestamp before you overwrite a newer state with an older one. That timestamp
      # is second-precision, so treat two signals stamped in the same second as
      # unordered and read the contact resource to settle them.
      sig { returns(T::Boolean) }
      attr_accessor :opt_out

      # How the signal reached us. INBOUND_KEYWORD means the contact sent a message
      # whose text matched one of the keywords; PROVIDER_SIGNAL means the network
      # reported it. A provider signal usually carries no message_id or text, so read
      # both for null rather than inferring them from this field.
      sig { returns(String) }
      attr_accessor :source

      # The account the contact belongs to. Present so one endpoint can serve several
      # accounts.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      # The channel the signal arrived on, for example sms or whatsapp.
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # The contact who raised the signal. Always populated, including for contact.help
      # from a number you have not messaged before — the contact is created if it does
      # not exist yet, so this identifier is always resolvable against the contacts API.
      sig { returns(T.nilable(String)) }
      attr_reader :contact_id

      sig { params(contact_id: String).void }
      attr_writer :contact_id

      # The inbound message that carried the signal, matching message_id on the
      # corresponding message.received event so the two can be joined.
      #
      # Sent as null when the signal did not arrive as a message — for example when a
      # network processed an opt-out on your behalf — and also when the message belongs
      # to a different account than this event, which can happen on a shared WhatsApp
      # number. The field is always present, so read it and check for null rather than
      # checking whether the key exists.
      sig { returns(T.nilable(String)) }
      attr_accessor :message_id

      # The contact's number in E.164 format. Same value as phone_number on the contact
      # resource.
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number

      sig { params(phone_number: String).void }
      attr_writer :phone_number

      # The text the contact sent, for example STOP or UNSUBSCRIBE. Sent as null when
      # the signal did not arrive as text. The field is always present, so read it and
      # check for null rather than checking whether the key exists.
      sig { returns(T.nilable(String)) }
      attr_accessor :text

      # Body of a contact.opt_in, contact.opt_out or contact.help event. Delivered when
      # a contact signals a consent change or asks for help.
      #
      # These events state the signal outright, so you do not have to recognise keywords
      # in the text of a message.received event. They also cover cases that produce no
      # inbound message at all, such as a network handling an opt-out on your behalf.
      #
      # Fields are ordered identity → resulting state → provenance → join key. Nothing
      # here restates the envelope: which of the three signals occurred is the
      # envelope's event, and when it was emitted is its timestamp. Retries carry the
      # same X-Webhook-Event-ID header, which is what to deduplicate on.
      sig do
        params(
          opt_out: T::Boolean,
          source: String,
          account_id: String,
          channel: String,
          contact_id: String,
          message_id: T.nilable(String),
          phone_number: String,
          text: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether the contact is opted out after this signal — the state to write to your
        # own record. Same meaning as opt_out on the contact resource. On contact.help
        # this reports the contact's existing state, which help does not change.
        #
        # Two signals from the same contact can arrive out of order, because each one is
        # queued on its own rather than against the contact. Compare the envelope's
        # timestamp before you overwrite a newer state with an older one. That timestamp
        # is second-precision, so treat two signals stamped in the same second as
        # unordered and read the contact resource to settle them.
        opt_out:,
        # How the signal reached us. INBOUND_KEYWORD means the contact sent a message
        # whose text matched one of the keywords; PROVIDER_SIGNAL means the network
        # reported it. A provider signal usually carries no message_id or text, so read
        # both for null rather than inferring them from this field.
        source:,
        # The account the contact belongs to. Present so one endpoint can serve several
        # accounts.
        account_id: nil,
        # The channel the signal arrived on, for example sms or whatsapp.
        channel: nil,
        # The contact who raised the signal. Always populated, including for contact.help
        # from a number you have not messaged before — the contact is created if it does
        # not exist yet, so this identifier is always resolvable against the contacts API.
        contact_id: nil,
        # The inbound message that carried the signal, matching message_id on the
        # corresponding message.received event so the two can be joined.
        #
        # Sent as null when the signal did not arrive as a message — for example when a
        # network processed an opt-out on your behalf — and also when the message belongs
        # to a different account than this event, which can happen on a shared WhatsApp
        # number. The field is always present, so read it and check for null rather than
        # checking whether the key exists.
        message_id: nil,
        # The contact's number in E.164 format. Same value as phone_number on the contact
        # resource.
        phone_number: nil,
        # The text the contact sent, for example STOP or UNSUBSCRIBE. Sent as null when
        # the signal did not arrive as text. The field is always present, so read it and
        # check for null rather than checking whether the key exists.
        text: nil
      )
      end

      sig do
        override.returns(
          {
            opt_out: T::Boolean,
            source: String,
            account_id: String,
            channel: String,
            contact_id: String,
            message_id: T.nilable(String),
            phone_number: String,
            text: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
