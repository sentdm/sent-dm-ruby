# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::ContactsTest < Sentdm::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @sent.contacts.create(phone_number: "+1234567890")

    assert_pattern do
      response => Sentdm::APIResponseOfContact
    end

    assert_pattern do
      response => {
        data: Sentdm::ContactResponse | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.contacts.retrieve("6ba7b810-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::APIResponseOfContact
    end

    assert_pattern do
      response => {
        data: Sentdm::ContactResponse | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.contacts.update("6ba7b810-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::APIResponseOfContact
    end

    assert_pattern do
      response => {
        data: Sentdm::ContactResponse | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.contacts.list

    assert_pattern do
      response => Sentdm::Internal::ContactsPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Sentdm::ContactResponse
    end

    assert_pattern do
      row => {
        id: String | nil,
        available_channels: String | nil,
        country_code: String | nil,
        created_at: Time | nil,
        customer_id: String | nil,
        default_channel: String | nil,
        format_e164: String | nil,
        format_international: String | nil,
        format_national: String | nil,
        format_rfc: String | nil,
        is_inherited: Sentdm::Internal::Type::Boolean | nil,
        opt_out: Sentdm::Internal::Type::Boolean | nil,
        phone_number: String | nil,
        region_code: String | nil,
        updated_at: Time | nil
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

  def test_retrieve_message_summary
    skip("Mock server tests are disabled")

    response = @sent.contacts.retrieve_message_summary("6ba7b810-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::APIResponseOfContactMessageSummary
    end

    assert_pattern do
      response => {
        data: Sentdm::ContactMessageSummary | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
