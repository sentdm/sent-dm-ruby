# typed: strong

module SentDm
  module Models
    module Organizations
      class UserListResponse < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SentDm::Models::Organizations::UserListResponse,
              SentDm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :page

        sig { params(page: Integer).void }
        attr_writer :page

        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        sig { returns(T.nilable(Integer)) }
        attr_reader :total_count

        sig { params(total_count: Integer).void }
        attr_writer :total_count

        sig do
          returns(T.nilable(T::Array[SentDm::Organizations::CustomerUser]))
        end
        attr_reader :users

        sig do
          params(
            users: T::Array[SentDm::Organizations::CustomerUser::OrHash]
          ).void
        end
        attr_writer :users

        sig do
          params(
            page: Integer,
            page_size: Integer,
            total_count: Integer,
            users: T::Array[SentDm::Organizations::CustomerUser::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(page: nil, page_size: nil, total_count: nil, users: nil)
        end

        sig do
          override.returns(
            {
              page: Integer,
              page_size: Integer,
              total_count: Integer,
              users: T::Array[SentDm::Organizations::CustomerUser]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
