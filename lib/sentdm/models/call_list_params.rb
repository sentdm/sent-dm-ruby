# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Calls#list
    class CallListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute direction
      #   Optional direction filter: outbound for calls placed from your app, inbound for
      #   calls to one of your numbers
      #
      #   @return [String, nil]
      optional :direction, String, nil?: true

      # @!attribute from
      #   Only calls started at or after this time (ISO 8601)
      #
      #   @return [Time, nil]
      optional :from, Time, nil?: true

      # @!attribute number
      #   Optional filter on the number that owns the call, one of your voice-enabled
      #   numbers in E.164 format
      #
      #   @return [String, nil]
      optional :number, String, nil?: true

      # @!attribute page
      #   Page number (1-indexed)
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute page_size
      #   Number of items per page
      #
      #   @return [Integer, nil]
      optional :page_size, Integer

      # @!attribute status
      #   Optional status filter: initiated, ringing, answered, completed, failed,
      #   no_answer or rejected
      #
      #   @return [String, nil]
      optional :status, String, nil?: true

      # @!attribute to
      #   Only calls started at or before this time (ISO 8601)
      #
      #   @return [Time, nil]
      optional :to, Time, nil?: true

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(direction: nil, from: nil, number: nil, page: nil, page_size: nil, status: nil, to: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::CallListParams} for more details.
      #
      #   @param direction [String, nil] Optional direction filter: outbound for calls placed from your app, inbound for
      #
      #   @param from [Time, nil] Only calls started at or after this time (ISO 8601)
      #
      #   @param number [String, nil] Optional filter on the number that owns the call, one of your voice-enabled numb
      #
      #   @param page [Integer] Page number (1-indexed)
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param status [String, nil] Optional status filter: initiated, ringing, answered, completed, failed, no_answ
      #
      #   @param to [Time, nil] Only calls started at or before this time (ISO 8601)
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
