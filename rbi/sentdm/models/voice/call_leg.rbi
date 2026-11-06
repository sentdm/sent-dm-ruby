# typed: strong

module Sentdm
  module Models
    module Voice
      class CallLeg < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::CallLeg, Sentdm::Internal::AnyHash)
          end

        # The whole minutes the leg was billed for
        sig { returns(T.nilable(Integer)) }
        attr_reader :billed_minutes

        sig { params(billed_minutes: Integer).void }
        attr_writer :billed_minutes

        # What the leg cost, in the same unit as the call's price
        sig { returns(T.nilable(Float)) }
        attr_reader :cost

        sig { params(cost: Float).void }
        attr_writer :cost

        # The currency of the cost: USD
        sig { returns(T.nilable(String)) }
        attr_reader :currency

        sig { params(currency: String).void }
        attr_writer :currency

        # inbound for the caller's leg to your number, outbound for a leg placed on your
        # behalf
        sig { returns(T.nilable(String)) }
        attr_reader :direction

        sig { params(direction: String).void }
        attr_writer :direction

        # The phone number the leg reached, in E.164 format: your number for the inbound
        # leg, the number dialed for an outbound one. Null for a leg to one of your app
        # users or a room
        sig { returns(T.nilable(String)) }
        attr_accessor :number

        # One leg of a call the price covers
        sig do
          params(
            billed_minutes: Integer,
            cost: Float,
            currency: String,
            direction: String,
            number: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The whole minutes the leg was billed for
          billed_minutes: nil,
          # What the leg cost, in the same unit as the call's price
          cost: nil,
          # The currency of the cost: USD
          currency: nil,
          # inbound for the caller's leg to your number, outbound for a leg placed on your
          # behalf
          direction: nil,
          # The phone number the leg reached, in E.164 format: your number for the inbound
          # leg, the number dialed for an outbound one. Null for a leg to one of your app
          # users or a room
          number: nil
        )
        end

        sig do
          override.returns(
            {
              billed_minutes: Integer,
              cost: Float,
              currency: String,
              direction: String,
              number: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
