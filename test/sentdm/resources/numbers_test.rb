# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::NumbersTest < Sentdm::Test::ResourceTest
  def test_lookup
    skip("Mock server tests are disabled")

    response = @sent_dm.numbers.lookup("+12025551234")

    assert_pattern do
      response => Sentdm::Models::NumberLookupResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::NumberLookupResponse::Data | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
