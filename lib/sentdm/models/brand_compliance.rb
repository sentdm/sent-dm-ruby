# frozen_string_literal: true

module Sentdm
  module Models
    class BrandCompliance < Sentdm::Internal::Type::BaseModel
      # @!attribute brand_relationship
      #
      #   @return [Symbol, Sentdm::Models::TcrBrandRelationship, nil]
      optional :brand_relationship, enum: -> { Sentdm::TcrBrandRelationship }, nil?: true

      # @!attribute destination_countries
      #   List of destination countries for messaging
      #
      #   @return [Array<Sentdm::Models::DestinationCountry>, nil]
      optional :destination_countries, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::DestinationCountry] }

      # @!attribute is_tcr_application
      #   Whether this is a TCR (Campaign Registry) application
      #
      #   @return [Boolean, nil]
      optional :is_tcr_application, Sentdm::Internal::Type::Boolean

      # @!attribute notes
      #   Additional notes about the business or use case
      #
      #   @return [String, nil]
      optional :notes, String, nil?: true

      # @!attribute phone_number_prefix
      #   Phone number prefix for messaging (e.g., "+1")
      #
      #   @return [String, nil]
      optional :phone_number_prefix, String, nil?: true

      # @!attribute primary_use_case
      #   @deprecated
      #
      #   Always null. The brand's free-text primary use case is no longer stored: it
      #   reached neither TCR nor any decision, and its column is dropped with no
      #   backfill, because the values were prose and the typed equivalent is the
      #   campaign's MessagingUseCaseUS.
      #
      #   Retained so existing v3 clients reading primary_use_case keep deserializing.
      #   Unlike the profile sharing flags, which can answer false truthfully, there is no
      #   value to report here — the field is present and empty rather than present and
      #   wrong.
      #
      #   @return [String, nil]
      optional :primary_use_case, String, nil?: true

      # @!attribute vertical
      #
      #   @return [Symbol, Sentdm::Models::TcrVertical, nil]
      optional :vertical, enum: -> { Sentdm::TcrVertical }, nil?: true

      # @!method initialize(brand_relationship: nil, destination_countries: nil, is_tcr_application: nil, notes: nil, phone_number_prefix: nil, primary_use_case: nil, vertical: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::BrandCompliance} for more details.
      #
      #   @param brand_relationship [Symbol, Sentdm::Models::TcrBrandRelationship, nil]
      #
      #   @param destination_countries [Array<Sentdm::Models::DestinationCountry>] List of destination countries for messaging
      #
      #   @param is_tcr_application [Boolean] Whether this is a TCR (Campaign Registry) application
      #
      #   @param notes [String, nil] Additional notes about the business or use case
      #
      #   @param phone_number_prefix [String, nil] Phone number prefix for messaging (e.g., "+1")
      #
      #   @param primary_use_case [String, nil] Always null. The brand's free-text primary use case is no longer stored: it reac
      #
      #   @param vertical [Symbol, Sentdm::Models::TcrVertical, nil]
    end
  end
end
