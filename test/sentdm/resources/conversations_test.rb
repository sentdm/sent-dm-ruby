# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::ConversationsTest < Sentdm::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @sent.conversations.list(page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::Models::ConversationListResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ConversationListResponse::Data | nil,
        error: Sentdm::Models::ConversationListResponse::Error | nil,
        meta: Sentdm::Models::ConversationListResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_messages_required_params
    skip("Mock server tests are disabled")

    response =
      @sent.conversations.list_messages("08fab313-c9e2-502c-975e-08b0356c432e", page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::Models::ConversationListMessagesResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::ConversationListMessagesResponse::Data | nil,
        error: Sentdm::Models::ConversationListMessagesResponse::Error | nil,
        meta: Sentdm::Models::ConversationListMessagesResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
