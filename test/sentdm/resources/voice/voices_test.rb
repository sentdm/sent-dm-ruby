# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Voice::VoicesTest < Sentdm::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @sent.voice.voices.list

    assert_pattern do
      response => Sentdm::Voice::APIResponseOfVoiceCatalogue
    end

    assert_pattern do
      response => {
        data: Sentdm::Voice::VoiceCatalogue | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
