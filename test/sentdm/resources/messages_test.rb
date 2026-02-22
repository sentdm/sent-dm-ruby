# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::MessagesTest < Sentdm::Test::ResourceTest
  def test_retrieve_activities
    skip("Mock server tests are disabled")

    response = @sent_dm.messages.retrieve_activities("8ba7b830-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::Models::MessageRetrieveActivitiesResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::MessageRetrieveActivitiesResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve_status
    skip("Mock server tests are disabled")

    response = @sent_dm.messages.retrieve_status("8ba7b830-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::Models::MessageRetrieveStatusResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::MessageRetrieveStatusResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_send_
    skip("Mock server tests are disabled")

    response = @sent_dm.messages.send_

    assert_pattern do
      response => Sentdm::Models::MessageSendResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::MessageSendResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
