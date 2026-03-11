# frozen_string_literal: true

module Sentdm
  module Resources
    class Brands
      # @return [Sentdm::Resources::Brands::Campaigns]
      attr_reader :campaigns

      # @api private
      #
      # @param client [Sentdm::Client]
      def initialize(client:)
        @client = client
        @campaigns = Sentdm::Resources::Brands::Campaigns.new(client: client)
      end
    end
  end
end
