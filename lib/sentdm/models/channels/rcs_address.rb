# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class RcsAddress < Sentdm::Internal::Type::BaseModel
        # @!attribute city
        #
        #   @return [String, nil]
        optional :city, String, nil?: true

        # @!attribute country
        #
        #   @return [String, nil]
        optional :country, String, nil?: true

        # @!attribute postal_code
        #
        #   @return [String, nil]
        optional :postal_code, String, nil?: true

        # @!attribute state
        #
        #   @return [String, nil]
        optional :state, String, nil?: true

        # @!attribute street
        #
        #   @return [String, nil]
        optional :street, String, nil?: true

        # @!method initialize(city: nil, country: nil, postal_code: nil, state: nil, street: nil)
        #   The registered address of the company behind the agent.
        #
        #   @param city [String, nil]
        #   @param country [String, nil]
        #   @param postal_code [String, nil]
        #   @param state [String, nil]
        #   @param street [String, nil]
      end
    end
  end
end
