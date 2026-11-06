# typed: strong

module Sentdm
  module Models
    class MmsMarket < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::MmsMarket, Sentdm::Internal::AnyHash) }

      # ISO-3166 alpha-2 of the market.
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # The sender type the market sends from, mirroring the SMS sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :number_type

      # The sending number. Null while the market is still being provisioned.
      sig { returns(T.nilable(String)) }
      attr_accessor :sender_value

      # Where this market's MMS sender stands. Read-only.
      sig { returns(T.nilable(String)) }
      attr_accessor :status

      # One market the profile can send MMS in.
      #
      # Deliberately not SmsMarketState: an MMS market carries no compliance of its own.
      # It is the same number, carrier and registration as the SMS market on it in that
      # country — MMS files nothing separately — so a compliance block here would always
      # be null and would invite the question of what an MMS market owes. It owes what
      # the SMS market owes, reported there.
      sig do
        params(
          country: T.nilable(String),
          number_type: T.nilable(String),
          sender_value: T.nilable(String),
          status: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # ISO-3166 alpha-2 of the market.
        country: nil,
        # The sender type the market sends from, mirroring the SMS sender.
        number_type: nil,
        # The sending number. Null while the market is still being provisioned.
        sender_value: nil,
        # Where this market's MMS sender stands. Read-only.
        status: nil
      )
      end

      sig do
        override.returns(
          {
            country: T.nilable(String),
            number_type: T.nilable(String),
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
