# typed: strong

module Sentdm
  module Models
    WhatsappChannel = Channels::WhatsappChannel

    module Channels
      class WhatsappChannel < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::WhatsappChannel, Sentdm::Internal::AnyHash)
          end

        # Derived from the organization's shared-account listing, like SolutionId.
        sig { returns(T.nilable(String)) }
        attr_accessor :owner_business_id

        # The Meta phone-number id the profile sends from, or null when the account is
        # connected but no number has been named yet — which is what a provisioning status
        # means here.
        sig { returns(T.nilable(String)) }
        attr_accessor :phone_number_id

        # A sentence for reason_code, saying what to do where it is yours. Omitted while
        # ACTIVE.
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        # Why the account is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
        # such as CHANNEL_001 (something you owe) or CHANNEL_009 (under review). Switch on
        # this rather than on reason. Omitted while ACTIVE. Read-only; when nothing more
        # specific is known it is the generic reason for the status.
        sig { returns(T.nilable(String)) }
        attr_accessor :reason_code

        # Derived, not echoed. The request no longer accepts this — it is read off the
        # organization's shared-account listing at connect time and reported back so a
        # caller can see which partnership the account actually arrived through.
        sig { returns(T.nilable(String)) }
        attr_accessor :solution_id

        # Read-only. Never carries a token — the row holds that and it is not returned.
        # ACTION_NEEDED when no account is connected or the account has no phone number:
        # both are yours to do.
        sig do
          returns(
            T.nilable(Sentdm::Channels::WhatsappChannel::Status::TaggedSymbol)
          )
        end
        attr_accessor :status

        sig { returns(T.nilable(String)) }
        attr_accessor :waba_id

        # The profile's WhatsApp account. Its status is Meta's verification state.
        sig do
          params(
            owner_business_id: T.nilable(String),
            phone_number_id: T.nilable(String),
            reason: T.nilable(String),
            reason_code: T.nilable(String),
            solution_id: T.nilable(String),
            status:
              T.nilable(Sentdm::Channels::WhatsappChannel::Status::OrSymbol),
            waba_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Derived from the organization's shared-account listing, like SolutionId.
          owner_business_id: nil,
          # The Meta phone-number id the profile sends from, or null when the account is
          # connected but no number has been named yet — which is what a provisioning status
          # means here.
          phone_number_id: nil,
          # A sentence for reason_code, saying what to do where it is yours. Omitted while
          # ACTIVE.
          reason: nil,
          # Why the account is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
          # such as CHANNEL_001 (something you owe) or CHANNEL_009 (under review). Switch on
          # this rather than on reason. Omitted while ACTIVE. Read-only; when nothing more
          # specific is known it is the generic reason for the status.
          reason_code: nil,
          # Derived, not echoed. The request no longer accepts this — it is read off the
          # organization's shared-account listing at connect time and reported back so a
          # caller can see which partnership the account actually arrived through.
          solution_id: nil,
          # Read-only. Never carries a token — the row holds that and it is not returned.
          # ACTION_NEEDED when no account is connected or the account has no phone number:
          # both are yours to do.
          status: nil,
          waba_id: nil
        )
        end

        sig do
          override.returns(
            {
              owner_business_id: T.nilable(String),
              phone_number_id: T.nilable(String),
              reason: T.nilable(String),
              reason_code: T.nilable(String),
              solution_id: T.nilable(String),
              status:
                T.nilable(
                  Sentdm::Channels::WhatsappChannel::Status::TaggedSymbol
                ),
              waba_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Read-only. Never carries a token — the row holds that and it is not returned.
        # ACTION_NEEDED when no account is connected or the account has no phone number:
        # both are yours to do.
        module Status
          extend Sentdm::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Sentdm::Channels::WhatsappChannel::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PROVISIONING =
            T.let(
              :PROVISIONING,
              Sentdm::Channels::WhatsappChannel::Status::TaggedSymbol
            )
          ACTION_NEEDED =
            T.let(
              :ACTION_NEEDED,
              Sentdm::Channels::WhatsappChannel::Status::TaggedSymbol
            )
          PENDING_REVIEW =
            T.let(
              :PENDING_REVIEW,
              Sentdm::Channels::WhatsappChannel::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :ACTIVE,
              Sentdm::Channels::WhatsappChannel::Status::TaggedSymbol
            )
          INACTIVE =
            T.let(
              :INACTIVE,
              Sentdm::Channels::WhatsappChannel::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Sentdm::Channels::WhatsappChannel::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
