# frozen_string_literal: true

require_relative "../test_helper"

class SentDm::Test::Resources::TemplatesTest < SentDm::Test::ResourceTest
  def test_create
    skip("Prism tests are disabled")

    response = @sent_dm.templates.create

    assert_pattern do
      response => SentDm::APIResponseTemplate
    end

    assert_pattern do
      response => {
        data: SentDm::Template | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @sent_dm.templates.retrieve("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => SentDm::APIResponseTemplate
    end

    assert_pattern do
      response => {
        data: SentDm::Template | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @sent_dm.templates.update("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => SentDm::APIResponseTemplate
    end

    assert_pattern do
      response => {
        data: SentDm::Template | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_required_params
    skip("Prism tests are disabled")

    response = @sent_dm.templates.list(page: 0, page_size: 0)

    assert_pattern do
      response => SentDm::Models::TemplateListResponse
    end

    assert_pattern do
      response => {
        data: SentDm::Models::TemplateListResponse::Data | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @sent_dm.templates.delete("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => nil
    end
  end
end
