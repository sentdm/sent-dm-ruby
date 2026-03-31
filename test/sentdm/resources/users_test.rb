# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::UsersTest < Sentdm::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.users.retrieve("userId")

    assert_pattern do
      response => Sentdm::APIResponseOfUser
    end

    assert_pattern do
      response => {
        data: Sentdm::UserResponse | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.users.list

    assert_pattern do
      response => Sentdm::Models::UserListResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::UserListResponse::Data | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_invite
    skip("Mock server tests are disabled")

    response = @sent.users.invite

    assert_pattern do
      response => Sentdm::APIResponseOfUser
    end

    assert_pattern do
      response => {
        data: Sentdm::UserResponse | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_remove_required_params
    skip("Mock server tests are disabled")

    response = @sent.users.remove("userId", body: {})

    assert_pattern do
      response => nil
    end
  end

  def test_update_role
    skip("Mock server tests are disabled")

    response = @sent.users.update_role("userId")

    assert_pattern do
      response => Sentdm::APIResponseOfUser
    end

    assert_pattern do
      response => {
        data: Sentdm::UserResponse | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
