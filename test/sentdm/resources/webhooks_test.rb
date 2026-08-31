# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::WebhooksTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.webhooks.create

    assert_pattern do
      response => Sentdm::Models::WebhookCreateResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookCreateResponse::Data | nil,
        error: Sentdm::Models::WebhookCreateResponse::Error | nil,
        meta: Sentdm::Models::WebhookCreateResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.webhooks.retrieve("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::Models::WebhookRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookRetrieveResponse::Data | nil,
        error: Sentdm::Models::WebhookRetrieveResponse::Error | nil,
        meta: Sentdm::Models::WebhookRetrieveResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.webhooks.update("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::Models::WebhookUpdateResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookUpdateResponse::Data | nil,
        error: Sentdm::Models::WebhookUpdateResponse::Error | nil,
        meta: Sentdm::Models::WebhookUpdateResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @sent.webhooks.list(page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::Models::WebhookListResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookListResponse::Data | nil,
        error: Sentdm::Models::WebhookListResponse::Error | nil,
        meta: Sentdm::Models::WebhookListResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
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
        error: Sentdm::Models::WebhookListEventTypesResponse::Error | nil,
        meta: Sentdm::Models::WebhookListEventTypesResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_events_required_params
    skip("Mock server tests are disabled")

    response = @sent.webhooks.list_events("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8", page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::Models::WebhookListEventsResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookListEventsResponse::Data | nil,
        error: Sentdm::Models::WebhookListEventsResponse::Error | nil,
        meta: Sentdm::Models::WebhookListEventsResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
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
        error: Sentdm::Models::WebhookRotateSecretResponse::Error | nil,
        meta: Sentdm::Models::WebhookRotateSecretResponse::Meta | nil,
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
        error: Sentdm::Models::WebhookTestResponse::Error | nil,
        meta: Sentdm::Models::WebhookTestResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_toggle_status
    skip("Mock server tests are disabled")

    response = @sent.webhooks.toggle_status("d4f5a6b7-c8d9-4e0f-a1b2-c3d4e5f6a7b8")

    assert_pattern do
      response => Sentdm::Models::WebhookToggleStatusResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::WebhookToggleStatusResponse::Data | nil,
        error: Sentdm::Models::WebhookToggleStatusResponse::Error | nil,
        meta: Sentdm::Models::WebhookToggleStatusResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
