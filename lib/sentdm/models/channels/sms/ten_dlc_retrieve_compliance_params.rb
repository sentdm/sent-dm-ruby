# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      module SMS
        # @see Sentdm::Resources::Channels::SMS::TenDlc#retrieve_compliance
        class TenDlcRetrieveComplianceParams < Sentdm::Internal::Type::BaseModel
          extend Sentdm::Internal::Type::RequestParameters::Converter
          include Sentdm::Internal::Type::RequestParameters

          # @!attribute x_profile_id
          #
          #   @return [String, nil]
          optional :x_profile_id, String

          # @!method initialize(x_profile_id: nil, request_options: {})
          #   @param x_profile_id [String]
          #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
