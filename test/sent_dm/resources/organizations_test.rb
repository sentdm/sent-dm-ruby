# frozen_string_literal: true

require_relative "../test_helper"

class SentDm::Test::Resources::OrganizationsTest < SentDm::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @sent_dm.organizations.list

    assert_pattern do
      response => SentDm::Models::OrganizationListResponse
    end

    assert_pattern do
      response => {
        organizations: ^(SentDm::Internal::Type::ArrayOf[SentDm::Models::OrganizationListResponse::Organization]) | nil
      }
    end
  end

  def test_retrieve_profiles
    skip("Prism tests are disabled")

    response = @sent_dm.organizations.retrieve_profiles("6ba7b810-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => SentDm::Models::OrganizationRetrieveProfilesResponse
    end

    assert_pattern do
      response => {
        organization_id: String | nil,
        profiles: ^(SentDm::Internal::Type::ArrayOf[SentDm::ProfileSummary]) | nil
      }
    end
  end
end
