# frozen_string_literal: true

require_relative "../../../test_helper"

class Sentdm::Test::Resources::Channels::SMS::TenDlcTest < Sentdm::Test::ResourceTest
  def test_add_campaign_required_params
    skip("Mock server tests are disabled")

    response = @sent.channels.sms.ten_dlc.add_campaign(idempotency_key: "req_abc123_retry1")

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

  def test_add_numbers_required_params
    skip("Mock server tests are disabled")

    response =
      @sent.channels.sms.ten_dlc.add_numbers(
        campaign_id: "8f14e45f-ceea-467f-a8f0-7c2a3d1b9e01",
        numbers: [{}],
        idempotency_key: "req_abc123_retry1"
      )

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

  def test_retrieve_compliance
    skip("Mock server tests are disabled")

    response = @sent.channels.sms.ten_dlc.retrieve_compliance

    assert_pattern do
      response => Sentdm::Channels::SMS::APIResponseOfSuppliedCompliance
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::SuppliedCompliance | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update_campaign
    skip("Mock server tests are disabled")

    response = @sent.channels.sms.ten_dlc.update_campaign("3f2a6c1e-8b4d-4e2a-9c7f-1d5b0a9e4c21")

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
end
