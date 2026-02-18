# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::UsersTest < Sentdm::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @sent_dm.users.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Sentdm::APIResponseOfUser
    end

    assert_pattern do
      response => {
        data: Sentdm::UserResponse | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @sent_dm.users.list

    assert_pattern do
      response => Sentdm::Models::UserListResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::UserListResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_invite
    skip("Prism tests are disabled")

    response = @sent_dm.users.invite

    assert_pattern do
      response => Sentdm::APIResponseOfUser
    end

    assert_pattern do
      response => {
        data: Sentdm::UserResponse | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_remove
    skip("Prism tests are disabled")

    response = @sent_dm.users.remove("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => nil
    end
  end

  def test_update_role
    skip("Prism tests are disabled")

    response = @sent_dm.users.update_role("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Sentdm::APIResponseOfUser
    end

    assert_pattern do
      response => {
        data: Sentdm::UserResponse | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
