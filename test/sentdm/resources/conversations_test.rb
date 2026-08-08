# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::ConversationsTest < Sentdm::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @sent.conversations.list(page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::APIResponseOfConversationMessagesList
    end

    assert_pattern do
      response => {
        data: Sentdm::ConversationMessagesList | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_messages_required_params
    skip("Mock server tests are disabled")

    response =
      @sent.conversations.list_messages("08fab313-c9e2-502c-975e-08b0356c432e", page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::APIResponseOfConversationMessagesList
    end

    assert_pattern do
      response => {
        data: Sentdm::ConversationMessagesList | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
