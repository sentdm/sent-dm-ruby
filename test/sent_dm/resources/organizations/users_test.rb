# frozen_string_literal: true

require_relative "../../test_helper"

class SentDm::Test::Resources::Organizations::UsersTest < SentDm::Test::ResourceTest
  def test_retrieve_required_params
    skip("Prism tests are disabled")

    response =
      @sent_dm.organizations.users.retrieve(
        "650e8400-e29b-41d4-a716-446655440000",
        customer_id: "550e8400-e29b-41d4-a716-446655440000"
      )

    assert_pattern do
      response => SentDm::Organizations::CustomerUser
    end

    assert_pattern do
      response => {
        id: String | nil,
        created_at: Time | nil,
        customer_id: String | nil,
        email: String | nil,
        invitation_sent_at: Time | nil,
        invitation_token: String | nil,
        invitation_token_expires_at: Time | nil,
        last_login_at: Time | nil,
        name: String | nil,
        role: String | nil,
        status: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_list_required_params
    skip("Prism tests are disabled")

    response =
      @sent_dm.organizations.users.list("550e8400-e29b-41d4-a716-446655440000", page: 0, page_size: 0)

    assert_pattern do
      response => SentDm::Models::Organizations::UserListResponse
    end

    assert_pattern do
      response => {
        page: Integer | nil,
        page_size: Integer | nil,
        total_count: Integer | nil,
        users: ^(SentDm::Internal::Type::ArrayOf[SentDm::Organizations::CustomerUser]) | nil
      }
    end
  end

  def test_delete_required_params
    skip("Prism tests are disabled")

    response =
      @sent_dm.organizations.users.delete(
        "650e8400-e29b-41d4-a716-446655440000",
        customer_id: "550e8400-e29b-41d4-a716-446655440000"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_invite
    skip("Prism tests are disabled")

    response = @sent_dm.organizations.users.invite("550e8400-e29b-41d4-a716-446655440000")

    assert_pattern do
      response => SentDm::Organizations::CustomerUser
    end

    assert_pattern do
      response => {
        id: String | nil,
        created_at: Time | nil,
        customer_id: String | nil,
        email: String | nil,
        invitation_sent_at: Time | nil,
        invitation_token: String | nil,
        invitation_token_expires_at: Time | nil,
        last_login_at: Time | nil,
        name: String | nil,
        role: String | nil,
        status: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_update_role_required_params
    skip("Prism tests are disabled")

    response =
      @sent_dm.organizations.users.update_role(
        "650e8400-e29b-41d4-a716-446655440000",
        customer_id: "550e8400-e29b-41d4-a716-446655440000"
      )

    assert_pattern do
      response => SentDm::Organizations::CustomerUser
    end

    assert_pattern do
      response => {
        id: String | nil,
        created_at: Time | nil,
        customer_id: String | nil,
        email: String | nil,
        invitation_sent_at: Time | nil,
        invitation_token: String | nil,
        invitation_token_expires_at: Time | nil,
        last_login_at: Time | nil,
        name: String | nil,
        role: String | nil,
        status: String | nil,
        updated_at: Time | nil
      }
    end
  end
end
