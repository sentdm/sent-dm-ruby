# frozen_string_literal: true

require_relative "../test_helper"

class SentDm::Test::Resources::MessagesTest < SentDm::Test::ResourceTest
  def test_retrieve_activities
    skip("Prism tests are disabled")

    response = @sent_dm.messages.retrieve_activities("8ba7b830-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => SentDm::Models::MessageRetrieveActivitiesResponse
    end

    assert_pattern do
      response => {
        data: SentDm::Models::MessageRetrieveActivitiesResponse::Data | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve_status
    skip("Prism tests are disabled")

    response = @sent_dm.messages.retrieve_status("8ba7b830-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => SentDm::Models::MessageRetrieveStatusResponse
    end

    assert_pattern do
      response => {
        data: SentDm::Models::MessageRetrieveStatusResponse::Data | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_send_
    skip("Prism tests are disabled")

    response = @sent_dm.messages.send_

    assert_pattern do
      response => SentDm::Models::MessageSendResponse
    end

    assert_pattern do
      response => {
        data: SentDm::Models::MessageSendResponse::Data | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end
end
