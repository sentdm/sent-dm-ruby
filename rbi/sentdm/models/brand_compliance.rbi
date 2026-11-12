# typed: strong

module Sentdm
  module Models
    class BrandCompliance < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::BrandCompliance, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(Sentdm::TcrBrandRelationship::TaggedSymbol)) }
      attr_accessor :brand_relationship

      # List of destination countries for messaging
      sig { returns(T.nilable(T::Array[Sentdm::DestinationCountry])) }
      attr_reader :destination_countries

      sig do
        params(
          destination_countries: T::Array[Sentdm::DestinationCountry::OrHash]
        ).void
      end
      attr_writer :destination_countries

      # Whether this is a TCR (Campaign Registry) application
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_tcr_application

      sig { params(is_tcr_application: T::Boolean).void }
      attr_writer :is_tcr_application

      # Additional notes about the business or use case
      sig { returns(T.nilable(String)) }
      attr_accessor :notes

      # Phone number prefix for messaging (e.g., "+1")
      sig { returns(T.nilable(String)) }
      attr_accessor :phone_number_prefix

      # Always null. The brand's free-text primary use case is no longer stored: it
      # reached neither TCR nor any decision, and its column is dropped with no
      # backfill, because the values were prose and the typed equivalent is the
      # campaign's MessagingUseCaseUS.
      #
      # Retained so existing v3 clients reading primary_use_case keep deserializing.
      # Unlike the profile sharing flags, which can answer false truthfully, there is no
      # value to report here — the field is present and empty rather than present and
      # wrong.
      sig { returns(T.nilable(String)) }
      attr_accessor :primary_use_case

      sig { returns(T.nilable(Sentdm::TcrVertical::TaggedSymbol)) }
      attr_accessor :vertical

      sig do
        params(
          brand_relationship: T.nilable(Sentdm::TcrBrandRelationship::OrSymbol),
          destination_countries: T::Array[Sentdm::DestinationCountry::OrHash],
          is_tcr_application: T::Boolean,
          notes: T.nilable(String),
          phone_number_prefix: T.nilable(String),
          primary_use_case: T.nilable(String),
          vertical: T.nilable(Sentdm::TcrVertical::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        brand_relationship: nil,
        # List of destination countries for messaging
        destination_countries: nil,
        # Whether this is a TCR (Campaign Registry) application
        is_tcr_application: nil,
        # Additional notes about the business or use case
        notes: nil,
        # Phone number prefix for messaging (e.g., "+1")
        phone_number_prefix: nil,
        # Always null. The brand's free-text primary use case is no longer stored: it
        # reached neither TCR nor any decision, and its column is dropped with no
        # backfill, because the values were prose and the typed equivalent is the
        # campaign's MessagingUseCaseUS.
        #
        # Retained so existing v3 clients reading primary_use_case keep deserializing.
        # Unlike the profile sharing flags, which can answer false truthfully, there is no
        # value to report here — the field is present and empty rather than present and
        # wrong.
        primary_use_case: nil,
        vertical: nil
      )
      end

      sig do
        override.returns(
          {
            brand_relationship:
              T.nilable(Sentdm::TcrBrandRelationship::TaggedSymbol),
            destination_countries: T::Array[Sentdm::DestinationCountry],
            is_tcr_application: T::Boolean,
            notes: T.nilable(String),
            phone_number_prefix: T.nilable(String),
            primary_use_case: T.nilable(String),
            vertical: T.nilable(Sentdm::TcrVertical::TaggedSymbol)
          }
        )
      end
      def to_hash
      end
    end
  end
end
