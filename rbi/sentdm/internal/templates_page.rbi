# typed: strong

module Sentdm
  module Internal
    class TemplatesPage
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

        sig { returns(T.nilable(Data::Pagination)) }
        attr_reader :pagination

        sig { params(pagination: Data::Pagination::OrHash).void }
        attr_writer :pagination

        sig { returns(T.nilable(T::Array[T.anything])) }
        attr_reader :templates

        sig { params(templates: T::Array[T.anything]).void }
        attr_writer :templates

        sig do
          params(
            pagination: Data::Pagination::OrHash,
            templates: T::Array[T.anything]
          ).returns(T.attached_class)
        end
        def self.new(pagination: nil, templates: nil)
        end

        sig do
          override.returns(
            { pagination: Data::Pagination, templates: T::Array[T.anything] }
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

          sig { returns(T.nilable(Integer)) }
          attr_reader :page

          sig { params(page: Integer).void }
          attr_writer :page

          sig { returns(T.nilable(Integer)) }
          attr_reader :total_pages

          sig { params(total_pages: Integer).void }
          attr_writer :total_pages

          sig do
            params(
              has_more: T::Boolean,
              page: Integer,
              total_pages: Integer
            ).returns(T.attached_class)
          end
          def self.new(has_more: nil, page: nil, total_pages: nil)
          end

          sig do
            override.returns(
              { has_more: T::Boolean, page: Integer, total_pages: Integer }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
