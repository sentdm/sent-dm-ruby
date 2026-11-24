# typed: strong

module Sentdm
  module Models
    module Channels
      class MarketNumbers < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::MarketNumbers, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :channel

        sig { params(channel: String).void }
        attr_writer :channel

        # ISO 3166-1 alpha-2, uppercase.
        sig { returns(T.nilable(String)) }
        attr_reader :country

        sig { params(country: String).void }
        attr_writer :country

        # Empty, never null, when the customer holds nothing there.
        sig { returns(T.nilable(T::Array[Sentdm::Channels::MarketNumber])) }
        attr_reader :numbers

        sig do
          params(numbers: T::Array[Sentdm::Channels::MarketNumber::OrHash]).void
        end
        attr_writer :numbers

        # The numbers a customer holds in one market: GET
        # /v3/channels/{channel}/{country}/{type}/numbers.
        sig do
          params(
            channel: String,
            country: String,
            numbers: T::Array[Sentdm::Channels::MarketNumber::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          channel: nil,
          # ISO 3166-1 alpha-2, uppercase.
          country: nil,
          # Empty, never null, when the customer holds nothing there.
          numbers: nil
        )
        end

        sig do
          override.returns(
            {
              channel: String,
              country: String,
              numbers: T::Array[Sentdm::Channels::MarketNumber]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
