# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Me#retrieve
    class MeRetrieveParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
