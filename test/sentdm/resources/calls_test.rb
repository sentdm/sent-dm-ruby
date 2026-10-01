# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::CallsTest < Sentdm::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.calls.retrieve("call_9f2ab000-0000-4000-8000-000000000001")

    assert_pattern do
      response => Sentdm::APIResponseOfCall
    end

    assert_pattern do
      response => {
        data: Sentdm::Call | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.calls.list

    assert_pattern do
      response => Sentdm::Internal::CallsPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Sentdm::Call
    end

    assert_pattern do
      row => {
        id: String | nil,
        answered_at: Time | nil,
        direction: String | nil,
        duration_seconds: Integer | nil,
        ended_at: Time | nil,
        failure_reason: String | nil,
        from: Sentdm::CallParty | nil,
        number: String | nil,
        price: Float | nil,
        recording_available: Sentdm::Internal::Type::Boolean | nil,
        started_at: Time | nil,
        status: String | nil,
        timeline: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::CallTimelineEntry]) | nil,
        to: Sentdm::CallParty | nil
      }
    end
  end

  def test_hangup
    skip("Mock server tests are disabled")

    response = @sent.calls.hangup("call_9f2ab000-0000-4000-8000-000000000001")

    assert_pattern do
      response => nil
    end
  end

  def test_list_recordings
    skip("Mock server tests are disabled")

    response = @sent.calls.list_recordings("call_9f2ab000-0000-4000-8000-000000000001")

    assert_pattern do
      response => Sentdm::APIResponseOfCallRecordings
    end

    assert_pattern do
      response => {
        data: Sentdm::CallRecordings | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_record
    skip("Mock server tests are disabled")

    response = @sent.calls.record("call_9f2ab000-0000-4000-8000-000000000001")

    assert_pattern do
      response => nil
    end
  end
end
