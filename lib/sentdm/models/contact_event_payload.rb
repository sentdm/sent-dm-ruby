# frozen_string_literal: true

module Sentdm
  module Models
    class ContactEventPayload < Sentdm::Internal::Type::BaseModel
      # @!attribute opt_out
      #   Whether the contact is opted out after this signal — the state to write to your
      #   own record. Same meaning as opt_out on the contact resource. On contact.help
      #   this reports the contact's existing state, which help does not change.
      #
      #   Two signals from the same contact can arrive out of order, because each one is
      #   queued on its own rather than against the contact. Compare the envelope's
      #   timestamp before you overwrite a newer state with an older one. That timestamp
      #   is second-precision, so treat two signals stamped in the same second as
      #   unordered and read the contact resource to settle them.
      #
      #   @return [Boolean]
      required :opt_out, Sentdm::Internal::Type::Boolean

      # @!attribute source
      #   How the signal reached us. INBOUND_KEYWORD means the contact sent a message
      #   whose text matched one of the keywords; PROVIDER_SIGNAL means the network
      #   reported it. A provider signal usually carries no message_id or text, so read
      #   both for null rather than inferring them from this field.
      #
      #   @return [String]
      required :source, String

      # @!attribute account_id
      #   The account the contact belongs to. Present so one endpoint can serve several
      #   accounts.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute channel
      #   The channel the signal arrived on, for example sms or whatsapp.
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute contact_id
      #   The contact who raised the signal. Always populated, including for contact.help
      #   from a number you have not messaged before — the contact is created if it does
      #   not exist yet, so this identifier is always resolvable against the contacts API.
      #
      #   @return [String, nil]
      optional :contact_id, String

      # @!attribute message_id
      #   The inbound message that carried the signal, matching message_id on the
      #   corresponding message.received event so the two can be joined.
      #
      #   Sent as null when the signal did not arrive as a message — for example when a
      #   network processed an opt-out on your behalf — and also when the message belongs
      #   to a different account than this event, which can happen on a shared WhatsApp
      #   number. The field is always present, so read it and check for null rather than
      #   checking whether the key exists.
      #
      #   @return [String, nil]
      optional :message_id, String, nil?: true

      # @!attribute phone_number
      #   The contact's number in E.164 format. Same value as phone_number on the contact
      #   resource.
      #
      #   @return [String, nil]
      optional :phone_number, String

      # @!attribute text
      #   The text the contact sent, for example STOP or UNSUBSCRIBE. Sent as null when
      #   the signal did not arrive as text. The field is always present, so read it and
      #   check for null rather than checking whether the key exists.
      #
      #   @return [String, nil]
      optional :text, String, nil?: true

      # @!method initialize(opt_out:, source:, account_id: nil, channel: nil, contact_id: nil, message_id: nil, phone_number: nil, text: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ContactEventPayload} for more details.
      #
      #   Body of a contact.opt_in, contact.opt_out or contact.help event. Delivered when
      #   a contact signals a consent change or asks for help.
      #
      #   These events state the signal outright, so you do not have to recognise keywords
      #   in the text of a message.received event. They also cover cases that produce no
      #   inbound message at all, such as a network handling an opt-out on your behalf.
      #
      #   Fields are ordered identity → resulting state → provenance → join key. Nothing
      #   here restates the envelope: which of the three signals occurred is the
      #   envelope's event, and when it was emitted is its timestamp. Retries carry the
      #   same X-Webhook-Event-ID header, which is what to deduplicate on.
      #
      #   @param opt_out [Boolean] Whether the contact is opted out after this signal — the state to write to your
      #
      #   @param source [String] How the signal reached us. INBOUND_KEYWORD means the contact sent a message whos
      #
      #   @param account_id [String] The account the contact belongs to. Present so one endpoint can serve several ac
      #
      #   @param channel [String] The channel the signal arrived on, for example sms or whatsapp.
      #
      #   @param contact_id [String] The contact who raised the signal. Always populated, including for contact.help
      #
      #   @param message_id [String, nil] The inbound message that carried the signal, matching message_id on the
      #
      #   @param phone_number [String] The contact's number in E.164 format. Same value as phone_number on the contact
      #
      #   @param text [String, nil] The text the contact sent, for example STOP or UNSUBSCRIBE. Sent as
    end
  end
end
