# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#retrieve_message_summary
    class ContactRetrieveMessageSummaryParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute contact_id
      #
      #   @return [String]
      required :contact_id, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(contact_id:, x_profile_id: nil, request_options: {})
      #   @param contact_id [String]
      #   @param x_profile_id [String]
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
