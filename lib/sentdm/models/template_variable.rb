# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateVariable < Sentdm::Internal::Type::BaseModel
      # @!attribute name
      #   The variable's name, and the key callers use for it in a send request's
      #   parameters object. Must start with a letter and hold only letters, digits and
      #   underscores.
      #
      #   @return [String]
      required :name, String

      # @!attribute props
      #
      #   @return [Sentdm::Models::TemplateVariable::Props]
      required :props, -> { Sentdm::TemplateVariable::Props }

      # @!attribute type
      #   One of variable, link or media. Decides which Props fields are required.
      #
      #   @return [String]
      required :type, String

      # @!attribute id
      #   The variable's index, and the number its {{index:variable}} placeholder refers
      #   to.
      #
      #   Omitting it is only safe for a section holding a single variable. The field is a
      #   non-nullable int, so every variable that leaves it out defaults to 0, and a
      #   section with two such variables is refused by the unique-id rule ("variables
      #   must have unique IDs"). Number them from 0 in the order they appear.
      #
      #   @return [Integer, nil]
      optional :id, Integer

      # @!method initialize(name:, props:, type:, id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateVariable} for more details.
      #
      #   @param name [String] The variable's name, and the key callers use for it in a send request's paramete
      #
      #   @param props [Sentdm::Models::TemplateVariable::Props]
      #
      #   @param type [String] One of variable, link or media. Decides which Props fields
      #
      #   @param id [Integer] The variable's index, and the number its {{index:variable}} placeholder refers t

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
