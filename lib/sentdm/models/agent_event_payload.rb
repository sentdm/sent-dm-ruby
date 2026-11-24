# frozen_string_literal: true

module Sentdm
  module Models
    class AgentEventPayload < Sentdm::Internal::Type::BaseModel
      # @!attribute event_id
      #   The agent service's event id. The same event is never delivered under two ids.
      #
      #   @return [String]
      required :event_id, String

      # @!attribute occurred_at
      #   When the agent service recorded it, UTC, to the millisecond.
      #
      #   @return [String]
      required :occurred_at, String

      # @!attribute account_id
      #   The sender profile the agent runs on.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute actor
      #   Who caused it: system, the agent service's customer, or an approver.
      #
      #   @return [String, nil]
      optional :actor, String, nil?: true

      # @!attribute agent_id
      #   The agent.
      #
      #   @return [String, nil]
      optional :agent_id, String

      # @!attribute agent_name
      #   The agent's name, as it is listed. Absent for an agent services no longer holds.
      #
      #   @return [String, nil]
      optional :agent_name, String, nil?: true

      # @!attribute agent_version
      #   The version of the agent the event is of: the one its conversation runs, or the
      #   active one for an event of the agent itself. Absent when the agent service does
      #   not say it.
      #
      #   @return [Integer, nil]
      optional :agent_version, Integer, nil?: true

      # @!attribute contact_id
      #   The contact of that conversation; absent on agent-level events.
      #
      #   @return [String, nil]
      optional :contact_id, String, nil?: true

      # @!attribute contact_phone_number
      #   The contact's phone number, in E.164, so a receiver knows who the event is about
      #   without asking for the contact. Read from the account's contacts as the webhook
      #   is built: the agent service's own record names a contact by id only. Absent on
      #   agent-level events, and for a contact the account no longer holds.
      #
      #   @return [String, nil]
      optional :contact_phone_number, String, nil?: true

      # @!attribute data
      #   The event's own fields (outcome, reason, ...), exactly as the agent service
      #   recorded them.
      #
      #   @return [Object, nil]
      optional :data, Sentdm::Internal::Type::Unknown

      # @!attribute instance_id
      #   The conversation (agent × contact) the event belongs to; absent on agent-level
      #   events.
      #
      #   @return [String, nil]
      optional :instance_id, String, nil?: true

      # @!attribute sequence
      #   Where the event stands among the agent's events: a number that grows with each,
      #   so two events of the same second are put in order by it. Not a count: there are
      #   gaps between an agent's own. Absent from an agent service that does not say it.
      #
      #   @return [Integer, nil]
      optional :sequence, Integer, nil?: true

      # @!method initialize(event_id:, occurred_at:, account_id: nil, actor: nil, agent_id: nil, agent_name: nil, agent_version: nil, contact_id: nil, contact_phone_number: nil, data: nil, instance_id: nil, sequence: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::AgentEventPayload} for more details.
      #
      #   Body of an agent.\* webhook (Sent Agents). The event is the agent service's own
      #   record, forwarded without renaming: EventId is its id, so a subscriber can
      #   dedupe a redelivery.
      #
      #   @param event_id [String] The agent service's event id. The same event is never delivered under two ids.
      #
      #   @param occurred_at [String] When the agent service recorded it, UTC, to the millisecond.
      #
      #   @param account_id [String] The sender profile the agent runs on.
      #
      #   @param actor [String, nil] Who caused it: system, the agent service's customer, or an approver.
      #
      #   @param agent_id [String] The agent.
      #
      #   @param agent_name [String, nil] The agent's name, as it is listed. Absent for an agent services no longer holds.
      #
      #   @param agent_version [Integer, nil] The version of the agent the event is of: the one its conversation runs, or the
      #
      #   @param contact_id [String, nil] The contact of that conversation; absent on agent-level events.
      #
      #   @param contact_phone_number [String, nil] The contact's phone number, in E.164, so a receiver knows who the event is about
      #
      #   @param data [Object] The event's own fields (outcome, reason, ...), exactly as the agent service reco
      #
      #   @param instance_id [String, nil] The conversation (agent × contact) the event belongs to; absent on agent-level e
      #
      #   @param sequence [Integer, nil] Where the event stands among the agent's events: a number that grows with each,
    end
  end
end
