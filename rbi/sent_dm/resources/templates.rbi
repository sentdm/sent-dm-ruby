# typed: strong

module SentDm
  module Resources
    class Templates
      # Creates a new message template for the authenticated customer with comprehensive
      # template definitions including headers, body, footer, and interactive buttons.
      # Supports automatic metadata generation using AI (display name, language,
      # category). Optionally submits the template for WhatsApp review. The customer ID
      # is extracted from the authentication token.
      sig do
        params(
          definition: SentDm::TemplateDefinition::OrHash,
          x_api_key: String,
          x_sender_id: String,
          category: T.nilable(String),
          language: T.nilable(String),
          submit_for_review: T::Boolean,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::TemplateResponse)
      end
      def create(
        # Body param: Template definition containing header, body, footer, and buttons
        definition:,
        # Header param
        x_api_key:,
        # Header param
        x_sender_id:,
        # Body param: The template category (e.g., MARKETING, UTILITY, AUTHENTICATION).
        # Can only be set when creating a new template. If not provided, will be
        # auto-generated using AI.
        category: nil,
        # Body param: The template language code (e.g., en_US, es_ES). Can only be set
        # when creating a new template. If not provided, will be auto-detected using AI.
        language: nil,
        # Body param: When false, the template will be saved as draft. When true, the
        # template will be submitted for review.
        submit_for_review: nil,
        request_options: {}
      )
      end

      # Retrieves a specific message template by its unique identifier for the
      # authenticated customer with comprehensive template definitions including
      # headers, body, footer, and interactive buttons. The customer ID is extracted
      # from the authentication token.
      sig do
        params(
          id: String,
          x_api_key: String,
          x_sender_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::TemplateResponse)
      end
      def retrieve(id, x_api_key:, x_sender_id:, request_options: {})
      end

      # Retrieves all message templates available for the authenticated customer with
      # comprehensive template definitions including headers, body, footer, and
      # interactive buttons. Supports advanced filtering by search term, status, and
      # category, plus pagination. The customer ID is extracted from the authentication
      # token.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          x_api_key: String,
          x_sender_id: String,
          category: T.nilable(String),
          search: T.nilable(String),
          status: T.nilable(String),
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::Models::TemplateListResponse)
      end
      def list(
        # Query param: The page number (zero-indexed). Default is 0.
        page:,
        # Query param: The number of items per page (1-1000). Default is 100.
        page_size:,
        # Header param
        x_api_key:,
        # Header param
        x_sender_id:,
        # Query param: Optional filter by template category (e.g., MARKETING, UTILITY,
        # AUTHENTICATION)
        category: nil,
        # Query param: Optional search term to filter templates by name or content
        search: nil,
        # Query param: Optional filter by template status (e.g., APPROVED, PENDING,
        # REJECTED, DRAFT)
        status: nil,
        request_options: {}
      )
      end

      # Deletes a specific message template by its unique identifier for the
      # authenticated customer with smart deletion strategy. Deletion behavior: - If
      # template has NO messages: Permanently deleted from database (hard delete). - If
      # template has messages: Marked as deleted but preserved for message history (soft
      # delete with snapshot). The template must exist and belong to the authenticated
      # customer to be deleted successfully. The customer ID is extracted from the
      # authentication token.
      sig do
        params(
          id: String,
          x_api_key: String,
          x_sender_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).void
      end
      def delete(
        # The unique identifier (GUID) of the resource to retrieve
        id,
        x_api_key:,
        x_sender_id:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SentDm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
