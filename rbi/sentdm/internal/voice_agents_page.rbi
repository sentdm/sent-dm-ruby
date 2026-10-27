# typed: strong

module Sentdm
  module Internal
    class VoiceAgentsPage
      include Sentdm::Internal::Type::BasePage

      Elem = type_member

      sig { returns(Data) }
      attr_accessor :data

      # @api private
      sig { returns(String) }
      def inspect
      end

      class Data < Sentdm::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(Data, Sentdm::Internal::AnyHash) }

        sig { returns(T.nilable(T::Array[T.anything])) }
        attr_reader :agents

        sig { params(agents: T::Array[T.anything]).void }
        attr_writer :agents

        sig { returns(T.nilable(Data::Pagination)) }
        attr_reader :pagination

        sig { params(pagination: Data::Pagination::OrHash).void }
        attr_writer :pagination

        sig do
          params(
            agents: T::Array[T.anything],
            pagination: Data::Pagination::OrHash
          ).returns(T.attached_class)
        end
        def self.new(agents: nil, pagination: nil)
        end

        sig do
          override.returns(
            { agents: T::Array[T.anything], pagination: Data::Pagination }
          )
        end
        def to_hash
        end

        class Pagination < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(Data::Pagination, Sentdm::Internal::AnyHash) }

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :has_more

          sig { params(has_more: T::Boolean).void }
          attr_writer :has_more

          sig { params(has_more: T::Boolean).returns(T.attached_class) }
          def self.new(has_more: nil)
          end

          sig { override.returns({ has_more: T::Boolean }) }
          def to_hash
          end
        end
      end
    end
  end
end
