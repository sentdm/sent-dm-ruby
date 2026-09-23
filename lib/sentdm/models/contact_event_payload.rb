# frozen_string_literal: true

module Sentdm
  module Models
    class ContactEventPayload < Sentdm::Internal::Type::BaseModel
      # @!attribute opt_out
      #   Whether the contact is opted out after this signal — the state to write to your
      #   own record. Same meaning as opt_out on the contact resource. On contact.help and
      #   contact.custom_keyword this reports the contact's existing state, which neither
      #   changes.
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

      # @!attribute agent_id
      #   The RCS agent the signal reached, when it reached one.
      #
      #   Omitted entirely on channels that have no agent, rather than sent as null — an
      #   SMS or WhatsApp payload does not carry this key at all. On RCS it is the
      #   counterpart to To: a contact reaches an agent rather than a number, so exactly
      #   one of the two is populated and never both. If you run more than one agent, this
      #   is what tells you which of them the contact acted on.
      #
      #   @return [String, nil]
      optional :agent_id, String, nil?: true

      # @!attribute channel
      #   The channel the signal arrived on, for example sms or whatsapp.
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute contact_id
      #   The contact who raised the signal. Always populated, including for contact.help
      #   or contact.custom_keyword from a number you have not messaged before — the
      #   contact is created if it does not exist yet, so this identifier is always
      #   resolvable against the contacts API.
      #
      #   @return [String, nil]
      optional :contact_id, String

      # @!attribute from
      #   The contact's number, in E.164 format with the leading + — who raised the
      #   signal. The same party message.received publishes as inbound_number.
      #
      #   @return [String, nil]
      optional :from, String

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

      # @!attribute template_id
      #   The auto-reply template whose keyword the contact matched, joinable against the
      #   templates API.
      #
      #   This is what identifies which signal arrived on contact.custom_keyword: every
      #   custom template reports the same event name, so the event alone cannot tell your
      #   booking keyword from your opening-hours one. One template holds as many keywords
      #   as you configured, so this is steadier to switch on than text.
      #
      #   Populated on the compliance sub-types too, where it names the template that
      #   replied. Sent as null when no template was involved — a network-reported opt-out
      #   matches no keyword. The field is always present, so read it and check for null.
      #
      #   @return [String, nil]
      optional :template_id, String, nil?: true

      # @!attribute text
      #   The text the contact sent, for example STOP or UNSUBSCRIBE. Sent as null when
      #   the signal did not arrive as text. The field is always present, so read it and
      #   check for null rather than checking whether the key exists.
      #
      #   @return [String, nil]
      optional :text, String, nil?: true

      # @!attribute to
      #   The number of yours that received the signal, in E.164 format with the leading
      #   +. Tells a multi-number account which of its senders the contact acted on, which
      #   nothing else on this payload answers.
      #
      #   This is your number, not the contact's. That is the opposite of what to means on
      #   POST /v3/messages, where it is the list of recipients you are sending to. Reply
      #   to From, not to this field, or the message goes back to yourself.
      #
      #   Sent as null when the signal did not arrive at a number of yours — an RCS signal
      #   terminates at an agent rather than a number, and a provider-reported opt-out may
      #   name no receiving number at all. The field is always present, so read it and
      #   check for null rather than checking whether the key exists.
      #
      #   @return [String, nil]
      optional :to, String, nil?: true

      # @!method initialize(opt_out:, source:, account_id: nil, agent_id: nil, channel: nil, contact_id: nil, from: nil, message_id: nil, template_id: nil, text: nil, to: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ContactEventPayload} for more details.
      #
      #   Body of a contact.opt_in, contact.opt_out, contact.help or
      #   contact.custom_keyword event. Delivered when a contact signals a consent change,
      #   asks for help, or sends one of your own auto-reply keywords.
      #
      #   These events state the signal outright, so you do not have to recognise keywords
      #   in the text of a message.received event. They also cover cases that produce no
      #   inbound message at all, such as a network handling an opt-out on your behalf.
      #
      #   Two of the four change consent and two do not: contact.help and
      #   contact.custom_keyword report the state the contact already had. Read opt_out
      #   for the state and the envelope's event for what happened, rather than inferring
      #   one from the other.
      #
      #   Fields are ordered identity → resulting state → provenance → join keys. The two
      #   parties are from and to. Note that the message family has not moved to those
      #   names yet — message.received still calls the same two parties inbound_number and
      #   outbound_number. Nothing here restates the envelope: which signal occurred is
      #   the envelope's event, and when it was emitted is its timestamp. Retries carry
      #   the same X-Webhook-Event-ID header, which is what to deduplicate on.
      #
      #   @param opt_out [Boolean] Whether the contact is opted out after this signal — the state to write to your
      #
      #   @param source [String] How the signal reached us. INBOUND_KEYWORD means the contact sent a message whos
      #
      #   @param account_id [String] The account the contact belongs to. Present so one endpoint can serve several ac
      #
      #   @param agent_id [String, nil] The RCS agent the signal reached, when it reached one.
      #
      #   @param channel [String] The channel the signal arrived on, for example sms or whatsapp.
      #
      #   @param contact_id [String] The contact who raised the signal. Always populated, including for contact.help
      #
      #   @param from [String] The contact's number, in E.164 format with the leading + — who raised the signal
      #
      #   @param message_id [String, nil] The inbound message that carried the signal, matching message_id on the
      #
      #   @param template_id [String, nil] The auto-reply template whose keyword the contact matched, joinable against the
      #
      #   @param text [String, nil] The text the contact sent, for example STOP or UNSUBSCRIBE. Sent as
      #
      #   @param to [String, nil] The number of yours that received the signal, in E.164 format with the leading +
    end
  end
end
