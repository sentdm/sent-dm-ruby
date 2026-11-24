# frozen_string_literal: true

require_relative "../../test_helper"

class Sentdm::Test::Resources::Channels::MarketsTest < Sentdm::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @sent.channels.markets.retrieve("ten_dlc", channel: "sms", country: "US")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfChannelMarket
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::ChannelMarket | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @sent.channels.markets.update("ten_dlc", channel: "sms", country: "US")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfChannelMarket
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::ChannelMarket | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @sent.channels.markets.list("channel")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfListOfChannelMarket
    end

    assert_pattern do
      response => {
        data: ^(Sentdm::Internal::Type::ArrayOf[Sentdm::Channels::ChannelMarket]) | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_add_numbers_required_params
    skip("Mock server tests are disabled")

    response =
      @sent.channels.markets.add_numbers(
        "TEN_DLC",
        channel: "sms",
        country: "US",
        numbers: [{}, {}],
        idempotency_key: "req_abc123_retry1"
      )

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfChannelMarket
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::ChannelMarket | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_numbers_required_params
    skip("Mock server tests are disabled")

    response = @sent.channels.markets.list_numbers("type", channel: "channel", country: "country")

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfMarketNumbers
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::MarketNumbers | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end

  def test_replace_numbers_required_params
    skip("Mock server tests are disabled")

    response =
      @sent.channels.markets.replace_numbers("TEN_DLC", channel: "sms", country: "US", numbers: [{}, {}])

    assert_pattern do
      response => Sentdm::Channels::APIResponseOfChannelMarket
    end

    assert_pattern do
      response => {
        data: Sentdm::Channels::ChannelMarket | nil,
        error: Sentdm::ErrorDetail | nil,
        meta: Sentdm::APIMeta | nil,
        success: Sentdm::Internal::Type::Boolean | nil
      }
    end
  end
end
