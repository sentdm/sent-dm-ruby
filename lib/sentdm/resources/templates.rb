# frozen_string_literal: true

module Sentdm
  module Resources
    class Templates
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::TemplateCreateParams} for more details.
      #
      # Creates a new message template for the authenticated customer with comprehensive
      # template definitions including headers, body, footer, and interactive buttons.
      # Supports automatic metadata generation using AI (display name, language,
      # category). Optionally submits the template for WhatsApp review. The customer ID
      # is extracted from the authentication token.
      #
      # @overload create(definition:, category: nil, language: nil, submit_for_review: nil, request_options: {})
      #
      # @param definition [Sentdm::Models::TemplateDefinition] Template definition containing header, body, footer, and buttons
      #
      # @param category [String, nil] The template category (e.g., MARKETING, UTILITY, AUTHENTICATION). Can only be se
      #
      # @param language [String, nil] The template language code (e.g., en_US, es_ES). Can only be set when creating a
      #
      # @param submit_for_review [Boolean] When false, the template will be saved as draft.
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::TemplateResponseV2]
      #
      # @see Sentdm::Models::TemplateCreateParams
      def create(params)
        parsed, options = Sentdm::TemplateCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v2/templates",
          body: parsed,
          model: Sentdm::TemplateResponseV2,
          options: options
        )
      end

      # Retrieves a specific message template by its unique identifier for the
      # authenticated customer with comprehensive template definitions including
      # headers, body, footer, and interactive buttons. The customer ID is extracted
      # from the authentication token.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::TemplateResponseV2]
      #
      # @see Sentdm::Models::TemplateRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["v2/templates/%1$s", id],
          model: Sentdm::TemplateResponseV2,
          options: params[:request_options]
        )
      end

      # Retrieves all message templates available for the authenticated customer with
      # comprehensive template definitions including headers, body, footer, and
      # interactive buttons. Supports advanced filtering by search term, status, and
      # category, plus pagination. The customer ID is extracted from the authentication
      # token.
      #
      # @overload list(page:, page_size:, category: nil, search: nil, status: nil, request_options: {})
      #
      # @param page [Integer] The page number (zero-indexed). Default is 0.
      #
      # @param page_size [Integer] The number of items per page (1-1000). Default is 100.
      #
      # @param category [String, nil] Optional filter by template category (e.g., MARKETING, UTILITY, AUTHENTICATION)
      #
      # @param search [String, nil] Optional search term to filter templates by name or content
      #
      # @param status [String, nil] Optional filter by template status (e.g., APPROVED, PENDING, REJECTED, DRAFT)
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::TemplateListResponse]
      #
      # @see Sentdm::Models::TemplateListParams
      def list(params)
        parsed, options = Sentdm::TemplateListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v2/templates",
          query: parsed.transform_keys(page_size: "pageSize"),
          model: Sentdm::Models::TemplateListResponse,
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
      # @overload delete(id, request_options: {})
      #
      # @param id [String] The unique identifier (GUID) of the resource to retrieve
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Sentdm::Models::TemplateDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["v2/templates/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Sentdm::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
