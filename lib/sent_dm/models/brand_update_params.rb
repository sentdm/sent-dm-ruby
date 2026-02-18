# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Brands#update
    class BrandUpdateParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute brand
      #   Brand and KYC information
      #
      #   @return [SentDm::Models::BrandData]
      required :brand, -> { SentDm::BrandData }

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, SentDm::Internal::Type::Boolean

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(brand:, test_mode: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::BrandUpdateParams} for more details.
      #
      #   @param brand [SentDm::Models::BrandData] Brand and KYC information
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
