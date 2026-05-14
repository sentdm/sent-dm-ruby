# typed: strong

module Sentdm
  module Models
    class Template < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::Template, Sentdm::Internal::AnyHash) }

      # Unique template identifier
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Template category: MARKETING, UTILITY, AUTHENTICATION
      sig { returns(T.nilable(String)) }
      attr_reader :category

      sig { params(category: String).void }
      attr_writer :category

      # Supported channels: sms, whatsapp
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :channels

      # When the template was created
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Whether the template is published and active
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_published

      sig { params(is_published: T::Boolean).void }
      attr_writer :is_published

      # Template language code (e.g., en_US)
      sig { returns(T.nilable(String)) }
      attr_reader :language

      sig { params(language: String).void }
      attr_writer :language

      # Template display name
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Template status: APPROVED, PENDING, REJECTED
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # When the template was last updated
      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      # Template variables for personalization
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :variables

      # Template response for v3 API
      sig do
        params(
          id: String,
          category: String,
          channels: T.nilable(T::Array[String]),
          created_at: Time,
          is_published: T::Boolean,
          language: String,
          name: String,
          status: String,
          updated_at: T.nilable(Time),
          variables: T.nilable(T::Array[String])
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique template identifier
        id: nil,
        # Template category: MARKETING, UTILITY, AUTHENTICATION
        category: nil,
        # Supported channels: sms, whatsapp
        channels: nil,
        # When the template was created
        created_at: nil,
        # Whether the template is published and active
        is_published: nil,
        # Template language code (e.g., en_US)
        language: nil,
        # Template display name
        name: nil,
        # Template status: APPROVED, PENDING, REJECTED
        status: nil,
        # When the template was last updated
        updated_at: nil,
        # Template variables for personalization
        variables: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            category: String,
            channels: T.nilable(T::Array[String]),
            created_at: Time,
            is_published: T::Boolean,
            language: String,
            name: String,
            status: String,
            updated_at: T.nilable(Time),
            variables: T.nilable(T::Array[String])
          }
        )
      end
      def to_hash
      end
    end
  end
end
