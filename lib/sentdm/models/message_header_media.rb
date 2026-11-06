# frozen_string_literal: true

module Sentdm
  module Models
    class MessageHeaderMedia < Sentdm::Internal::Type::BaseModel
      # @!attribute type
      #   "image", "video" or "document" — taken from the header's media variable.
      #
      #   @return [String, nil]
      optional :type, String

      # @!attribute url
      #   The https URL the caller supplied for this send. Never the template's stored
      #   props.sample, which is Meta's expiring header_handle rather than what was
      #   delivered.
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(type: nil, url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageHeaderMedia} for more details.
      #
      #   The media asset that rode a message's header, recorded as sent.
      #
      #   @param type [String] "image", "video" or "document" — taken from the header's media variable.
      #
      #   @param url [String] The https URL the caller supplied for this send. Never the template's stored
    end
  end
end
