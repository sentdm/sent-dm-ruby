# typed: strong

module Sentdm
  module Resources
    class Calls
      sig { returns(Sentdm::Resources::Calls::Participants) }
      attr_reader :participants

      # @api private
      sig { params(client: Sentdm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
