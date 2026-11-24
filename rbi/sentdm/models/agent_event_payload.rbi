# typed: strong

module Sentdm
  module Models
    class AgentEventPayload < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::AgentEventPayload, Sentdm::Internal::AnyHash)
        end

      # The agent service's event id. The same event is never delivered under two ids.
      sig { returns(String) }
      attr_accessor :event_id

      # When the agent service recorded it, UTC, to the millisecond.
      sig { returns(String) }
      attr_accessor :occurred_at

      # The sender profile the agent runs on.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      # Who caused it: system, the agent service's customer, or an approver.
      sig { returns(T.nilable(String)) }
      attr_accessor :actor

      # The agent.
      sig { returns(T.nilable(String)) }
      attr_reader :agent_id

      sig { params(agent_id: String).void }
      attr_writer :agent_id

      # The agent's name, as it is listed. Absent for an agent services no longer holds.
      sig { returns(T.nilable(String)) }
      attr_accessor :agent_name

      # The version of the agent the event is of: the one its conversation runs, or the
      # active one for an event of the agent itself. Absent when the agent service does
      # not say it.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :agent_version

      # The contact of that conversation; absent on agent-level events.
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_id

      # The contact's phone number, in E.164, so a receiver knows who the event is about
      # without asking for the contact. Read from the account's contacts as the webhook
      # is built: the agent service's own record names a contact by id only. Absent on
      # agent-level events, and for a contact the account no longer holds.
      sig { returns(T.nilable(String)) }
      attr_accessor :contact_phone_number

      # The event's own fields (outcome, reason, ...), exactly as the agent service
      # recorded them.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :data

      sig { params(data: T.anything).void }
      attr_writer :data

      # The conversation (agent × contact) the event belongs to; absent on agent-level
      # events.
      sig { returns(T.nilable(String)) }
      attr_accessor :instance_id

      # Where the event stands among the agent's events: a number that grows with each,
      # so two events of the same second are put in order by it. Not a count: there are
      # gaps between an agent's own. Absent from an agent service that does not say it.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :sequence

      # Body of an agent.\* webhook (Sent Agents). The event is the agent service's own
      # record, forwarded without renaming: EventId is its id, so a subscriber can
      # dedupe a redelivery.
      sig do
        params(
          event_id: String,
          occurred_at: String,
          account_id: String,
          actor: T.nilable(String),
          agent_id: String,
          agent_name: T.nilable(String),
          agent_version: T.nilable(Integer),
          contact_id: T.nilable(String),
          contact_phone_number: T.nilable(String),
          data: T.anything,
          instance_id: T.nilable(String),
          sequence: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # The agent service's event id. The same event is never delivered under two ids.
        event_id:,
        # When the agent service recorded it, UTC, to the millisecond.
        occurred_at:,
        # The sender profile the agent runs on.
        account_id: nil,
        # Who caused it: system, the agent service's customer, or an approver.
        actor: nil,
        # The agent.
        agent_id: nil,
        # The agent's name, as it is listed. Absent for an agent services no longer holds.
        agent_name: nil,
        # The version of the agent the event is of: the one its conversation runs, or the
        # active one for an event of the agent itself. Absent when the agent service does
        # not say it.
        agent_version: nil,
        # The contact of that conversation; absent on agent-level events.
        contact_id: nil,
        # The contact's phone number, in E.164, so a receiver knows who the event is about
        # without asking for the contact. Read from the account's contacts as the webhook
        # is built: the agent service's own record names a contact by id only. Absent on
        # agent-level events, and for a contact the account no longer holds.
        contact_phone_number: nil,
        # The event's own fields (outcome, reason, ...), exactly as the agent service
        # recorded them.
        data: nil,
        # The conversation (agent × contact) the event belongs to; absent on agent-level
        # events.
        instance_id: nil,
        # Where the event stands among the agent's events: a number that grows with each,
        # so two events of the same second are put in order by it. Not a count: there are
        # gaps between an agent's own. Absent from an agent service that does not say it.
        sequence: nil
      )
      end

      sig do
        override.returns(
          {
            event_id: String,
            occurred_at: String,
            account_id: String,
            actor: T.nilable(String),
            agent_id: String,
            agent_name: T.nilable(String),
            agent_version: T.nilable(Integer),
            contact_id: T.nilable(String),
            contact_phone_number: T.nilable(String),
            data: T.anything,
            instance_id: T.nilable(String),
            sequence: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
