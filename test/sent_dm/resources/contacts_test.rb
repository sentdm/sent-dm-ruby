# frozen_string_literal: true

require_relative "../test_helper"

class SentDm::Test::Resources::ContactsTest < SentDm::Test::ResourceTest
  def test_create
    skip("Prism tests are disabled")

    response = @sent_dm.contacts.create

    assert_pattern do
      response => SentDm::APIResponseContact
    end

    assert_pattern do
      response => {
        data: SentDm::Contact | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @sent_dm.contacts.retrieve("6ba7b810-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => SentDm::APIResponseContact
    end

    assert_pattern do
      response => {
        data: SentDm::Contact | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @sent_dm.contacts.update("6ba7b810-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => SentDm::APIResponseContact
    end

    assert_pattern do
      response => {
        data: SentDm::Contact | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_required_params
    skip("Prism tests are disabled")

    response = @sent_dm.contacts.list(page: 0, page_size: 0)

    assert_pattern do
      response => SentDm::Models::ContactListResponse
    end

    assert_pattern do
      response => {
        data: SentDm::Models::ContactListResponse::Data | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete_required_params
    skip("Prism tests are disabled")

    response = @sent_dm.contacts.delete("6ba7b810-9dad-11d1-80b4-00c04fd430c8", body: {})

    assert_pattern do
      response => nil
    end
  end
end
