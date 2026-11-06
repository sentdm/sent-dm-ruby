# typed: strong

module Sentdm
  module Models
    class ComplianceRequirements < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ComplianceRequirements, Sentdm::Internal::AnyHash)
        end

      # Channel the requirements apply to — sms, whatsapp or rcs.
      #
      # Echoed so the document says which channel it describes. It always described one:
      # setup's last step is a specific channel path, and every type is an SMS sender
      # type — but a caller reading the payload had to infer that from the path to know
      # it.
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # ISO 3166-1 alpha-2 country the requirements apply to.
      sig { returns(T.nilable(String)) }
      attr_reader :country

      sig { params(country: String).void }
      attr_writer :country

      # Whether this market demands anything before a sender can be registered. When
      # false, the compliance array may be omitted entirely and the profile is ready
      # once provisioned.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :required

      sig { params(required: T::Boolean).void }
      attr_writer :required

      # Values to supply in compliance. Empty when the market demands nothing. Values
      # Sent supplies on your behalf are never listed, and neither are ones it derives
      # from what you send.
      sig { returns(T.nilable(T::Array[Sentdm::ComplianceRequirement])) }
      attr_reader :requirements

      sig do
        params(
          requirements: T::Array[Sentdm::ComplianceRequirement::OrHash]
        ).void
      end
      attr_writer :requirements

      # Pattern the sender's own value must match, where the market dictates one —
      # alphanumeric sender ids and short codes. Null when the value is
      # carrier-assigned.
      sig { returns(T.nilable(String)) }
      attr_accessor :sender_id_pattern

      # The calls that set this market up, in the order they have to be made, each
      # carrying a body that can be sent as it stands.
      #
      # This is the answer to "what do I actually do". Requirements describes each value
      # the market wants; this assembles those descriptions into the requests that
      # supply them, so a caller — or an agent acting for one — copies a body out and
      # sends it rather than building one from a table.
      #
      # The last step is always the channel itself, and it is where the regime's own
      # values are supplied. The one before it, where there is one, is the brand a
      # registering market files against — so it is a step of its own and the channel
      # call refuses until it exists. A market that registers with nobody has one step.
      sig { returns(T.nilable(T::Array[Sentdm::ComplianceSetupStep])) }
      attr_reader :setup

      sig { params(setup: T::Array[Sentdm::ComplianceSetupStep::OrHash]).void }
      attr_writer :setup

      # Sender type the requirements apply to.
      #
      # Non-nullable while sms is the only channel answered here, because it is the only
      # channel whose senders have a type — the day another one is answered, this
      # becomes nullable along with it. Not nullable in advance: nothing can emit null
      # today, and publishing a shape the API never sends is the same mistake as
      # publishing a field it does not have.
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # Everything a market expects of a sender, for one channel, country and sender
      # type.
      sig do
        params(
          channel: String,
          country: String,
          required: T::Boolean,
          requirements: T::Array[Sentdm::ComplianceRequirement::OrHash],
          sender_id_pattern: T.nilable(String),
          setup: T::Array[Sentdm::ComplianceSetupStep::OrHash],
          type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Channel the requirements apply to — sms, whatsapp or rcs.
        #
        # Echoed so the document says which channel it describes. It always described one:
        # setup's last step is a specific channel path, and every type is an SMS sender
        # type — but a caller reading the payload had to infer that from the path to know
        # it.
        channel: nil,
        # ISO 3166-1 alpha-2 country the requirements apply to.
        country: nil,
        # Whether this market demands anything before a sender can be registered. When
        # false, the compliance array may be omitted entirely and the profile is ready
        # once provisioned.
        required: nil,
        # Values to supply in compliance. Empty when the market demands nothing. Values
        # Sent supplies on your behalf are never listed, and neither are ones it derives
        # from what you send.
        requirements: nil,
        # Pattern the sender's own value must match, where the market dictates one —
        # alphanumeric sender ids and short codes. Null when the value is
        # carrier-assigned.
        sender_id_pattern: nil,
        # The calls that set this market up, in the order they have to be made, each
        # carrying a body that can be sent as it stands.
        #
        # This is the answer to "what do I actually do". Requirements describes each value
        # the market wants; this assembles those descriptions into the requests that
        # supply them, so a caller — or an agent acting for one — copies a body out and
        # sends it rather than building one from a table.
        #
        # The last step is always the channel itself, and it is where the regime's own
        # values are supplied. The one before it, where there is one, is the brand a
        # registering market files against — so it is a step of its own and the channel
        # call refuses until it exists. A market that registers with nobody has one step.
        setup: nil,
        # Sender type the requirements apply to.
        #
        # Non-nullable while sms is the only channel answered here, because it is the only
        # channel whose senders have a type — the day another one is answered, this
        # becomes nullable along with it. Not nullable in advance: nothing can emit null
        # today, and publishing a shape the API never sends is the same mistake as
        # publishing a field it does not have.
        type: nil
      )
      end

      sig do
        override.returns(
          {
            channel: String,
            country: String,
            required: T::Boolean,
            requirements: T::Array[Sentdm::ComplianceRequirement],
            sender_id_pattern: T.nilable(String),
            setup: T::Array[Sentdm::ComplianceSetupStep],
            type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
