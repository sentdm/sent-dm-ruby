# typed: strong

module Sentdm
  module Models
    module Channels
      class SMSNumberRequest < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::SMSNumberRequest, Sentdm::Internal::AnyHash)
          end

        # The area code, e.g. 212, validated against the request's country. Omit it for
        # numbers in any area code.
        sig { returns(T.nilable(String)) }
        attr_accessor :area_code

        # How many numbers. At least 1; omitted means 1.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :quantity

        # One entry of numbers: how many numbers to assign in one area code, or in any
        # area code when AreaCode is omitted.
        sig do
          params(
            area_code: T.nilable(String),
            quantity: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # The area code, e.g. 212, validated against the request's country. Omit it for
          # numbers in any area code.
          area_code: nil,
          # How many numbers. At least 1; omitted means 1.
          quantity: nil
        )
        end

        sig do
          override.returns(
            { area_code: T.nilable(String), quantity: T.nilable(Integer) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
