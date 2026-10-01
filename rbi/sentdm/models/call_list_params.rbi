# typed: strong

module Sentdm
  module Models
    class CallListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::CallListParams, Sentdm::Internal::AnyHash)
        end

      # Optional direction filter: outbound for calls placed from your app, inbound for
      # calls to one of your numbers
      sig { returns(T.nilable(String)) }
      attr_accessor :direction

      # Only calls started at or after this time (ISO 8601)
      sig { returns(T.nilable(Time)) }
      attr_accessor :from

      # Optional filter on the number that owns the call, one of your voice-enabled
      # numbers in E.164 format
      sig { returns(T.nilable(String)) }
      attr_accessor :number

      # Page number (1-indexed)
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Number of items per page
      sig { returns(T.nilable(Integer)) }
      attr_reader :page_size

      sig { params(page_size: Integer).void }
      attr_writer :page_size

      # Optional status filter: initiated, ringing, answered, completed, failed,
      # no_answer or rejected
      sig { returns(T.nilable(String)) }
      attr_accessor :status

      # Only calls started at or before this time (ISO 8601)
      sig { returns(T.nilable(Time)) }
      attr_accessor :to

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          direction: T.nilable(String),
          from: T.nilable(Time),
          number: T.nilable(String),
          page: Integer,
          page_size: Integer,
          status: T.nilable(String),
          to: T.nilable(Time),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Optional direction filter: outbound for calls placed from your app, inbound for
        # calls to one of your numbers
        direction: nil,
        # Only calls started at or after this time (ISO 8601)
        from: nil,
        # Optional filter on the number that owns the call, one of your voice-enabled
        # numbers in E.164 format
        number: nil,
        # Page number (1-indexed)
        page: nil,
        # Number of items per page
        page_size: nil,
        # Optional status filter: initiated, ringing, answered, completed, failed,
        # no_answer or rejected
        status: nil,
        # Only calls started at or before this time (ISO 8601)
        to: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            direction: T.nilable(String),
            from: T.nilable(Time),
            number: T.nilable(String),
            page: Integer,
            page_size: Integer,
            status: T.nilable(String),
            to: T.nilable(Time),
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
