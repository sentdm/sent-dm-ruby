# frozen_string_literal: true

module Sentdm
  module Models
    class ComplianceRequirements < Sentdm::Internal::Type::BaseModel
      # @!attribute channel
      #   Channel the requirements apply to — sms, whatsapp or rcs.
      #
      #   Echoed so the document says which channel it describes. It always described one:
      #   setup's last step is a specific channel path, and every type is an SMS sender
      #   type — but a caller reading the payload had to infer that from the path to know
      #   it.
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute country
      #   ISO 3166-1 alpha-2 country the requirements apply to.
      #
      #   @return [String, nil]
      optional :country, String

      # @!attribute required
      #   Whether this market demands anything before a sender can be registered. When
      #   false, the compliance array may be omitted entirely and the profile is ready
      #   once provisioned.
      #
      #   @return [Boolean, nil]
      optional :required, Sentdm::Internal::Type::Boolean

      # @!attribute requirements
      #   Values to supply in compliance. Empty when the market demands nothing. Values
      #   Sent supplies on your behalf are never listed, and neither are ones it derives
      #   from what you send.
      #
      #   @return [Array<Sentdm::Models::ComplianceRequirement>, nil]
      optional :requirements, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ComplianceRequirement] }

      # @!attribute sender_id_pattern
      #   Pattern the sender's own value must match, where the market dictates one —
      #   alphanumeric sender ids and short codes. Null when the value is
      #   carrier-assigned.
      #
      #   @return [String, nil]
      optional :sender_id_pattern, String, nil?: true

      # @!attribute setup
      #   The calls that set this market up, in the order they have to be made, each
      #   carrying a body that can be sent as it stands.
      #
      #   This is the answer to "what do I actually do". Requirements describes each value
      #   the market wants; this assembles those descriptions into the requests that
      #   supply them, so a caller — or an agent acting for one — copies a body out and
      #   sends it rather than building one from a table.
      #
      #   The last step is always the channel itself, and it is where the regime's own
      #   values are supplied. The one before it, where there is one, is the brand a
      #   registering market files against — so it is a step of its own and the channel
      #   call refuses until it exists. A market that registers with nobody has one step.
      #
      #   @return [Array<Sentdm::Models::ComplianceSetupStep>, nil]
      optional :setup, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ComplianceSetupStep] }

      # @!attribute type
      #   Sender type the requirements apply to.
      #
      #   Non-nullable while sms is the only channel answered here, because it is the only
      #   channel whose senders have a type — the day another one is answered, this
      #   becomes nullable along with it. Not nullable in advance: nothing can emit null
      #   today, and publishing a shape the API never sends is the same mistake as
      #   publishing a field it does not have.
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(channel: nil, country: nil, required: nil, requirements: nil, sender_id_pattern: nil, setup: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ComplianceRequirements} for more details.
      #
      #   Everything a market expects of a sender, for one channel, country and sender
      #   type.
      #
      #   @param channel [String] Channel the requirements apply to — sms, whatsapp or rcs.
      #
      #   @param country [String] ISO 3166-1 alpha-2 country the requirements apply to.
      #
      #   @param required [Boolean] Whether this market demands anything before a sender can be registered. When fal
      #
      #   @param requirements [Array<Sentdm::Models::ComplianceRequirement>] Values to supply in compliance. Empty when the market demands nothing. Values Se
      #
      #   @param sender_id_pattern [String, nil] Pattern the sender's own value must match, where the market dictates one — alpha
      #
      #   @param setup [Array<Sentdm::Models::ComplianceSetupStep>] The calls that set this market up, in the order they have to be made, each carry
      #
      #   @param type [String] Sender type the requirements apply to.
    end
  end
end
