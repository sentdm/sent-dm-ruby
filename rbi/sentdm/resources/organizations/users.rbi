# typed: strong

module Sentdm
  module Resources
    class Organizations
      class Users
        # @api private
        sig { params(client: Sentdm::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
