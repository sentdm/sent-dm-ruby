# typed: strong

module Sentdm
  module Models
    module Channels
      class RcsAgent < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::RcsAgent, Sentdm::Internal::AnyHash)
          end

        # The agent record. Stable across the whole approval, and what support will ask
        # for.
        #
        # Nullable and omitted when absent: a sender profile with RCS intent records the
        # channel but has no agent until the order form is submitted, so no id exists to
        # report. A zero GUID is not a valid id and is worse than the field being absent.
        sig { returns(T.nilable(String)) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_accessor :agent_use_case

        sig { returns(T.nilable(String)) }
        attr_accessor :brand_color

        sig { returns(T.nilable(String)) }
        attr_accessor :brand_email

        sig { returns(T.nilable(String)) }
        attr_accessor :brand_name

        sig { returns(T.nilable(String)) }
        attr_accessor :brand_phone_number

        sig { returns(T.nilable(String)) }
        attr_accessor :brief_company_description

        sig { returns(T.nilable(String)) }
        attr_accessor :company_ein

        sig { returns(T.nilable(String)) }
        attr_accessor :contact_name_and_title

        # Omitted when no real agent record exists — the intent-only path has no creation
        # timestamp.
        sig { returns(T.nilable(Time)) }
        attr_accessor :created_at

        sig { returns(T.nilable(String)) }
        attr_accessor :customer_support_email

        sig { returns(T.nilable(String)) }
        attr_accessor :customer_support_phone_number

        sig { returns(T.nilable(String)) }
        attr_accessor :description

        sig { returns(T.nilable(String)) }
        attr_accessor :display_name

        sig { returns(T.nilable(String)) }
        attr_accessor :entity_type

        sig { returns(T.nilable(String)) }
        attr_accessor :help_message

        # The registered address of the company behind the agent.
        sig { returns(T.nilable(Sentdm::Channels::RcsAddress)) }
        attr_reader :official_address

        sig do
          params(
            official_address: T.nilable(Sentdm::Channels::RcsAddress::OrHash)
          ).void
        end
        attr_writer :official_address

        sig { returns(T.nilable(String)) }
        attr_accessor :opt_in_process_description

        # The number the agent sends from, derived from brand_phone_number.
        sig { returns(T.nilable(String)) }
        attr_accessor :phone_number

        sig { returns(T.nilable(String)) }
        attr_accessor :privacy_policy_url

        # A sentence for reason_code, saying what to do where it is yours. Omitted while
        # ACTIVE.
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        # Why the agent is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
        # such as CHANNEL_001 (something you owe) or CHANNEL_009 (under review). Switch on
        # this rather than on reason. Omitted while ACTIVE. Read-only; when nothing more
        # specific is known it is the generic reason for the status.
        sig { returns(T.nilable(String)) }
        attr_accessor :reason_code

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :sample_messages

        sig { returns(T.nilable(String)) }
        attr_accessor :start_message

        # Where the agent stands, in terms of who is holding it up — PROVISIONING,
        # ACTION_NEEDED, PENDING_REVIEW or ACTIVE.
        #
        # Resolved from both of the provider's axes rather than reported raw: an agent
        # whose resubmission we have asked for reads ACTION_NEEDED however its carrier
        # status still reads, and an agent not yet handed over reads PROVISIONING rather
        # than pending a review nobody has started.
        sig do
          returns(T.nilable(Sentdm::Channels::RcsAgent::Status::TaggedSymbol))
        end
        attr_accessor :status

        sig { returns(T.nilable(String)) }
        attr_accessor :stop_message

        sig { returns(T.nilable(String)) }
        attr_accessor :terms_and_conditions_url

        sig { returns(T.nilable(String)) }
        attr_accessor :website_url

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
        sig do
          params(
            id: T.nilable(String),
            agent_use_case: T.nilable(String),
            brand_color: T.nilable(String),
            brand_email: T.nilable(String),
            brand_name: T.nilable(String),
            brand_phone_number: T.nilable(String),
            brief_company_description: T.nilable(String),
            company_ein: T.nilable(String),
            contact_name_and_title: T.nilable(String),
            created_at: T.nilable(Time),
            customer_support_email: T.nilable(String),
            customer_support_phone_number: T.nilable(String),
            description: T.nilable(String),
            display_name: T.nilable(String),
            entity_type: T.nilable(String),
            help_message: T.nilable(String),
            official_address: T.nilable(Sentdm::Channels::RcsAddress::OrHash),
            opt_in_process_description: T.nilable(String),
            phone_number: T.nilable(String),
            privacy_policy_url: T.nilable(String),
            reason: T.nilable(String),
            reason_code: T.nilable(String),
            sample_messages: T.nilable(T::Array[String]),
            start_message: T.nilable(String),
            status: T.nilable(Sentdm::Channels::RcsAgent::Status::OrSymbol),
            stop_message: T.nilable(String),
            terms_and_conditions_url: T.nilable(String),
            website_url: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The agent record. Stable across the whole approval, and what support will ask
          # for.
          #
          # Nullable and omitted when absent: a sender profile with RCS intent records the
          # channel but has no agent until the order form is submitted, so no id exists to
          # report. A zero GUID is not a valid id and is worse than the field being absent.
          id: nil,
          agent_use_case: nil,
          brand_color: nil,
          brand_email: nil,
          brand_name: nil,
          brand_phone_number: nil,
          brief_company_description: nil,
          company_ein: nil,
          contact_name_and_title: nil,
          # Omitted when no real agent record exists — the intent-only path has no creation
          # timestamp.
          created_at: nil,
          customer_support_email: nil,
          customer_support_phone_number: nil,
          description: nil,
          display_name: nil,
          entity_type: nil,
          help_message: nil,
          # The registered address of the company behind the agent.
          official_address: nil,
          opt_in_process_description: nil,
          # The number the agent sends from, derived from brand_phone_number.
          phone_number: nil,
          privacy_policy_url: nil,
          # A sentence for reason_code, saying what to do where it is yours. Omitted while
          # ACTIVE.
          reason: nil,
          # Why the agent is not ACTIVE, as a stable code: an ErrorCodes CHANNEL_xxx value
          # such as CHANNEL_001 (something you owe) or CHANNEL_009 (under review). Switch on
          # this rather than on reason. Omitted while ACTIVE. Read-only; when nothing more
          # specific is known it is the generic reason for the status.
          reason_code: nil,
          sample_messages: nil,
          start_message: nil,
          # Where the agent stands, in terms of who is holding it up — PROVISIONING,
          # ACTION_NEEDED, PENDING_REVIEW or ACTIVE.
          #
          # Resolved from both of the provider's axes rather than reported raw: an agent
          # whose resubmission we have asked for reads ACTION_NEEDED however its carrier
          # status still reads, and an agent not yet handed over reads PROVISIONING rather
          # than pending a review nobody has started.
          status: nil,
          stop_message: nil,
          terms_and_conditions_url: nil,
          website_url: nil
        )
        end

        sig do
          override.returns(
            {
              id: T.nilable(String),
              agent_use_case: T.nilable(String),
              brand_color: T.nilable(String),
              brand_email: T.nilable(String),
              brand_name: T.nilable(String),
              brand_phone_number: T.nilable(String),
              brief_company_description: T.nilable(String),
              company_ein: T.nilable(String),
              contact_name_and_title: T.nilable(String),
              created_at: T.nilable(Time),
              customer_support_email: T.nilable(String),
              customer_support_phone_number: T.nilable(String),
              description: T.nilable(String),
              display_name: T.nilable(String),
              entity_type: T.nilable(String),
              help_message: T.nilable(String),
              official_address: T.nilable(Sentdm::Channels::RcsAddress),
              opt_in_process_description: T.nilable(String),
              phone_number: T.nilable(String),
              privacy_policy_url: T.nilable(String),
              reason: T.nilable(String),
              reason_code: T.nilable(String),
              sample_messages: T.nilable(T::Array[String]),
              start_message: T.nilable(String),
              status:
                T.nilable(Sentdm::Channels::RcsAgent::Status::TaggedSymbol),
              stop_message: T.nilable(String),
              terms_and_conditions_url: T.nilable(String),
              website_url: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Where the agent stands, in terms of who is holding it up — PROVISIONING,
        # ACTION_NEEDED, PENDING_REVIEW or ACTIVE.
        #
        # Resolved from both of the provider's axes rather than reported raw: an agent
        # whose resubmission we have asked for reads ACTION_NEEDED however its carrier
        # status still reads, and an agent not yet handed over reads PROVISIONING rather
        # than pending a review nobody has started.
        module Status
          extend Sentdm::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Sentdm::Channels::RcsAgent::Status) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PROVISIONING =
            T.let(
              :PROVISIONING,
              Sentdm::Channels::RcsAgent::Status::TaggedSymbol
            )
          ACTION_NEEDED =
            T.let(
              :ACTION_NEEDED,
              Sentdm::Channels::RcsAgent::Status::TaggedSymbol
            )
          PENDING_REVIEW =
            T.let(
              :PENDING_REVIEW,
              Sentdm::Channels::RcsAgent::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(:ACTIVE, Sentdm::Channels::RcsAgent::Status::TaggedSymbol)
          INACTIVE =
            T.let(:INACTIVE, Sentdm::Channels::RcsAgent::Status::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Sentdm::Channels::RcsAgent::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
