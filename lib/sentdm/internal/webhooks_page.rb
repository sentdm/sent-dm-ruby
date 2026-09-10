# frozen_string_literal: true

module Sentdm
  module Internal
    # @generic Elem
    #
    # @example
    #   if webhooks_page.has_next?
    #     webhooks_page = webhooks_page.next_page
    #   end
    #
    # @example
    #   webhooks_page.auto_paging_each do |webhook|
    #     puts(webhook)
    #   end
    class WebhooksPage
      include Sentdm::Internal::Type::BasePage

      # @return [Data]
      attr_accessor :data

      # @return [Boolean]
      def next_page?
        data&.pagination&.has_more
      end

      # @raise [Sentdm::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = Sentdm::Internal::Util.deep_merge(
          @req,
          {query: {page: @req.fetch(:query).fetch(:page, 1).to_i.succ}}
        )
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.data&.webhooks&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [Sentdm::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {data: Hash | nil => data}
          if (webhooks = data[:webhooks]).is_a?(Array)
            data = {**data, webhooks: webhooks.map { Sentdm::Internal::Type::Converter.coerce(@model, _1) }}
          end
          @data = Sentdm::Internal::Type::Converter.coerce(Sentdm::Internal::WebhooksPage::Data, data)
        else
        end
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = Sentdm::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)}>"
      end

      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute pagination
        #
        #   @return [Data::Pagination, nil]
        optional :pagination, -> { Data::Pagination }

        # @!attribute webhooks
        #
        #   @return [Array<Object>, nil]
        optional :webhooks, Sentdm::Internal::Type::ArrayOf[Sentdm::Internal::Type::Unknown]

        # @!method initialize(pagination: nil, webhooks: nil)
        #   @param pagination [Data::Pagination]
        #   @param webhooks [Array<Object>]

        # @see Data#pagination
        class Pagination < Sentdm::Internal::Type::BaseModel
          # @!attribute has_more
          #
          #   @return [Boolean, nil]
          optional :has_more, Sentdm::Internal::Type::Boolean

          # @!method initialize(has_more: nil)
          #   @param has_more [Boolean]
        end
      end
    end
  end
end
