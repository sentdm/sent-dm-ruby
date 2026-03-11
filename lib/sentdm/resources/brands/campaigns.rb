# frozen_string_literal: true

module Sentdm
  module Resources
    class Brands
      class Campaigns
        # @api private
        #
        # @param client [Sentdm::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
