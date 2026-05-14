# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::ProfilesTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.profiles.create

    assert_pattern do
      response => Sentdm::Models::ProfileCreateResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ProfileCreateResponse::Data | nil,
        error: Sentdm::Models::ProfileCreateResponse::Error | nil,
        meta: Sentdm::Models::ProfileCreateResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.profiles.retrieve("profileId")

    assert_pattern do
      response => Sentdm::Models::ProfileRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ProfileRetrieveResponse::Data | nil,
        error: Sentdm::Models::ProfileRetrieveResponse::Error | nil,
        meta: Sentdm::Models::ProfileRetrieveResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.profiles.update("profileId")

    assert_pattern do
      response => Sentdm::Models::ProfileUpdateResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ProfileUpdateResponse::Data | nil,
        error: Sentdm::Models::ProfileUpdateResponse::Error | nil,
        meta: Sentdm::Models::ProfileUpdateResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.profiles.list

    assert_pattern do
      response => Sentdm::Models::ProfileListResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ProfileListResponse::Data | nil,
        error: Sentdm::Models::ProfileListResponse::Error | nil,
        meta: Sentdm::Models::ProfileListResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @sent.profiles.delete("profileId")

    assert_pattern do
      response => nil
    end
  end

  def test_complete_required_params
    skip("Mock server tests are disabled")

    response =
      @sent.profiles.complete(
        "660e8400-e29b-41d4-a716-446655440000",
        web_hook_url: "https://your-app.com/webhook/profile-complete"
      )

    assert_pattern do
      response => Sentdm::Models::ProfileCompleteResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ProfileCompleteResponse::Data | nil,
        error: Sentdm::Models::ProfileCompleteResponse::Error | nil,
        meta: Sentdm::Models::ProfileCompleteResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
