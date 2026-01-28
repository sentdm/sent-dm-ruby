# typed: strong

module Sentdm
  module Models
    class OrganizationRetrieveProfilesResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::OrganizationRetrieveProfilesResponse,
            Sentdm::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :organization_id

      sig { params(organization_id: String).void }
      attr_writer :organization_id

      sig { returns(T.nilable(T::Array[Sentdm::ProfileSummary])) }
      attr_reader :profiles

      sig { params(profiles: T::Array[Sentdm::ProfileSummary::OrHash]).void }
      attr_writer :profiles

      sig do
        params(
          organization_id: String,
          profiles: T::Array[Sentdm::ProfileSummary::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(organization_id: nil, profiles: nil)
      end

      sig do
        override.returns(
          {
            organization_id: String,
            profiles: T::Array[Sentdm::ProfileSummary]
          }
        )
      end
      def to_hash
      end
    end
  end
end
