# typed: strong

module SentDm
  module Models
    class OrganizationListResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SentDm::Models::OrganizationListResponse,
            SentDm::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(
            T::Array[SentDm::Models::OrganizationListResponse::Organization]
          )
        )
      end
      attr_reader :organizations

      sig do
        params(
          organizations:
            T::Array[
              SentDm::Models::OrganizationListResponse::Organization::OrHash
            ]
        ).void
      end
      attr_writer :organizations

      sig do
        params(
          organizations:
            T::Array[
              SentDm::Models::OrganizationListResponse::Organization::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(organizations: nil)
      end

      sig do
        override.returns(
          {
            organizations:
              T::Array[SentDm::Models::OrganizationListResponse::Organization]
          }
        )
      end
      def to_hash
      end

      class Organization < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SentDm::Models::OrganizationListResponse::Organization,
              SentDm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig { returns(T.nilable(String)) }
        attr_accessor :description

        sig { returns(T.nilable(String)) }
        attr_accessor :icon

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(T::Array[SentDm::ProfileSummary])) }
        attr_reader :profiles

        sig { params(profiles: T::Array[SentDm::ProfileSummary::OrHash]).void }
        attr_writer :profiles

        sig do
          params(
            id: String,
            created_at: Time,
            description: T.nilable(String),
            icon: T.nilable(String),
            name: String,
            profiles: T::Array[SentDm::ProfileSummary::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          created_at: nil,
          description: nil,
          icon: nil,
          name: nil,
          profiles: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              description: T.nilable(String),
              icon: T.nilable(String),
              name: String,
              profiles: T::Array[SentDm::ProfileSummary]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
