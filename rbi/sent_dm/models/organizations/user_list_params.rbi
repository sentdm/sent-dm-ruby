# typed: strong

module SentDm
  module Models
    module Organizations
      class UserListParams < SentDm::Internal::Type::BaseModel
        extend SentDm::Internal::Type::RequestParameters::Converter
        include SentDm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SentDm::Organizations::UserListParams,
              SentDm::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :page

        sig { returns(Integer) }
        attr_accessor :page_size

        sig do
          params(
            page: Integer,
            page_size: Integer,
            request_options: SentDm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(page:, page_size:, request_options: {})
        end

        sig do
          override.returns(
            {
              page: Integer,
              page_size: Integer,
              request_options: SentDm::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
