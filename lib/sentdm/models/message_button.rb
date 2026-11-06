# frozen_string_literal: true

module Sentdm
  module Models
    class MessageButton < Sentdm::Internal::Type::BaseModel
      # @!attribute postback_data
      #
      #   @return [String, nil]
      optional :postback_data, String, api_name: :postbackData, nil?: true

      # @!attribute text
      #
      #   @return [String, nil]
      optional :text, String, nil?: true

      # @!attribute type
      #
      #   @return [String, nil]
      optional :type, String

      # @!attribute value
      #
      #   @return [String, nil]
      optional :value, String

      # @!method initialize(postback_data: nil, text: nil, type: nil, value: nil)
      #   @param postback_data [String, nil]
      #   @param text [String, nil]
      #   @param type [String]
      #   @param value [String]
    end
  end
end
