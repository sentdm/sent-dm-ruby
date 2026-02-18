# typed: strong

module Sentdm
  module Models
    module Brands
      class BaseDto < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Brands::BaseDto, Sentdm::Internal::AnyHash)
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

        sig { returns(T.nilable(Time)) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            created_at: Time,
            updated_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier
          id: nil,
          created_at: nil,
          updated_at: nil
        )
        end

        sig do
          override.returns(
            { id: String, created_at: Time, updated_at: T.nilable(Time) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
