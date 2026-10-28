# typed: strong

module Sentdm
  module Models
    VoiceAgentPartySpec = Voice::VoiceAgentPartySpec

    module Voice
      class VoiceAgentPartySpec < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceAgentPartySpec, Sentdm::Internal::AnyHash)
          end

        # number, user or agent.
        sig { returns(T.nilable(String)) }
        attr_accessor :kind

        # The E.164 number, the app user's identity, or the agent id (agent\_…).
        sig { returns(T.nilable(String)) }
        attr_accessor :value

        sig do
          params(kind: T.nilable(String), value: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # number, user or agent.
          kind: nil,
          # The E.164 number, the app user's identity, or the agent id (agent\_…).
          value: nil
        )
        end

        sig do
          override.returns(
            { kind: T.nilable(String), value: T.nilable(String) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
