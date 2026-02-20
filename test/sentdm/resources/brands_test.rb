# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::BrandsTest < Sentdm::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @sent_dm.brands.create(
        brand: {brandRelationship: :SMALL_ACCOUNT, contactName: "John Smith", vertical: :PROFESSIONAL}
      )

    assert_pattern do
      response => Sentdm::APIResponseBrandWithKYC
    end

    assert_pattern do
      response => {
        data: Sentdm::BrandWithKYC | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @sent_dm.brands.update(
        "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
        brand: {brandRelationship: :SMALL_ACCOUNT, contactName: "John Smith", vertical: :PROFESSIONAL}
      )

    assert_pattern do
      response => Sentdm::APIResponseBrandWithKYC
    end

    assert_pattern do
      response => {
        data: Sentdm::BrandWithKYC | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent_dm.brands.list

    assert_pattern do
      response => Sentdm::Models::BrandListResponse
    end

    assert_pattern do
      response => {
        data: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::BrandWithKYC]) | nil,
        error: Sentdm::APIError | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @sent_dm.brands.delete("a1b2c3d4-e5f6-7890-abcd-ef1234567890", body: {})

    assert_pattern do
      response => nil
    end
  end
end
