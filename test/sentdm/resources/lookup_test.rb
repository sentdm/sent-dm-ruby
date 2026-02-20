# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::LookupTest < Sentdm::Test::ResourceTest
  def test_retrieve_phone_info
    skip("Mock server tests are disabled")

    response = @sent_dm.lookup.retrieve_phone_info("phoneNumber")

    assert_pattern do
      response => Sentdm::Models::LookupRetrievePhoneInfoResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::LookupRetrievePhoneInfoResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
