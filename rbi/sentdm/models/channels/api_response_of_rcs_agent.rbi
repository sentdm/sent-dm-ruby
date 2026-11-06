# typed: strong

module Sentdm
  module Models
    module Channels
      class APIResponseOfRcsAgent < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::APIResponseOfRcsAgent,
              Sentdm::Internal::AnyHash
            )
          end

        # An RCS agent as its owner sees it: the order form back, plus where the
        # submission stands.
        #
        # Not RcsSenderResponse. That one is the admin projection and carries the pipeline
        # we track about a customer's request — internalStatus, statusReason, isLaunched —
        # and the S3 keys behind the assets. None of that is the customer's to read: an
        # internal status is a note to ourselves, and an S3 key is a storage detail that
        # would become a contract the moment it was published.
        #
        # What is here is what the caller sent, in the names it sent them under, plus the
        # three things only we can answer: the record's id, its status, and the number it
        # sends from. So a read after a write shows the form as stored rather than as
        # echoed.
        sig { returns(T.nilable(Sentdm::Channels::RcsAgent)) }
        attr_reader :data

        sig { params(data: T.nilable(Sentdm::Channels::RcsAgent::OrHash)).void }
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
            data: T.nilable(Sentdm::Channels::RcsAgent::OrHash),
            error: T.nilable(Sentdm::ErrorDetail::OrHash),
            meta: Sentdm::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # An RCS agent as its owner sees it: the order form back, plus where the
          # submission stands.
          #
          # Not RcsSenderResponse. That one is the admin projection and carries the pipeline
          # we track about a customer's request — internalStatus, statusReason, isLaunched —
          # and the S3 keys behind the assets. None of that is the customer's to read: an
          # internal status is a note to ourselves, and an S3 key is a storage detail that
          # would become a contract the moment it was published.
          #
          # What is here is what the caller sent, in the names it sent them under, plus the
          # three things only we can answer: the record's id, its status, and the number it
          # sends from. So a read after a write shows the form as stored rather than as
          # echoed.
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
              data: T.nilable(Sentdm::Channels::RcsAgent),
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
end
