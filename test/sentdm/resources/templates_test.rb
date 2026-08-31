# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::TemplatesTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.templates.create

    assert_pattern do
      response => Sentdm::Models::TemplateCreateResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::TemplateCreateResponse::Data | nil,
        error: Sentdm::Models::TemplateCreateResponse::Error | nil,
        meta: Sentdm::Models::TemplateCreateResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @sent.templates.retrieve("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::Models::TemplateRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::TemplateRetrieveResponse::Data | nil,
        error: Sentdm::Models::TemplateRetrieveResponse::Error | nil,
        meta: Sentdm::Models::TemplateRetrieveResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @sent.templates.update("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::Models::TemplateUpdateResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::TemplateUpdateResponse::Data | nil,
        error: Sentdm::Models::TemplateUpdateResponse::Error | nil,
        meta: Sentdm::Models::TemplateUpdateResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @sent.templates.list(page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::Models::TemplateListResponse
    end

    assert_pattern do
      response => {
        data: Sentdm::Models::TemplateListResponse::Data | nil,
        error: Sentdm::Models::TemplateListResponse::Error | nil,
        meta: Sentdm::Models::TemplateListResponse::Meta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
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
