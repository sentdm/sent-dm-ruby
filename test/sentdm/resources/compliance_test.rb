# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::ComplianceTest < Sentdm::Test::ResourceTest
  def test_retrieve_requirements
    skip("Mock server tests are disabled")

    response = @sent.compliance.retrieve_requirements

    assert_pattern do
      response => Sentdm::APIResponseOfComplianceRequirements
    end

    assert_pattern do
      response => {
        data: Sentdm::ComplianceRequirements | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
