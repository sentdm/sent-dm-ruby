# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::ConversationsTest < Sentdm::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @sent.conversations.list

    assert_pattern do
      response => Sentdm::Internal::ConversationsPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Sentdm::ConversationMessagesList::Message
    end

    assert_pattern do
      row => {
        id: String | nil,
        active_contact_price: Float | nil,
        channel: String | nil,
        contact_id: String | nil,
        created_at: Time | nil,
        customer_id: String | nil,
        direction: String | nil,
        events: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::ConversationMessagesList::Message::Event]) | nil,
        message_body: Sentdm::ConversationMessagesList::Message::MessageBody | nil,
        phone: String | nil,
        phone_international: String | nil,
        price: Float | nil,
        region_code: String | nil,
        status: String | nil,
        template_category: String | nil,
        template_id: String | nil,
        template_name: String | nil
      }
    end
  end

  def test_list_messages
    skip("Mock server tests are disabled")

    response = @sent.conversations.list_messages("08fab313-c9e2-502c-975e-08b0356c432e")

    assert_pattern do
      response => Sentdm::Internal::ConversationsPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Sentdm::ConversationMessagesList::Message
    end

    assert_pattern do
      row => {
        id: String | nil,
        active_contact_price: Float | nil,
        channel: String | nil,
        contact_id: String | nil,
        created_at: Time | nil,
        customer_id: String | nil,
        direction: String | nil,
        events: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::ConversationMessagesList::Message::Event]) | nil,
        message_body: Sentdm::ConversationMessagesList::Message::MessageBody | nil,
        phone: String | nil,
        phone_international: String | nil,
        price: Float | nil,
        region_code: String | nil,
        status: String | nil,
        template_category: String | nil,
        template_id: String | nil,
        template_name: String | nil
      }
    end
  end
end
