# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::ProfilesTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.profiles.create

    assert_pattern do
      response => Sentdm::APIResponseOfProfileDetail
    end

    assert_pattern do
      response => {
        data: Sentdm::ProfileDetail | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.profiles.retrieve("profileId")

    assert_pattern do
      response => Sentdm::APIResponseOfProfileDetail
    end

    assert_pattern do
      response => {
        data: Sentdm::ProfileDetail | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.profiles.update("profileId")

    assert_pattern do
      response => Sentdm::APIResponseOfProfileDetail
    end

    assert_pattern do
      response => {
        data: Sentdm::ProfileDetail | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
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
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @sent.profiles.delete("profileId", body: {})

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
      response => Sentdm::Internal::Type::Unknown
    end
  end
end
