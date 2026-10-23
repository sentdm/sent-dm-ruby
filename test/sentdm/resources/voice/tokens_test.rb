# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Voice::TokensTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.voice.tokens.create

    assert_pattern do
      response => Sentdm::Voice::APIResponseOfVoiceToken
    end

    assert_pattern do
      response => {
        data: Sentdm::Voice::VoiceToken | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
