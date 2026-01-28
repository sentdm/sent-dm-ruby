# frozen_string_literal: true

module Sentdm
  module Models
    module Organizations
      # @see Sentdm::Resources::Organizations::Users#list
      class UserListResponse < Sentdm::Internal::Type::BaseModel
        # @!attribute page
        #
        #   @return [Integer, nil]
        optional :page, Integer

        # @!attribute page_size
        #
        #   @return [Integer, nil]
        optional :page_size, Integer, api_name: :pageSize

        # @!attribute total_count
        #
        #   @return [Integer, nil]
        optional :total_count, Integer, api_name: :totalCount

        # @!attribute users
        #
        #   @return [Array<Sentdm::Models::Organizations::CustomerUser>, nil]
        optional :users, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Organizations::CustomerUser] }

        # @!method initialize(page: nil, page_size: nil, total_count: nil, users: nil)
        #   @param page [Integer]
        #   @param page_size [Integer]
        #   @param total_count [Integer]
        #   @param users [Array<Sentdm::Models::Organizations::CustomerUser>]
      end
    end
  end
end
