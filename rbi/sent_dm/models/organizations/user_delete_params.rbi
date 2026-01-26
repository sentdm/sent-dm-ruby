# typed: strong

module SentDm
  module Models
    module Organizations
      class UserDeleteParams < SentDm::Internal::Type::BaseModel
        extend SentDm::Internal::Type::RequestParameters::Converter
        include SentDm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SentDm::Organizations::UserDeleteParams,
              SentDm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :customer_id

        sig do
          params(
            customer_id: String,
            request_options: SentDm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(customer_id:, request_options: {})
        end

        sig do
          override.returns(
            { customer_id: String, request_options: SentDm::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
