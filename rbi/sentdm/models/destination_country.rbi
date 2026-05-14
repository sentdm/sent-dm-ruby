# typed: strong

module Sentdm
  module Models
    class DestinationCountry < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::DestinationCountry, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_main

      sig { params(is_main: T::Boolean).void }
      attr_writer :is_main

      sig { params(id: String, is_main: T::Boolean).returns(T.attached_class) }
      def self.new(id: nil, is_main: nil)
      end

      sig { override.returns({ id: String, is_main: T::Boolean }) }
      def to_hash
      end
    end
  end
end
