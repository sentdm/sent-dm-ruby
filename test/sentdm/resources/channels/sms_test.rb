# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Channels::SMSTest < Sentdm::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @sent.channels.sms.create(number_type: :TEN_DLC)

    assert_pattern do
      response => Sentdm::Models::Channels::SMSCreateResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::Channels::SMSCreateResponse::Data | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
