# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateVariableProps < Sentdm::Internal::Type::BaseModel
      # @!attribute media_type
      #
      #   @return [String]
      required :media_type, String, api_name: :mediaType

      # @!attribute sample
      #   Example value substituted into the template when previewing it and when
      #   submitting it to Meta for review. Free text by nature, so the converter accepts
      #   a JSON number or boolean here and normalizes it — see
      #   JsonScalarToStringConverter for why — and guarantees it is always serialized
      #   back out as a JSON string.
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
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateVariableProps} for more details.
      #
      #   @param media_type [String]
      #
      #   @param sample [String] Example value substituted into the template when previewing it and when submitti
      #
      #   @param url [String]
      #
      #   @param variable_type [String]
      #
      #   @param alt [String, nil]
      #
      #   @param regex [String, nil]
      #
      #   @param short_url [String, nil]
    end
  end
end
