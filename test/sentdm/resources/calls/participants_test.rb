# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Calls::ParticipantsTest < Sentdm::Test::ResourceTest
  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @sent.calls.participants.update(
        "call_9f2ab000-0000-4000-8000-000000000002",
        id: "call_9f2ab000-0000-4000-8000-000000000001"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.calls.participants.list("call_9f2ab000-0000-4000-8000-000000000001")

    assert_pattern do
      response => Sentdm::Calls::APIResponseOfListOfCallParticipant
    end

    assert_pattern do
      response => {
        data: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::Calls::CallParticipant]) | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_add
    skip("Mock server tests are disabled")

    response = @sent.calls.participants.add("call_9f2ab000-0000-4000-8000-000000000001")

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

  def test_remove_required_params
    skip("Mock server tests are disabled")

    response =
      @sent.calls.participants.remove(
        "call_9f2ab000-0000-4000-8000-000000000002",
        id: "call_9f2ab000-0000-4000-8000-000000000001"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_remove_all
    skip("Mock server tests are disabled")

    response = @sent.calls.participants.remove_all("call_9f2ab000-0000-4000-8000-000000000001")

    assert_pattern do
      response => nil
    end
  end
end
