# typed: strong

module SentDm
  module Models
    class OrganizationRetrieveProfilesResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SentDm::Models::OrganizationRetrieveProfilesResponse,
            SentDm::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :organization_id

      sig { params(organization_id: String).void }
      attr_writer :organization_id

      sig { returns(T.nilable(T::Array[SentDm::ProfileSummary])) }
      attr_reader :profiles

      sig { params(profiles: T::Array[SentDm::ProfileSummary::OrHash]).void }
      attr_writer :profiles

      sig do
        params(
          organization_id: String,
          profiles: T::Array[SentDm::ProfileSummary::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(organization_id: nil, profiles: nil)
      end

      sig do
        override.returns(
          {
            organization_id: String,
            profiles: T::Array[SentDm::ProfileSummary]
          }
        )
      end
      def to_hash
      end
    end
  end
end
