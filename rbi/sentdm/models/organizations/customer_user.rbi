# typed: strong

module Sentdm
  module Models
    module Organizations
      class CustomerUser < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Organizations::CustomerUser,
              Sentdm::Internal::AnyHash
            )
          end

        # Unique identifier
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig { returns(T.nilable(String)) }
        attr_reader :customer_id

        sig { params(customer_id: String).void }
        attr_writer :customer_id

        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        sig { returns(T.nilable(Time)) }
        attr_accessor :invitation_sent_at

        sig { returns(T.nilable(String)) }
        attr_accessor :invitation_token

        sig { returns(T.nilable(Time)) }
        attr_accessor :invitation_token_expires_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_login_at

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :role

        sig { params(role: String).void }
        attr_writer :role

        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        sig { returns(T.nilable(Time)) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            created_at: Time,
            customer_id: String,
            email: String,
            invitation_sent_at: T.nilable(Time),
            invitation_token: T.nilable(String),
            invitation_token_expires_at: T.nilable(Time),
            last_login_at: T.nilable(Time),
            name: String,
            role: String,
            status: String,
            updated_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier
          id: nil,
          created_at: nil,
          customer_id: nil,
          email: nil,
          invitation_sent_at: nil,
          invitation_token: nil,
          invitation_token_expires_at: nil,
          last_login_at: nil,
          name: nil,
          role: nil,
          status: nil,
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              customer_id: String,
              email: String,
              invitation_sent_at: T.nilable(Time),
              invitation_token: T.nilable(String),
              invitation_token_expires_at: T.nilable(Time),
              last_login_at: T.nilable(Time),
              name: String,
              role: String,
              status: String,
              updated_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
