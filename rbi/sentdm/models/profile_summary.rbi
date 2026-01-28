# typed: strong

module Sentdm
  module Models
    class ProfileSummary < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ProfileSummary, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig { returns(T.nilable(String)) }
      attr_accessor :icon

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      sig do
        params(
          id: String,
          created_at: Time,
          description: T.nilable(String),
          icon: T.nilable(String),
          name: String,
          short_name: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        id: nil,
        created_at: nil,
        description: nil,
        icon: nil,
        name: nil,
        short_name: nil
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
            short_name: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
