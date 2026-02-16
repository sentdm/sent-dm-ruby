# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::TemplatesTest < Sentdm::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @sent_dm.templates.create(definition: {body: {}})

    assert_pattern do
      response => Sentdm::TemplateResponseV2
    end

    assert_pattern do
      response => {
        id: String | nil,
        category: String | nil,
        created_at: Time | nil,
        definition: Sentdm::TemplateDefinition | nil,
        display_name: String | nil,
        is_published: Sentdm::Internal::Type::Boolean | nil,
        language: String | nil,
        status: String | nil,
        updated_at: Time | nil,
        whatsapp_template_id: String | nil,
        whatsapp_template_name: String | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @sent_dm.templates.retrieve("7ba7b820-9dad-11d1-80b4-00c04fd430c8")

    assert_pattern do
      response => Sentdm::TemplateResponseV2
    end

    assert_pattern do
      response => {
        id: String | nil,
        category: String | nil,
        created_at: Time | nil,
        definition: Sentdm::TemplateDefinition | nil,
        display_name: String | nil,
        is_published: Sentdm::Internal::Type::Boolean | nil,
        language: String | nil,
        status: String | nil,
        updated_at: Time | nil,
        whatsapp_template_id: String | nil,
        whatsapp_template_name: String | nil
      }
    end
  end

  def test_list_required_params
    skip("Prism tests are disabled")

    response = @sent_dm.templates.list(page: 0, page_size: 0)

    assert_pattern do
      response => Sentdm::Models::TemplateListResponse
    end

    assert_pattern do
      response => {
        items: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateResponseV2]) | nil,
        page: Integer | nil,
        page_size: Integer | nil,
        total_count: Integer | nil,
        total_pages: Integer | nil
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
