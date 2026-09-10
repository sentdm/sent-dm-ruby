# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::WebhooksTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.webhooks.create

    assert_pattern do
      response => Sentdm::APIResponseWebhook
    end

    assert_pattern do
      response => {
        data: Sentdm::WebhookResponse | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.webhooks.retrieve("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::APIResponseWebhook
    end

    assert_pattern do
      response => {
        data: Sentdm::WebhookResponse | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.webhooks.update("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::APIResponseWebhook
    end

    assert_pattern do
      response => {
        data: Sentdm::WebhookResponse | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.webhooks.list

    assert_pattern do
      response => Sentdm::Internal::WebhooksPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Sentdm::WebhookResponse
    end

    assert_pattern do
      row => {
        id: String | nil,
        consecutive_failures: Integer | nil,
        created_at: Time | nil,
        customer_id: String | nil,
        display_name: String | nil,
        endpoint_url: String | nil,
        event_filters: ^(Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]]) | nil,
        event_types: ^(Sentdm::Internal::Type::ArrayOf[String]) | nil,
        is_active: Sentdm::Internal::Type::Boolean | nil,
        last_delivery_attempt_at: Time | nil,
        last_successful_delivery_at: Time | nil,
        retry_count: Integer | nil,
        signing_secret: String | nil,
        timeout_seconds: Integer | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @sent.webhooks.delete("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => nil
    end
  end

  def test_list_event_types
    skip("Mock server tests are disabled")

    response = @sent.webhooks.list_event_types

    assert_pattern do
      response => Sentdm::Models::WebhookListEventTypesResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookListEventTypesResponse::Data | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_events
    skip("Mock server tests are disabled")

    response = @sent.webhooks.list_events("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::Internal::WebhookEventsPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Sentdm::Models::WebhookListEventsResponse
    end

    assert_pattern do
      row => {
        id: String | nil,
        created_at: Time | nil,
        delivery_attempts: Integer | nil,
        delivery_status: String | nil,
        error_message: String | nil,
        event_data: Sentdm::Models::WebhookListEventsResponse::EventData | nil,
        event_type: String | nil,
        http_status_code: Integer | nil,
        processing_completed_at: Time | nil,
        processing_started_at: Time | nil,
        response_body: String | nil
      }
    end
  end

  def test_rotate_secret
    skip("Mock server tests are disabled")

    response = @sent.webhooks.rotate_secret("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::Models::WebhookRotateSecretResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookRotateSecretResponse::Data | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_test_
    skip("Mock server tests are disabled")

    response = @sent.webhooks.test_("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::Models::WebhookTestResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookTestResponse::Data | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_toggle_status
    skip("Mock server tests are disabled")

    response = @sent.webhooks.toggle_status("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::APIResponseWebhook
    end

    assert_pattern do
      response => {
        data: Sentdm::WebhookResponse | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
