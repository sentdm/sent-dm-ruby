# typed: strong

module SentDm
  module Models
    class ContactListResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::Models::ContactListResponse, SentDm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(SentDm::Models::ContactListResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(SentDm::Models::ContactListResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error details (null if successful)
      sig { returns(T.nilable(SentDm::APIError)) }
      attr_reader :error

      sig { params(error: T.nilable(SentDm::APIError::OrHash)).void }
      attr_writer :error

      # Metadata about the request and response
      sig { returns(T.nilable(SentDm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: SentDm::APIMeta::OrHash).void }
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(SentDm::Models::ContactListResponse::Data::OrHash),
          error: T.nilable(SentDm::APIError::OrHash),
          meta: SentDm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The response data (null if error)
        data: nil,
        # Error details (null if successful)
        error: nil,
        # Metadata about the request and response
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(SentDm::Models::ContactListResponse::Data),
            error: T.nilable(SentDm::APIError),
            meta: SentDm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SentDm::Models::ContactListResponse::Data,
              SentDm::Internal::AnyHash
            )
          end

        # List of contacts
        sig { returns(T.nilable(T::Array[SentDm::Contact])) }
        attr_reader :contacts

        sig { params(contacts: T::Array[SentDm::Contact::OrHash]).void }
        attr_writer :contacts

        # Pagination metadata
        sig { returns(T.nilable(SentDm::PaginationMeta)) }
        attr_reader :pagination

        sig { params(pagination: SentDm::PaginationMeta::OrHash).void }
        attr_writer :pagination

        # The response data (null if error)
        sig do
          params(
            contacts: T::Array[SentDm::Contact::OrHash],
            pagination: SentDm::PaginationMeta::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # List of contacts
          contacts: nil,
          # Pagination metadata
          pagination: nil
        )
        end

        sig do
          override.returns(
            {
              contacts: T::Array[SentDm::Contact],
              pagination: SentDm::PaginationMeta
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
