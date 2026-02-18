# frozen_string_literal: true

require_relative "../test_helper"

class SentDm::Test::Resources::MeTest < SentDm::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @sent_dm.me.retrieve

    assert_pattern do
      response => SentDm::Models::MeRetrieveResponse
    end

    assert_pattern do
      response => {
        data: SentDm::Models::MeRetrieveResponse::Data | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end
end
