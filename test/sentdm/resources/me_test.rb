# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::MeTest < Sentdm::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.me.retrieve

    assert_pattern do
      response => Sentdm::Models::MeRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::MeRetrieveResponse::Data | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
