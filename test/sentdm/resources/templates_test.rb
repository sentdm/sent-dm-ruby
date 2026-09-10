# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::TemplatesTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.templates.create

    assert_pattern do
      response => Sentdm::APIResponseTemplate
    end

    assert_pattern do
      response => {
        data: Sentdm::Template | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.templates.retrieve("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::APIResponseTemplate
    end

    assert_pattern do
      response => {
        data: Sentdm::Template | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.templates.update("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::APIResponseTemplate
    end

    assert_pattern do
      response => {
        data: Sentdm::Template | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.templates.list

    assert_pattern do
      response => Sentdm::Internal::TemplatesPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Sentdm::Template
    end

    assert_pattern do
      row => {
        customer_id: String,
        id: String | nil,
        category: String | nil,
        channels: ^(Sentdm::Internal::Type::ArrayOf[String]) | nil,
        created_at: Time | nil,
        is_published: Sentdm::Internal::Type::Boolean | nil,
        language: String | nil,
        name: String | nil,
        status: String | nil,
        updated_at: Time | nil,
        variables: ^(Sentdm::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @sent.templates.delete("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => nil
    end
  end
end
