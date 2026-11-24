# typed: strong

module Sentdm
  module Models
    module Channels
      class MarketNumber < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::MarketNumber, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :area_code

        # The campaign the number belongs to (US TEN_DLC); null otherwise.
        sig { returns(T.nilable(String)) }
        attr_accessor :campaign_id

        # The number, or the sender id; null until it is assigned.
        sig { returns(T.nilable(String)) }
        attr_accessor :sender_value

        # ACTIVE, PROVISIONING or INACTIVE.
        sig { returns(T.nilable(String)) }
        attr_accessor :status

        # The market's sender type, e.g. TEN_DLC, LOCAL.
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        # One number the customer holds, or is still owed.
        sig do
          params(
            area_code: T.nilable(String),
            campaign_id: T.nilable(String),
            sender_value: T.nilable(String),
            status: T.nilable(String),
            type: String
          ).returns(T.attached_class)
        end
        def self.new(
          area_code: nil,
          # The campaign the number belongs to (US TEN_DLC); null otherwise.
          campaign_id: nil,
          # The number, or the sender id; null until it is assigned.
          sender_value: nil,
          # ACTIVE, PROVISIONING or INACTIVE.
          status: nil,
          # The market's sender type, e.g. TEN_DLC, LOCAL.
          type: nil
        )
        end

        sig do
          override.returns(
            {
              area_code: T.nilable(String),
              campaign_id: T.nilable(String),
              sender_value: T.nilable(String),
              status: T.nilable(String),
              type: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
