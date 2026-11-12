# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Channels::SMSTest < Sentdm::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @sent.channels.sms.create(number_type: :TEN_DLC)

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfSMSMarket
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::SMSMarket | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @sent.channels.sms.retrieve("ten_dlc", country: "US")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfSMSMarket
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::SMSMarket | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @sent.channels.sms.update("ten_dlc", country: "US")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfSMSMarket
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::SMSMarket | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.channels.sms.list

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfListOfSMSMarket
    end

    assert_pattern do
      response => {
        data: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::Channels::SMSMarket]) | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
