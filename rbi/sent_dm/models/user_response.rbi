# typed: strong

module SentDm
  module Models
    class UserResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(SentDm::UserResponse, SentDm::Internal::AnyHash) }

      # User unique identifier
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # When the user was added to the organization
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # User email address
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # When the user was invited
      sig { returns(T.nilable(Time)) }
      attr_accessor :invited_at

      # When the user last logged in
      sig { returns(T.nilable(Time)) }
      attr_accessor :last_login_at

      # User full name
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # User role in the organization: admin, billing, developer
      sig { returns(T.nilable(String)) }
      attr_reader :role

      sig { params(role: String).void }
      attr_writer :role

      # User status: active, invited, suspended, rejected
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # When the user record was last updated
      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      # User response for v3 API
      sig do
        params(
          id: String,
          created_at: Time,
          email: String,
          invited_at: T.nilable(Time),
          last_login_at: T.nilable(Time),
          name: String,
          role: String,
          status: String,
          updated_at: T.nilable(Time)
        ).returns(T.attached_class)
      end
      def self.new(
        # User unique identifier
        id: nil,
        # When the user was added to the organization
        created_at: nil,
        # User email address
        email: nil,
        # When the user was invited
        invited_at: nil,
        # When the user last logged in
        last_login_at: nil,
        # User full name
        name: nil,
        # User role in the organization: admin, billing, developer
        role: nil,
        # User status: active, invited, suspended, rejected
        status: nil,
        # When the user record was last updated
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            email: String,
            invited_at: T.nilable(Time),
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
