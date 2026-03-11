# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::TemplatesTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent_dm.templates.create

    assert_pattern do
      response => Sentdm::APIResponseTemplate
    end

    assert_pattern do
      response => {
        data: Sentdm::Template | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent_dm.templates.retrieve("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::APIResponseTemplate
    end

    assert_pattern do
      response => {
        data: Sentdm::Template | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent_dm.templates.update("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::APIResponseTemplate
    end

    assert_pattern do
      response => {
        data: Sentdm::Template | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @sent_dm.templates.list(page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::Models::TemplateListResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::TemplateListResponse::Data | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @sent_dm.templates.delete("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => nil
    end
  end
end
