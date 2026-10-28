# typed: strong

module Sentdm
  module Models
    VoiceAgentsList = Voice::VoiceAgentsList

    module Voice
      class VoiceAgentsList < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceAgentsList, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(T::Array[Sentdm::Voice::VoiceAgent])) }
        attr_reader :agents

        sig { params(agents: T::Array[Sentdm::Voice::VoiceAgent::OrHash]).void }
        attr_writer :agents

        # Pagination metadata for list responses
        sig { returns(T.nilable(Sentdm::PaginationMeta)) }
        attr_reader :pagination

        sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
        attr_writer :pagination

        # A page of the account's agents. The agent itself is VoiceAgentResponse, shared
        # with the admin API.
        sig do
          params(
            agents: T::Array[Sentdm::Voice::VoiceAgent::OrHash],
            pagination: Sentdm::PaginationMeta::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          agents: nil,
          # Pagination metadata for list responses
          pagination: nil
        )
        end

        sig do
          override.returns(
            {
              agents: T::Array[Sentdm::Voice::VoiceAgent],
              pagination: Sentdm::PaginationMeta
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
