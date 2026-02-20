# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::WebhooksTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent_dm.webhooks.create

    assert_pattern do
      response => Sentdm::APIResponseWebhook
    end

    assert_pattern do
      response => {
        data: Sentdm::WebhookResponse | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent_dm.webhooks.retrieve("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::APIResponseWebhook
    end

    assert_pattern do
      response => {
        data: Sentdm::WebhookResponse | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent_dm.webhooks.update("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::APIResponseWebhook
    end

    assert_pattern do
      response => {
        data: Sentdm::WebhookResponse | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @sent_dm.webhooks.list(page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::Models::WebhookListResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookListResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @sent_dm.webhooks.delete("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => nil
    end
  end

  def test_list_event_types
    skip("Mock server tests are disabled")

    response = @sent_dm.webhooks.list_event_types

    assert_pattern do
      response => Sentdm::Models::WebhookListEventTypesResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookListEventTypesResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_events_required_params
    skip("Mock server tests are disabled")

    response = @sent_dm.webhooks.list_events("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8", page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::Models::WebhookListEventsResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookListEventsResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_rotate_secret_required_params
    skip("Mock server tests are disabled")

    response = @sent_dm.webhooks.rotate_secret("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8", body: {})

    assert_pattern do
      response => Sentdm::Models::WebhookRotateSecretResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookRotateSecretResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_test_
    skip("Mock server tests are disabled")

    response = @sent_dm.webhooks.test_("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::Models::WebhookTestResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookTestResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_toggle_status
    skip("Mock server tests are disabled")

    response = @sent_dm.webhooks.toggle_status("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::APIResponseWebhook
    end

    assert_pattern do
      response => {
        data: Sentdm::WebhookResponse | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
