# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Channels::WhatsappTest < Sentdm::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @sent.channels.whatsapp.create

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfWhatsappChannel
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::WhatsappChannel | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
