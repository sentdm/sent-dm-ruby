# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Voice::AgentsTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.voice.agents.create

    assert_pattern do
      response => Sentdm::Voice::APIResponseOfVoiceAgent
    end

    assert_pattern do
      response => {
        data: Sentdm::Voice::VoiceAgent | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.voice.agents.retrieve("id")

    assert_pattern do
      response => Sentdm::Voice::APIResponseOfVoiceAgent
    end

    assert_pattern do
      response => {
        data: Sentdm::Voice::VoiceAgent | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.voice.agents.update("id")

    assert_pattern do
      response => Sentdm::Voice::APIResponseOfVoiceAgent
    end

    assert_pattern do
      response => {
        data: Sentdm::Voice::VoiceAgent | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.voice.agents.list

    assert_pattern do
      response => Sentdm::Internal::VoiceAgentsPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Sentdm::Voice::VoiceAgent
    end

    assert_pattern do
      row => {
        id: String | nil,
        audio: Sentdm::Voice::VoiceAgentAudio | nil,
        created_at: Time | nil,
        fallback: Sentdm::Voice::VoiceAgentParty | nil,
        greeting: String | nil,
        limits: Sentdm::Voice::VoiceAgentLimits | nil,
        name: String | nil,
        session_type: String | nil,
        signing_secret: String | nil,
        speech: Sentdm::Voice::VoiceAgentSpeech | nil,
        tools: ^(Sentdm::Internal::Type::ArrayOf[String]) | nil,
        transcripts: Sentdm::Voice::VoiceAgentTranscripts | nil,
        transfer_targets: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::VoiceAgentParty]) | nil,
        updated_at: Time | nil,
        websocket_url: String | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @sent.voice.agents.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_rotate_secret
    skip("Mock server tests are disabled")

    response = @sent.voice.agents.rotate_secret("id")

    assert_pattern do
      response => Sentdm::Voice::APIResponseOfVoiceAgentSecret
    end

    assert_pattern do
      response => {
        data: Sentdm::Voice::VoiceAgentSecret | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
