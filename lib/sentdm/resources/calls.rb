# frozen_string_literal: true

module Sentdm
  module Resources
    class Calls
      # @return [Sentdm::Resources::Calls::Participants]
      attr_reader :participants

      # @api private
      #
      # @param client [Sentdm::Client]
      def initialize(client:)
        @client = client
        @participants = Sentdm::Resources::Calls::Participants.new(client: client)
      end
    end
  end
end
