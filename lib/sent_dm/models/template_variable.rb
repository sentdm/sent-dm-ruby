# frozen_string_literal: true

module SentDm
  module Models
    class TemplateVariable < SentDm::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [Integer, nil]
      optional :id, Integer

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute props
      #
      #   @return [SentDm::Models::TemplateVariable::Props, nil]
      optional :props, -> { SentDm::TemplateVariable::Props }

      # @!attribute type
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(id: nil, name: nil, props: nil, type: nil)
      #   @param id [Integer]
      #   @param name [String]
      #   @param props [SentDm::Models::TemplateVariable::Props]
      #   @param type [String]

      # @see SentDm::Models::TemplateVariable#props
      class Props < SentDm::Internal::Type::BaseModel
        # @!attribute alt
        #
        #   @return [String, nil]
        optional :alt, String, nil?: true

        # @!attribute media_type
        #
        #   @return [String, nil]
        optional :media_type, String, api_name: :mediaType, nil?: true

        # @!attribute sample
        #
        #   @return [String, nil]
        optional :sample, String, nil?: true

        # @!attribute short_url
        #
        #   @return [String, nil]
        optional :short_url, String, api_name: :shortUrl, nil?: true

        # @!attribute url
        #
        #   @return [String, nil]
        optional :url, String, nil?: true

        # @!attribute variable_type
        #
        #   @return [String, nil]
        optional :variable_type, String, api_name: :variableType, nil?: true

        # @!method initialize(alt: nil, media_type: nil, sample: nil, short_url: nil, url: nil, variable_type: nil)
        #   @param alt [String, nil]
        #   @param media_type [String, nil]
        #   @param sample [String, nil]
        #   @param short_url [String, nil]
        #   @param url [String, nil]
        #   @param variable_type [String, nil]
      end
    end
  end
end
