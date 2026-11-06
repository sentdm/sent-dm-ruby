# typed: strong

module Sentdm
  module Models
    module Channels
      class RcsAddress < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::RcsAddress, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :city

        sig { returns(T.nilable(String)) }
        attr_accessor :country

        sig { returns(T.nilable(String)) }
        attr_accessor :postal_code

        sig { returns(T.nilable(String)) }
        attr_accessor :state

        sig { returns(T.nilable(String)) }
        attr_accessor :street

        # The registered address of the company behind the agent.
        sig do
          params(
            city: T.nilable(String),
            country: T.nilable(String),
            postal_code: T.nilable(String),
            state: T.nilable(String),
            street: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          city: nil,
          country: nil,
          postal_code: nil,
          state: nil,
          street: nil
        )
        end

        sig do
          override.returns(
            {
              city: T.nilable(String),
              country: T.nilable(String),
              postal_code: T.nilable(String),
              state: T.nilable(String),
              street: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
