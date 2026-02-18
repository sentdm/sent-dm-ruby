# frozen_string_literal: true

require_relative "../test_helper"

class SentDm::Test::Resources::BrandsTest < SentDm::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @sent_dm.brands.create(
        brand: {brandRelationship: :SMALL_ACCOUNT, contactName: "John Smith", vertical: :PROFESSIONAL}
      )

    assert_pattern do
      response => SentDm::APIResponseBrandWithKYC
    end

    assert_pattern do
      response => {
        data: SentDm::BrandWithKYC | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response =
      @sent_dm.brands.update(
        "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
        brand: {brandRelationship: :SMALL_ACCOUNT, contactName: "John Smith", vertical: :PROFESSIONAL}
      )

    assert_pattern do
      response => SentDm::APIResponseBrandWithKYC
    end

    assert_pattern do
      response => {
        data: SentDm::BrandWithKYC | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @sent_dm.brands.list

    assert_pattern do
      response => SentDm::Models::BrandListResponse
    end

    assert_pattern do
      response => {
        data: ^(SentDm::Internal::Type::ArrayOf[SentDm::BrandWithKYC]) | nil,
        error: SentDm::APIError | nil,
        meta: SentDm::APIMeta | nil,
        success: SentDm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete_required_params
    skip("Prism tests are disabled")

    response = @sent_dm.brands.delete("a1b2c3d4-e5f6-7890-abcd-ef1234567890", body: {})

    assert_pattern do
      response => nil
    end
  end
end
