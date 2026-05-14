# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::ContactsTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.contacts.create

    assert_pattern do
      response => Sentdm::Models::ContactCreateResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ContactCreateResponse::Data | nil,
        error: Sentdm::Models::ContactCreateResponse::Error | nil,
        meta: Sentdm::Models::ContactCreateResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.contacts.retrieve("6ba7b810-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::Models::ContactRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ContactRetrieveResponse::Data | nil,
        error: Sentdm::Models::ContactRetrieveResponse::Error | nil,
        meta: Sentdm::Models::ContactRetrieveResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.contacts.update("6ba7b810-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::Models::ContactUpdateResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ContactUpdateResponse::Data | nil,
        error: Sentdm::Models::ContactUpdateResponse::Error | nil,
        meta: Sentdm::Models::ContactUpdateResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @sent.contacts.list(page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::Models::ContactListResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ContactListResponse::Data | nil,
        error: Sentdm::Models::ContactListResponse::Error | nil,
        meta: Sentdm::Models::ContactListResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @sent.contacts.delete("6ba7b810-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => nil
    end
  end
end
