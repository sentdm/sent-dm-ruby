# typed: strong

module Sentdm
  module Models
    module Organizations
      class UserInviteParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Organizations::UserInviteParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        sig { returns(T.nilable(String)) }
        attr_accessor :invited_by

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :role

        sig { params(role: String).void }
        attr_writer :role

        sig do
          params(
            email: String,
            invited_by: T.nilable(String),
            name: String,
            role: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          email: nil,
          invited_by: nil,
          name: nil,
          role: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              email: String,
              invited_by: T.nilable(String),
              name: String,
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
