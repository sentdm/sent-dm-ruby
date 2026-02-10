# frozen_string_literal: true

module Sentdm
  module Resources
    class Organizations
      # @return [Sentdm::Resources::Organizations::Users]
      attr_reader :users

      # @api private
      #
      # @param client [Sentdm::Client]
      def initialize(client:)
        @client = client
        @users = Sentdm::Resources::Organizations::Users.new(client: client)
      end
    end
  end
end
