# frozen_string_literal: true

module SentDm
  module Resources
    class Brands
      class Campaigns
        # Some parameter documentations has been truncated, see
        # {SentDm::Models::Brands::CampaignCreateParams} for more details.
        #
        # Creates a new campaign scoped under a specific brand. The campaign is linked to
        # the specified brand. Each campaign must include at least one use case with
        # sample messages.
        #
        # @overload create(brand_id, campaign:, test_mode: nil, idempotency_key: nil, request_options: {})
        #
        # @param brand_id [String] Path param: Brand ID from route
        #
        # @param campaign [SentDm::Models::Brands::CampaignData] Body param: Campaign data
        #
        # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SentDm::Models::Brands::APIResponseTcrCampaignWithUseCases]
        #
        # @see SentDm::Models::Brands::CampaignCreateParams
        def create(brand_id, params)
          parsed, options = SentDm::Brands::CampaignCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :post,
            path: ["v3/brands/%1$s/campaigns", brand_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: SentDm::Brands::APIResponseTcrCampaignWithUseCases,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {SentDm::Models::Brands::CampaignUpdateParams} for more details.
        #
        # Updates an existing campaign scoped under a specific brand. Cannot update
        # campaigns that have already been submitted to TCR.
        #
        # @overload update(campaign_id, brand_id:, campaign:, test_mode: nil, idempotency_key: nil, request_options: {})
        #
        # @param campaign_id [String] Path param: Campaign ID from route
        #
        # @param brand_id [String] Path param: Brand ID from route
        #
        # @param campaign [SentDm::Models::Brands::CampaignData] Body param: Campaign data
        #
        # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SentDm::Models::Brands::APIResponseTcrCampaignWithUseCases]
        #
        # @see SentDm::Models::Brands::CampaignUpdateParams
        def update(campaign_id, params)
          parsed, options = SentDm::Brands::CampaignUpdateParams.dump_request(params)
          brand_id =
            parsed.delete(:brand_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :put,
            path: ["v3/brands/%1$s/campaigns/%2$s", brand_id, campaign_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: SentDm::Brands::APIResponseTcrCampaignWithUseCases,
            options: options
          )
        end

        # Retrieves all campaigns linked to a specific brand, including their use cases
        # and sample messages.
        #
        # @overload list(brand_id, request_options: {})
        #
        # @param brand_id [String] Brand ID from route
        #
        # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [SentDm::Models::Brands::CampaignListResponse]
        #
        # @see SentDm::Models::Brands::CampaignListParams
        def list(brand_id, params = {})
          @client.request(
            method: :get,
            path: ["v3/brands/%1$s/campaigns", brand_id],
            model: SentDm::Models::Brands::CampaignListResponse,
            options: params[:request_options]
          )
        end

        # Deletes a campaign by ID within a specific brand. The brand must belong to the
        # authenticated customer.
        #
        # @overload delete(campaign_id, brand_id:, body:, request_options: {})
        #
        # @param campaign_id [String] Path param: Campaign ID from route parameter
        #
        # @param brand_id [String] Path param: Brand ID from route parameter
        #
        # @param body [SentDm::Models::Brands::CampaignDeleteParams::Body] Body param: Request to delete a campaign from a brand
        #
        # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see SentDm::Models::Brands::CampaignDeleteParams
        def delete(campaign_id, params)
          parsed, options = SentDm::Brands::CampaignDeleteParams.dump_request(params)
          brand_id =
            parsed.delete(:brand_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v3/brands/%1$s/campaigns/%2$s", brand_id, campaign_id],
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
        end
      end
    end
  end
end
