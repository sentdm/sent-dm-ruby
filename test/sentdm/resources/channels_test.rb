# frozen_string_literal: true

require_relative "../test_helper"

class Sentdm::Test::Resources::ChannelsTest < Sentdm::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @sent.channels.list

    assert_pattern do
      response => Sentdm::APIResponseOfChannelsState
    end

    assert_pattern do
      response => {
        data: Sentdm::ChannelsState | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
