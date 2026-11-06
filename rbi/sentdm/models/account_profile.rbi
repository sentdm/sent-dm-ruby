# typed: strong

module Sentdm
  module Models
    class AccountProfile < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::AccountProfile, Sentdm::Internal::AnyHash)
        end

      # Profile unique identifier
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # When the profile was created
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Profile description
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Profile icon URL
      sig { returns(T.nilable(String)) }
      attr_accessor :icon

      # Profile name
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # User's role in this profile: admin, billing, developer (inherited from
      # organization if not explicitly set)
      sig { returns(T.nilable(String)) }
      attr_accessor :role

      # Profile configuration settings
      sig { returns(T.nilable(Sentdm::ProfileSettings)) }
      attr_reader :settings

      sig { params(settings: Sentdm::ProfileSettings::OrHash).void }
      attr_writer :settings

      # Profile short name (abbreviation)
      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # Profile setup status: incomplete, pending_review, approved, rejected
      sig { returns(T.nilable(String)) }
      attr_accessor :status

      # Profile (sender profile) response for v3 API
      sig do
        params(
          id: String,
          created_at: Time,
          description: T.nilable(String),
          icon: T.nilable(String),
          name: String,
          role: T.nilable(String),
          settings: Sentdm::ProfileSettings::OrHash,
          short_name: T.nilable(String),
          status: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Profile unique identifier
        id: nil,
        # When the profile was created
        created_at: nil,
        # Profile description
        description: nil,
        # Profile icon URL
        icon: nil,
        # Profile name
        name: nil,
        # User's role in this profile: admin, billing, developer (inherited from
        # organization if not explicitly set)
        role: nil,
        # Profile configuration settings
        settings: nil,
        # Profile short name (abbreviation)
        short_name: nil,
        # Profile setup status: incomplete, pending_review, approved, rejected
        status: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            description: T.nilable(String),
            icon: T.nilable(String),
            name: String,
            role: T.nilable(String),
            settings: Sentdm::ProfileSettings,
            short_name: T.nilable(String),
            status: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
