# frozen_string_literal: true

require_relative "../test_helper"

class SentDm::Test::Resources::LookupTest < SentDm::Test::ResourceTest
  def test_retrieve_phone_info
    skip("Prism tests are disabled")

    response = @sent_dm.lookup.retrieve_phone_info("phoneNumber")

    assert_pattern do
      response => SentDm::Models::LookupRetrievePhoneInfoResponse
    end

    assert_pattern do
      response => {
        data: SentDm::Models::LookupRetrievePhoneInfoResponse::Data | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end
end
