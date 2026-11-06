# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateHeaderLocation < Sentdm::Internal::Type::BaseModel
      # @!attribute address
      #
      #   @return [String]
      required :address, String

      # @!attribute latitude
      #
      #   @return [String]
      required :latitude, String

      # @!attribute longitude
      #
      #   @return [String]
      required :longitude, String

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!method initialize(address:, latitude:, longitude:, name:)
      #   The map pin a location header drops. Meta wants none of this at creation — the
      #   component is just {"type":"header","format":"location"} — so these values exist
      #   for Sent: a preview, and the default a StaticResource header falls back to at
      #   send.
      #
      #   @param address [String]
      #   @param latitude [String]
      #   @param longitude [String]
      #   @param name [String]
    end
  end
end
