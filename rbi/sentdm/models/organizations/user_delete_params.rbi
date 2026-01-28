# typed: strong

module Sentdm
  module Models
    module Organizations
      class UserDeleteParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Organizations::UserDeleteParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :customer_id

        sig do
          params(
            customer_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(customer_id:, request_options: {})
        end

        sig do
          override.returns(
            { customer_id: String, request_options: Sentdm::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
