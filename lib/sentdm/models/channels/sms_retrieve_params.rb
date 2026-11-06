# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::SMS#retrieve
      class SMSRetrieveParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute country
        #
        #   @return [String]
        required :country, String

        # @!attribute type
        #
        #   @return [String]
        required :type, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(country:, type:, x_profile_id: nil, request_options: {})
        #   @param country [String]
        #   @param type [String]
        #   @param x_profile_id [String]
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
