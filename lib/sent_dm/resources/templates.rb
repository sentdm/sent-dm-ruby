# frozen_string_literal: true

module SentDm
  module Resources
    class Templates
      # Some parameter documentations has been truncated, see
      # {SentDm::Models::TemplateCreateParams} for more details.
      #
      # Creates a new message template for the authenticated customer with comprehensive
      # template definitions including headers, body, footer, and interactive buttons.
      # Supports automatic metadata generation using AI (display name, language,
      # category). Optionally submits the template for WhatsApp review. The customer ID
      # is extracted from the authentication token.
      #
      # @overload create(definition:, x_api_key:, x_sender_id:, category: nil, language: nil, submit_for_review: nil, request_options: {})
      #
      # @param definition [SentDm::Models::TemplateDefinition] Body param: Template definition containing header, body, footer, and buttons
      #
      # @param x_api_key [String] Header param
      #
      # @param x_sender_id [String] Header param
      #
      # @param category [String, nil] Body param: The template category (e.g., MARKETING, UTILITY, AUTHENTICATION). Ca
      #
      # @param language [String, nil] Body param: The template language code (e.g., en_US, es_ES). Can only be set whe
      #
      # @param submit_for_review [Boolean] Body param: When false, the template will be saved as draft.
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::TemplateResponse]
      #
      # @see SentDm::Models::TemplateCreateParams
      def create(params)
        parsed, options = SentDm::TemplateCreateParams.dump_request(params)
        header_params = {x_api_key: "x-api-key", x_sender_id: "x-sender-id"}
        @client.request(
          method: :post,
          path: "v2/templates",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::TemplateResponse,
          options: options
        )
      end

      # Retrieves a specific message template by its unique identifier for the
      # authenticated customer with comprehensive template definitions including
      # headers, body, footer, and interactive buttons. The customer ID is extracted
      # from the authentication token.
      #
      # @overload retrieve(id, x_api_key:, x_sender_id:, request_options: {})
      #
      # @param id [String]
      # @param x_api_key [String]
      # @param x_sender_id [String]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::TemplateResponse]
      #
      # @see SentDm::Models::TemplateRetrieveParams
      def retrieve(id, params)
        parsed, options = SentDm::TemplateRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v2/templates/%1$s", id],
          headers: parsed.transform_keys(x_api_key: "x-api-key", x_sender_id: "x-sender-id"),
          model: SentDm::TemplateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::TemplateListParams} for more details.
      #
      # Retrieves all message templates available for the authenticated customer with
      # comprehensive template definitions including headers, body, footer, and
      # interactive buttons. Supports advanced filtering by search term, status, and
      # category, plus pagination. The customer ID is extracted from the authentication
      # token.
      #
      # @overload list(page:, page_size:, x_api_key:, x_sender_id:, category: nil, search: nil, status: nil, request_options: {})
      #
      # @param page [Integer] Query param: The page number (zero-indexed). Default is 0.
      #
      # @param page_size [Integer] Query param: The number of items per page (1-1000). Default is 100.
      #
      # @param x_api_key [String] Header param
      #
      # @param x_sender_id [String] Header param
      #
      # @param category [String, nil] Query param: Optional filter by template category (e.g., MARKETING, UTILITY, AUT
      #
      # @param search [String, nil] Query param: Optional search term to filter templates by name or content
      #
      # @param status [String, nil] Query param: Optional filter by template status (e.g., APPROVED, PENDING, REJECT
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::TemplateListResponse]
      #
      # @see SentDm::Models::TemplateListParams
      def list(params)
        parsed, options = SentDm::TemplateListParams.dump_request(params)
        query_params = [:page, :page_size, :category, :search, :status]
        @client.request(
          method: :get,
          path: "v2/templates",
          query: parsed.slice(*query_params).transform_keys(page_size: "pageSize"),
          headers: parsed.except(*query_params).transform_keys(
            x_api_key: "x-api-key",
            x_sender_id: "x-sender-id"
          ),
          model: SentDm::Models::TemplateListResponse,
          options: options
        )
      end

      # Deletes a specific message template by its unique identifier for the
      # authenticated customer with smart deletion strategy. Deletion behavior: - If
      # template has NO messages: Permanently deleted from database (hard delete). - If
      # template has messages: Marked as deleted but preserved for message history (soft
      # delete with snapshot). The template must exist and belong to the authenticated
      # customer to be deleted successfully. The customer ID is extracted from the
      # authentication token.
      #
      # @overload delete(id, x_api_key:, x_sender_id:, request_options: {})
      #
      # @param id [String] The unique identifier (GUID) of the resource to retrieve
      #
      # @param x_api_key [String]
      #
      # @param x_sender_id [String]
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SentDm::Models::TemplateDeleteParams
      def delete(id, params)
        parsed, options = SentDm::TemplateDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v2/templates/%1$s", id],
          headers: parsed.transform_keys(x_api_key: "x-api-key", x_sender_id: "x-sender-id"),
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
