# frozen_string_literal: true

require_relative "../../../test_helper"

class Sentdm::Test::Resources::Channels::SMS::TenDlcTest < Sentdm::Test::ResourceTest
  def test_add_campaign_required_params
    skip("Mock server tests are disabled")

    response =
      @sent.channels.sms.ten_dlc.add_campaign(
        description: "Appointment reminders for patients who opted in when booking.",
        help_keywords: "help_keywords",
        help_message: "xxxxxxxxxxxxxxxxxxxx",
        message_flow: "Patients opt in on the booking form by checking a consent box.",
        opt_in_keywords: "opt_in_keywords",
        opt_in_message: "xxxxxxxxxxxxxxxxxxxx",
        opt_out_keywords: "opt_out_keywords",
        opt_out_message: "xxxxxxxxxxxxxxxxxxxx",
        privacy_policy_link: "privacy_policy_link",
        terms_and_conditions_link: "terms_and_conditions_link",
        use_cases: [
          {
            sample_messages: ["Reminder: your appointment is tomorrow at 10:00. Reply STOP to opt out."],
            use_case: :ACCOUNT_NOTIFICATION
          }
        ],
        volume: "volume",
        idempotency_key: "req_abc123_retry1"
      )

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfChannelMarket
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::ChannelMarket | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_campaigns
    skip("Mock server tests are disabled")

    response = @sent.channels.sms.ten_dlc.list_campaigns

    assert_pattern do
      response => Sentdm::Models::Channels::SMS::TenDlcListCampaignsResponse
    end

    assert_pattern do
      response => {
        data: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::Unknown]]) | nil,
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
      response => Sentdm::Channels::APIResponseOfChannelMarket
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::ChannelMarket | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
