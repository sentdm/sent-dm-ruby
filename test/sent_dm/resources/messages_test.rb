# frozen_string_literal: true

require_relative "../test_helper"

class SentDm::Test::Resources::MessagesTest < SentDm::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @sent_dm.messages.retrieve("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => SentDm::Models::MessageRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String | nil,
        channel: String | nil,
        contact_id: String | nil,
        corrected_price: Float | nil,
        created_at: Time | nil,
        customer_id: String | nil,
        events: ^(SentDm::Internal::Type::ArrayOf[SentDm::Models::MessageRetrieveResponse::Event]) | nil,
        message_body: SentDm::Models::MessageRetrieveResponse::MessageBody | nil,
        phone_number: String | nil,
        phone_number_international: String | nil,
        region_code: String | nil,
        status: String | nil,
        template_category: String | nil,
        template_id: String | nil,
        template_name: String | nil
      }
    end
  end

  def test_send_quick_message_required_params
    skip("Prism tests are disabled")

    response =
      @sent_dm.messages.send_quick_message(
        custom_message: "Hello, this is a test message!",
        phone_number: "+1234567890"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_send_to_contact_required_params
    skip("Prism tests are disabled")

    response =
      @sent_dm.messages.send_to_contact(
        contact_id: "6ba7b810-9dad-11d1-80b4-00c04fd430c8",
        template_id: "7ba7b820-9dad-11d1-80b4-00c04fd430c8"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_send_to_phone_required_params
    skip("Prism tests are disabled")

    response =
      @sent_dm.messages.send_to_phone(
        phone_number: "+1234567890",
        template_id: "7ba7b820-9dad-11d1-80b4-00c04fd430c8"
      )

    assert_pattern do
      response => nil
    end
  end
end
