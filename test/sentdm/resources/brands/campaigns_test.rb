# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Brands::CampaignsTest < Sentdm::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @sent_dm.brands.campaigns.create(
        "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
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
      response => Sentdm::Brands::APIResponseTcrCampaignWithUseCases
    end

    assert_pattern do
      response => {
        data: Sentdm::Brands::TcrCampaignWithUseCases | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @sent_dm.brands.campaigns.update(
        "b2c3d4e5-f6a7-8901-bcde-f12345678901",
        brand_id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
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
      response => Sentdm::Brands::APIResponseTcrCampaignWithUseCases
    end

    assert_pattern do
      response => {
        data: Sentdm::Brands::TcrCampaignWithUseCases | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent_dm.brands.campaigns.list("a1b2c3d4-e5f6-7890-abcd-ef1234567890")

    assert_pattern do
      response => Sentdm::Models::Brands::CampaignListResponse
    end

    assert_pattern do
      response => {
        data: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::Brands::TcrCampaignWithUseCases]) | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @sent_dm.brands.campaigns.delete(
        "b2c3d4e5-f6a7-8901-bcde-f12345678901",
        brand_id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
        body: {}
      )

    assert_pattern do
      response => nil
    end
  end
end
