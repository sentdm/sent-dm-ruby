# typed: strong

module Sentdm
  module Models
    module Channels
      class SMSNumber < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::SMSNumber, Sentdm::Internal::AnyHash)
          end

        # The number's area code, e.g. 212. While the number is still to be assigned, the
        # area code it was asked for, or null when it was asked for in any area code.
        sig { returns(T.nilable(String)) }
        attr_accessor :area_code

        # The campaign the number is on, or is owed for: the id of its entry in
        # compliance.campaigns. Omitted for a market that registers no campaigns, and
        # where the campaign is not known — a number recorded without one, or one owed on
        # a campaign inherited from the organization.
        sig { returns(T.nilable(String)) }
        attr_accessor :campaign_id

        # The number, or null while it is still to be assigned.
        sig { returns(T.nilable(String)) }
        attr_accessor :sender_value

        # ACTIVE once the number can send; PROVISIONING while it is still to be assigned;
        # INACTIVE once it could send and no longer can.
        sig { returns(T.nilable(String)) }
        attr_accessor :status

        # One number of an SMS market.
        sig do
          params(
            area_code: T.nilable(String),
            campaign_id: T.nilable(String),
            sender_value: T.nilable(String),
            status: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The number's area code, e.g. 212. While the number is still to be assigned, the
          # area code it was asked for, or null when it was asked for in any area code.
          area_code: nil,
          # The campaign the number is on, or is owed for: the id of its entry in
          # compliance.campaigns. Omitted for a market that registers no campaigns, and
          # where the campaign is not known — a number recorded without one, or one owed on
          # a campaign inherited from the organization.
          campaign_id: nil,
          # The number, or null while it is still to be assigned.
          sender_value: nil,
          # ACTIVE once the number can send; PROVISIONING while it is still to be assigned;
          # INACTIVE once it could send and no longer can.
          status: nil
        )
        end

        sig do
          override.returns(
            {
              area_code: T.nilable(String),
              campaign_id: T.nilable(String),
              sender_value: T.nilable(String),
              status: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
