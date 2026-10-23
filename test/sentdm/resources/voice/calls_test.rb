# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Voice::CallsTest < Sentdm::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.voice.calls.retrieve("call_9f2ab000-0000-4000-8000-000000000001")

    assert_pattern do
      response => Sentdm::Voice::APIResponseOfCall
    end

    assert_pattern do
      response => {
        data: Sentdm::Voice::Call | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.voice.calls.list

    assert_pattern do
      response => Sentdm::Internal::CallsPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Sentdm::Voice::Call
    end

    assert_pattern do
      row => {
        id: String | nil,
        answered_at: Time | nil,
        direction: String | nil,
        duration_seconds: Integer | nil,
        ended_at: Time | nil,
        failure_reason: String | nil,
        from: Sentdm::Voice::CallParty | nil,
        mode: String | nil,
        number: String | nil,
        price: Float | nil,
        recording_available: Sentdm::Internal::Type::Boolean | nil,
        started_at: Time | nil,
        status: String | nil,
        timeline: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::CallTimelineEntry]) | nil,
        to: Sentdm::Voice::CallParty | nil
      }
    end
  end

  def test_hangup
    skip("Mock server tests are disabled")

    response = @sent.voice.calls.hangup("call_9f2ab000-0000-4000-8000-000000000001")

    assert_pattern do
      response => nil
    end
  end

  def test_list_recordings
    skip("Mock server tests are disabled")

    response = @sent.voice.calls.list_recordings("call_9f2ab000-0000-4000-8000-000000000001")

    assert_pattern do
      response => Sentdm::Voice::APIResponseOfCallRecordings
    end

    assert_pattern do
      response => {
        data: Sentdm::Voice::CallRecordings | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_record
    skip("Mock server tests are disabled")

    response = @sent.voice.calls.record("call_9f2ab000-0000-4000-8000-000000000001")

    assert_pattern do
      response => nil
    end
  end
end
