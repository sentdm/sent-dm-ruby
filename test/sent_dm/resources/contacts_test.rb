# frozen_string_literal: true

require_relative "../test_helper"

class SentDm::Test::Resources::ContactsTest < SentDm::Test::ResourceTest
  def test_list_required_params
    skip("Prism tests are disabled")

    response = @sent_dm.contacts.list(page: 0, page_size: 0)

    assert_pattern do
      response => SentDm::Models::ContactListResponse
    end

    assert_pattern do
      response => {
        items: ^(SentDm::Internal::Type::ArrayOf[SentDm::ContactListItem]) | nil,
        page: Integer | nil,
        page_size: Integer | nil,
        total_count: Integer | nil,
        total_pages: Integer | nil
      }
    end
  end

  def test_retrieve_by_phone_required_params
    skip("Prism tests are disabled")

    response = @sent_dm.contacts.retrieve_by_phone(phone_number: "phoneNumber")

    assert_pattern do
      response => SentDm::ContactListItem
    end

    assert_pattern do
      response => {
        id: String | nil,
        available_channels: String | nil,
        country_code: String | nil,
        default_channel: String | nil,
        format_e164: String | nil,
        format_international: String | nil,
        format_national: String | nil,
        format_rfc: String | nil,
        phone_number: String | nil,
        region_code: String | nil
      }
    end
  end

  def test_retrieve_id_required_params
    skip("Prism tests are disabled")

    response = @sent_dm.contacts.retrieve_id(id: "id")

    assert_pattern do
      response => SentDm::ContactListItem
    end

    assert_pattern do
      response => {
        id: String | nil,
        available_channels: String | nil,
        country_code: String | nil,
        default_channel: String | nil,
        format_e164: String | nil,
        format_international: String | nil,
        format_national: String | nil,
        format_rfc: String | nil,
        phone_number: String | nil,
        region_code: String | nil
      }
    end
  end
end
