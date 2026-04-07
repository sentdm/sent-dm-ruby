# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateVariable < Sentdm::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute props
      #
      #   @return [Sentdm::Models::TemplateVariable::Props]
      required :props, -> { Sentdm::TemplateVariable::Props }

      # @!attribute type
      #
      #   @return [String]
      required :type, String

      # @!attribute id
      #
      #   @return [Integer, nil]
      optional :id, Integer

      # @!method initialize(name:, props:, type:, id: nil)
      #   @param name [String]
      #   @param props [Sentdm::Models::TemplateVariable::Props]
      #   @param type [String]
      #   @param id [Integer]

      # @see Sentdm::Models::TemplateVariable#props
      class Props < Sentdm::Internal::Type::BaseModel
        # @!attribute media_type
        #
        #   @return [String]
        required :media_type, String, api_name: :mediaType

        # @!attribute sample
        #
        #   @return [String]
        required :sample, String

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!attribute variable_type
        #
        #   @return [String]
        required :variable_type, String, api_name: :variableType

        # @!attribute alt
        #
        #   @return [String, nil]
        optional :alt, String, nil?: true

        # @!attribute regex
        #
        #   @return [String, nil]
        optional :regex, String, nil?: true

        # @!attribute short_url
        #
        #   @return [String, nil]
        optional :short_url, String, api_name: :shortUrl, nil?: true

        # @!method initialize(media_type:, sample:, url:, variable_type:, alt: nil, regex: nil, short_url: nil)
        #   @param media_type [String]
        #   @param sample [String]
        #   @param url [String]
        #   @param variable_type [String]
        #   @param alt [String, nil]
        #   @param regex [String, nil]
        #   @param short_url [String, nil]
      end
    end
  end
end
