# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Channels::VoiceTest < Sentdm::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @sent.channels.voice.create(callback_url: "https://example.com/voice")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfVoiceNumberCreated
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::VoiceNumberCreated | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.channels.voice.retrieve("+12125550100")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfVoiceNumber
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::VoiceNumber | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.channels.voice.update("+12125550100")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfVoiceNumber
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::VoiceNumber | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.channels.voice.list

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfListOfVoiceNumber
    end

    assert_pattern do
      response => {
        data: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::Channels::VoiceNumber]) | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_create_token
    skip("Mock server tests are disabled")

    response = @sent.channels.voice.create_token

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfVoiceToken
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::VoiceToken | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_rotate_secret
    skip("Mock server tests are disabled")

    response = @sent.channels.voice.rotate_secret("+12125550100")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfVoiceSecret
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::VoiceSecret | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_test_
    skip("Mock server tests are disabled")

    response = @sent.channels.voice.test_("+12025550123")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfVoiceCallbackTest
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::VoiceCallbackTest | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
