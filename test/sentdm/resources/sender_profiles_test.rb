# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::SenderProfilesTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.sender_profiles.create

    assert_pattern do
      response => Sentdm::APIResponseOfSenderProfile
    end

    assert_pattern do
      response => {
        data: Sentdm::SenderProfile | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.sender_profiles.retrieve("770e8400-e29b-41d4-a716-446655440002")

    assert_pattern do
      response => Sentdm::APIResponseOfSenderProfile
    end

    assert_pattern do
      response => {
        data: Sentdm::SenderProfile | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.sender_profiles.update("770e8400-e29b-41d4-a716-446655440002")

    assert_pattern do
      response => Sentdm::APIResponseOfSenderProfile
    end

    assert_pattern do
      response => {
        data: Sentdm::SenderProfile | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.sender_profiles.list

    assert_pattern do
      response => Sentdm::Internal::SenderProfilesPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Sentdm::SenderProfile
    end

    assert_pattern do
      row => {
        id: String | nil,
        api_key: String | nil,
        billing: Sentdm::SenderProfileBilling | nil,
        channels: Sentdm::ChannelsState | nil,
        compliance: Sentdm::Channels::SuppliedCompliance | nil,
        created_at: Time | nil,
        description: String | nil,
        name: String | nil,
        notifications: String | nil,
        organization_id: String | nil,
        short_name: String | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @sent.sender_profiles.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => nil
    end
  end
end
