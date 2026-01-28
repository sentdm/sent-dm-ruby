# typed: strong

module Sentdm
  module Models
    module Organizations
      class UserUpdateRoleParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Organizations::UserUpdateRoleParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :customer_id

        sig { returns(T.nilable(String)) }
        attr_reader :role

        sig { params(role: String).void }
        attr_writer :role

        sig do
          params(
            customer_id: String,
            role: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(customer_id:, role: nil, request_options: {})
        end

        sig do
          override.returns(
            {
              customer_id: String,
              role: String,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
