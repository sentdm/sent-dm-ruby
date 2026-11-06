# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Channels::RcsTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.channels.rcs.create

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfRcsAgent
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::RcsAgent | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
