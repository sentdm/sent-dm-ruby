# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Profiles::CampaignsTest < Sentdm::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @sent_dm.profiles.campaigns.create(
        "770e8400-e29b-41d4-a716-446655440002",
        campaign: {
          description: "Appointment reminders and account notifications",
          name: "Customer Notifications",
          type: "App",
          useCases: [
            {
              messagingUseCaseUs: :ACCOUNT_NOTIFICATION,
              sampleMessages: [
                "Hi {name}, your appointment is confirmed for {date} at {time}.",
                "Your order \#{order_id} has been shipped. Track at {url}"
              ]
            }
          ]
        }
      )

    assert_pattern do
      response => Sentdm::Profiles::APIResponseOfTcrCampaignWithUseCases
    end

    assert_pattern do
      response => {
        data: Sentdm::Profiles::TcrCampaignWithUseCases | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @sent_dm.profiles.campaigns.update(
        "b2c3d4e5-f6a7-8901-bcde-f12345678901",
        profile_id: "770e8400-e29b-41d4-a716-446655440002",
        campaign: {
          description: "Updated appointment reminders and account notifications",
          name: "Customer Notifications Updated",
          type: "App",
          useCases: [
            {
              messagingUseCaseUs: :ACCOUNT_NOTIFICATION,
              sampleMessages: [
                "Hi {name}, your appointment is confirmed for {date} at {time}.",
                "Your order \#{order_id} has been shipped. Track at {url}"
              ]
            }
          ]
        }
      )

    assert_pattern do
      response => Sentdm::Profiles::APIResponseOfTcrCampaignWithUseCases
    end

    assert_pattern do
      response => {
        data: Sentdm::Profiles::TcrCampaignWithUseCases | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent_dm.profiles.campaigns.list("770e8400-e29b-41d4-a716-446655440002")

    assert_pattern do
      response => Sentdm::Models::Profiles::CampaignListResponse
    end

    assert_pattern do
      response => {
        data: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::Profiles::TcrCampaignWithUseCases]) | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @sent_dm.profiles.campaigns.delete(
        "b2c3d4e5-f6a7-8901-bcde-f12345678901",
        profile_id: "770e8400-e29b-41d4-a716-446655440002",
        body: {}
      )

    assert_pattern do
      response => nil
    end
  end
end
