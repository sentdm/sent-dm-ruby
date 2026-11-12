# typed: strong

module Sentdm
  module Models
    module Channels
      module SMS
        class APIResponseOfSuppliedCompliance < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Channels::SMS::APIResponseOfSuppliedCompliance,
                Sentdm::Internal::AnyHash
              )
            end

          # What a market has been given: the identity it registers under, its programme,
          # and any documents attached.
          #
          # What it does not carry is what the market asks for. That is the subject of GET
          # /v3/compliance/requirements, and it is the same answer for every caller — a
          # description of what a compliance regime wants, not a record of one customer's
          # progress through it. It was reported here as well for a while, which put the
          # same array in six response shapes and left a caller deciding which of two
          # sources to believe.
          #
          # Present on a list read for markets that register (carrying brand and campaign),
          # but with documents absent — documents are not fetched for a list, because a
          # catalog lookup and a document read per market would multiply across a page.
          # Absent documents is distinct from an empty list: absent says they were not
          # fetched; empty says the market has been given none. The parent object is null
          # only when the market registers with nobody and compliance was not computed —
          # nothing to show at all.
          sig { returns(T.nilable(Sentdm::Channels::SuppliedCompliance)) }
          attr_reader :data

          sig do
            params(
              data: T.nilable(Sentdm::Channels::SuppliedCompliance::OrHash)
            ).void
          end
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
              data: T.nilable(Sentdm::Channels::SuppliedCompliance::OrHash),
              error: T.nilable(Sentdm::ErrorDetail::OrHash),
              meta: Sentdm::APIMeta::OrHash,
              success: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # What a market has been given: the identity it registers under, its programme,
            # and any documents attached.
            #
            # What it does not carry is what the market asks for. That is the subject of GET
            # /v3/compliance/requirements, and it is the same answer for every caller — a
            # description of what a compliance regime wants, not a record of one customer's
            # progress through it. It was reported here as well for a while, which put the
            # same array in six response shapes and left a caller deciding which of two
            # sources to believe.
            #
            # Present on a list read for markets that register (carrying brand and campaign),
            # but with documents absent — documents are not fetched for a list, because a
            # catalog lookup and a document read per market would multiply across a page.
            # Absent documents is distinct from an empty list: absent says they were not
            # fetched; empty says the market has been given none. The parent object is null
            # only when the market registers with nobody and compliance was not computed —
            # nothing to show at all.
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
                data: T.nilable(Sentdm::Channels::SuppliedCompliance),
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
end
