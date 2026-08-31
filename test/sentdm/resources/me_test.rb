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
        error: Sentdm::Models::MeRetrieveResponse::Error | nil,
        meta: Sentdm::Models::MeRetrieveResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
