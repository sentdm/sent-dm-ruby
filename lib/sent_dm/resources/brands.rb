# frozen_string_literal: true

module SentDm
  module Resources
    class Brands
      # @return [SentDm::Resources::Brands::Campaigns]
      attr_reader :campaigns

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::BrandCreateParams} for more details.
      #
      # Creates a new brand and associated information. This endpoint automatically sets
      # inheritTcrBrand=false when a brand is created.
      #
      # @overload create(brand:, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param brand [SentDm::Models::BrandData] Body param: Brand and KYC information
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::APIResponseBrandWithKYC]
      #
      # @see SentDm::Models::BrandCreateParams
      def create(params)
        parsed, options = SentDm::BrandCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "v3/brands",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::APIResponseBrandWithKYC,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::BrandUpdateParams} for more details.
      #
      # Updates an existing brand and its associated information. Cannot update brands
      # that have already been submitted to TCR or inherited brands.
      #
      # @overload update(brand_id, brand:, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param brand_id [String] Path param: Brand ID from route
      #
      # @param brand [SentDm::Models::BrandData] Body param: Brand and KYC information
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::APIResponseBrandWithKYC]
      #
      # @see SentDm::Models::BrandUpdateParams
      def update(brand_id, params)
        parsed, options = SentDm::BrandUpdateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :put,
          path: ["v3/brands/%1$s", brand_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::APIResponseBrandWithKYC,
          options: options
        )
      end

      # Retrieves all brands for the authenticated customer with information in a
      # flattened structure. Includes inherited brands if inheritTcrBrand=true.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::BrandListResponse]
      #
      # @see SentDm::Models::BrandListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v3/brands",
          model: SentDm::Models::BrandListResponse,
          options: params[:request_options]
        )
      end

      # Delete a brand by ID. The brand must belong to the authenticated customer.
      #
      # @overload delete(brand_id, body:, request_options: {})
      #
      # @param brand_id [String] Brand ID from route parameter
      #
      # @param body [SentDm::Models::BrandDeleteParams::Body] Request to delete a brand
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SentDm::Models::BrandDeleteParams
      def delete(brand_id, params)
        parsed, options = SentDm::BrandDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v3/brands/%1$s", brand_id],
          headers: {"content-type" => "*/*"},
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # @api private
      #
      # @param client [SentDm::Client]
      def initialize(client:)
        @client = client
        @campaigns = SentDm::Resources::Brands::Campaigns.new(client: client)
      end
    end
  end
end
