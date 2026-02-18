# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::ProfilesTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Prism tests are disabled")

    response = @sent_dm.profiles.create

    assert_pattern do
      response => Sentdm::APIResponseOfProfileDetail
    end

    assert_pattern do
      response => {
        data: Sentdm::ProfileDetail | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @sent_dm.profiles.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Sentdm::APIResponseOfProfileDetail
    end

    assert_pattern do
      response => {
        data: Sentdm::ProfileDetail | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @sent_dm.profiles.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Sentdm::APIResponseOfProfileDetail
    end

    assert_pattern do
      response => {
        data: Sentdm::ProfileDetail | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @sent_dm.profiles.list

    assert_pattern do
      response => Sentdm::Models::ProfileListResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ProfileListResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @sent_dm.profiles.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => nil
    end
  end

  def test_complete_required_params
    skip("Prism tests are disabled")

    response =
      @sent_dm.profiles.complete(
        "660e8400-e29b-41d4-a716-446655440000",
        web_hook_url: "https://your-app.com/webhook/profile-complete"
      )

    assert_pattern do
      response => Sentdm::Internal::Type::Unknown
    end
  end
end
