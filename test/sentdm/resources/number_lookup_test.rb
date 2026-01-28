# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::NumberLookupTest < Sentdm::Test::ResourceTest
  def test_retrieve_required_params
    skip("Prism tests are disabled")

    response = @sent_dm.number_lookup.retrieve(phone_number: "phoneNumber")

    assert_pattern do
      response => Sentdm::Models::NumberLookupRetrieveResponse
    end

    assert_pattern do
      response => {
        country_code: String | nil,
        format_e164: String | nil,
        format_international: String | nil,
        format_national: String | nil,
        format_rfc: String | nil,
        number_type: String | nil,
        phone_number: String | nil,
        phone_timezones: String | nil,
        region_code: String | nil
      }
    end
  end
end
