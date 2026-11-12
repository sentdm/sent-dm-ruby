# typed: strong

module Sentdm
  module Models
    class MessageButton < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::MessageButton, Sentdm::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_accessor :postback_data

      sig { returns(T.nilable(String)) }
      attr_accessor :text

      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      sig { returns(T.nilable(String)) }
      attr_reader :value

      sig { params(value: String).void }
      attr_writer :value

      sig do
        params(
          postback_data: T.nilable(String),
          text: T.nilable(String),
          type: String,
          value: String
        ).returns(T.attached_class)
      end
      def self.new(postback_data: nil, text: nil, type: nil, value: nil)
      end

      sig do
        override.returns(
          {
            postback_data: T.nilable(String),
            text: T.nilable(String),
            type: String,
            value: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
