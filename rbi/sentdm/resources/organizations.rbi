# typed: strong

module Sentdm
  module Resources
    class Organizations
      sig { returns(Sentdm::Resources::Organizations::Users) }
      attr_reader :users

      # @api private
      sig { params(client: Sentdm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
