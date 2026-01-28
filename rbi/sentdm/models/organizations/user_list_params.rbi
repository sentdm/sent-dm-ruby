# typed: strong

module Sentdm
  module Models
    module Organizations
      class UserListParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Organizations::UserListParams,
              Sentdm::Internal::AnyHash
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
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(page:, page_size:, request_options: {})
        end

        sig do
          override.returns(
            {
              page: Integer,
              page_size: Integer,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
