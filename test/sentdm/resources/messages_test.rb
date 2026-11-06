# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::MessagesTest < Sentdm::Test::ResourceTest
  def test_cancel
    skip("Mock server tests are disabled")

    response = @sent.messages.cancel("8ba7b830-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::APIResponseOfCancelledMessage
    end

    assert_pattern do
      response => {
        data: Sentdm::CancelledMessage | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_resend
    skip("Mock server tests are disabled")

    response = @sent.messages.resend("8ba7b830-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::MessageSendResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::MessageSendResult | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve_activities
    skip("Mock server tests are disabled")

    response = @sent.messages.retrieve_activities("8ba7b830-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::APIResponseOfMessageActivities
    end

    assert_pattern do
      response => {
        data: Sentdm::MessageActivities | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve_status
    skip("Mock server tests are disabled")

    response = @sent.messages.retrieve_status("8ba7b830-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::APIResponseOfMessage
    end

    assert_pattern do
      response => {
        data: Sentdm::Message | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_send_
    skip("Mock server tests are disabled")

    response = @sent.messages.send_

    assert_pattern do
      response => Sentdm::MessageSendResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::MessageSendResult | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
