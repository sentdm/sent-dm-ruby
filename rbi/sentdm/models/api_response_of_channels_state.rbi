# typed: strong

module Sentdm
  module Models
    class APIResponseOfChannelsState < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::APIResponseOfChannelsState, Sentdm::Internal::AnyHash)
        end

      # The channels a profile sends on. SMS is a list because a profile can send in
      # several markets; WhatsApp and RCS are single, because a profile has one business
      # account and one agent.
      sig { returns(T.nilable(Sentdm::ChannelsState)) }
      attr_reader :data

      sig { params(data: T.nilable(Sentdm::ChannelsState::OrHash)).void }
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::ErrorDetail)) }
      attr_reader :error

      sig { params(error: T.nilable(Sentdm::ErrorDetail::OrHash)).void }
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: Sentdm::APIMeta::OrHash).void }
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(Sentdm::ChannelsState::OrHash),
          error: T.nilable(Sentdm::ErrorDetail::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The channels a profile sends on. SMS is a list because a profile can send in
        # several markets; WhatsApp and RCS are single, because a profile has one business
        # account and one agent.
        data: nil,
        # Error information
        error: nil,
        # Request and response metadata
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(Sentdm::ChannelsState),
            error: T.nilable(Sentdm::ErrorDetail),
            meta: Sentdm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
