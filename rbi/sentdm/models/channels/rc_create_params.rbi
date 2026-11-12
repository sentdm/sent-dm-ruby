# typed: strong

module Sentdm
  module Models
    module Channels
      class RcCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::RcCreateParams, Sentdm::Internal::AnyHash)
          end

        # Which kind of traffic the agent carries. One of the accepted use cases; the
        # error names the set.
        sig do
          returns(
            T.nilable(Sentdm::Channels::RcCreateParams::AgentUseCase::OrSymbol)
          )
        end
        attr_reader :agent_use_case

        sig do
          params(
            agent_use_case:
              Sentdm::Channels::RcCreateParams::AgentUseCase::OrSymbol
          ).void
        end
        attr_writer :agent_use_case

        sig { returns(T.nilable(String)) }
        attr_reader :banner_url

        sig { params(banner_url: String).void }
        attr_writer :banner_url

        # Primary brand colour, as #RRGGBB. Three-digit shorthand is refused: the value is
        # submitted verbatim, so two spellings of one colour is only a way for the stored
        # value to disagree with the form.
        sig { returns(T.nilable(String)) }
        attr_reader :brand_color

        sig { params(brand_color: String).void }
        attr_writer :brand_color

        sig { returns(T.nilable(String)) }
        attr_reader :brand_email

        sig { params(brand_email: String).void }
        attr_writer :brand_email

        # The brand this agent presents over RCS.
        #
        # Not taken from your compliance.brand: a business may present a different brand
        # on RCS than the one its 10DLC registration is filed against, and the carriers
        # vet this one.
        sig { returns(T.nilable(String)) }
        attr_reader :brand_name

        sig { params(brand_name: String).void }
        attr_writer :brand_name

        # The brand's own number. Also becomes the agent's canonical sending number for
        # routing, which is why it is normalised to E.164 rather than stored as sent.
        sig { returns(T.nilable(String)) }
        attr_reader :brand_phone_number

        sig { params(brand_phone_number: String).void }
        attr_writer :brand_phone_number

        sig { returns(T.nilable(String)) }
        attr_reader :brief_company_description

        sig { params(brief_company_description: String).void }
        attr_writer :brief_company_description

        sig { returns(T.nilable(String)) }
        attr_reader :company_ein

        sig { params(company_ein: String).void }
        attr_writer :company_ein

        sig { returns(T.nilable(String)) }
        attr_reader :contact_name_and_title

        sig { params(contact_name_and_title: String).void }
        attr_writer :contact_name_and_title

        sig { returns(T.nilable(String)) }
        attr_reader :customer_support_email

        sig { params(customer_support_email: String).void }
        attr_writer :customer_support_email

        sig { returns(T.nilable(String)) }
        attr_reader :customer_support_phone_number

        sig { params(customer_support_phone_number: String).void }
        attr_writer :customer_support_phone_number

        # What the agent is for, shown to recipients. Capped by the carriers, not by us.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # The name the agent shows in the messaging client.
        sig { returns(T.nilable(String)) }
        attr_reader :display_name

        sig { params(display_name: String).void }
        attr_writer :display_name

        sig { returns(T.nilable(String)) }
        attr_reader :entity_type

        sig { params(entity_type: String).void }
        attr_writer :entity_type

        sig { returns(T.nilable(String)) }
        attr_reader :help_message

        sig { params(help_message: String).void }
        attr_writer :help_message

        # Publicly reachable logo. It has to be fetchable without authentication at review
        # time, so a URL behind a login passes this call and fails the review.
        sig { returns(T.nilable(String)) }
        attr_reader :logo_url

        sig { params(logo_url: String).void }
        attr_writer :logo_url

        # The registered address of the company behind the agent.
        sig { returns(T.nilable(Sentdm::Channels::RcsAddress)) }
        attr_reader :official_address

        sig do
          params(official_address: Sentdm::Channels::RcsAddress::OrHash).void
        end
        attr_writer :official_address

        # How recipients opt in, in prose. The carriers read this one.
        sig { returns(T.nilable(String)) }
        attr_reader :opt_in_process_description

        sig { params(opt_in_process_description: String).void }
        attr_writer :opt_in_process_description

        # A screenshot of the opt-in, as a publicly fetchable URL.
        sig { returns(T.nilable(String)) }
        attr_accessor :opt_in_screenshot_url

        # Required by US carriers. Must be an absolute http(s) URL they can fetch.
        sig { returns(T.nilable(String)) }
        attr_reader :privacy_policy_url

        sig { params(privacy_policy_url: String).void }
        attr_writer :privacy_policy_url

        # Examples of what the agent will send, for the review.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :sample_messages

        sig { params(sample_messages: T::Array[String]).void }
        attr_writer :sample_messages

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        sig { returns(T.nilable(String)) }
        attr_reader :start_message

        sig { params(start_message: String).void }
        attr_writer :start_message

        sig { returns(T.nilable(String)) }
        attr_reader :stop_message

        sig { params(stop_message: String).void }
        attr_writer :stop_message

        sig { returns(T.nilable(String)) }
        attr_reader :terms_and_conditions_url

        sig { params(terms_and_conditions_url: String).void }
        attr_writer :terms_and_conditions_url

        # The brand's own site.
        sig { returns(T.nilable(String)) }
        attr_reader :website_url

        sig { params(website_url: String).void }
        attr_writer :website_url

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig { returns(T.nilable(String)) }
        attr_reader :x_profile_id

        sig { params(x_profile_id: String).void }
        attr_writer :x_profile_id

        sig do
          params(
            agent_use_case:
              Sentdm::Channels::RcCreateParams::AgentUseCase::OrSymbol,
            banner_url: String,
            brand_color: String,
            brand_email: String,
            brand_name: String,
            brand_phone_number: String,
            brief_company_description: String,
            company_ein: String,
            contact_name_and_title: String,
            customer_support_email: String,
            customer_support_phone_number: String,
            description: String,
            display_name: String,
            entity_type: String,
            help_message: String,
            logo_url: String,
            official_address: Sentdm::Channels::RcsAddress::OrHash,
            opt_in_process_description: String,
            opt_in_screenshot_url: T.nilable(String),
            privacy_policy_url: String,
            sample_messages: T::Array[String],
            sandbox: T::Boolean,
            start_message: String,
            stop_message: String,
            terms_and_conditions_url: String,
            website_url: String,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Which kind of traffic the agent carries. One of the accepted use cases; the
          # error names the set.
          agent_use_case: nil,
          banner_url: nil,
          # Primary brand colour, as #RRGGBB. Three-digit shorthand is refused: the value is
          # submitted verbatim, so two spellings of one colour is only a way for the stored
          # value to disagree with the form.
          brand_color: nil,
          brand_email: nil,
          # The brand this agent presents over RCS.
          #
          # Not taken from your compliance.brand: a business may present a different brand
          # on RCS than the one its 10DLC registration is filed against, and the carriers
          # vet this one.
          brand_name: nil,
          # The brand's own number. Also becomes the agent's canonical sending number for
          # routing, which is why it is normalised to E.164 rather than stored as sent.
          brand_phone_number: nil,
          brief_company_description: nil,
          company_ein: nil,
          contact_name_and_title: nil,
          customer_support_email: nil,
          customer_support_phone_number: nil,
          # What the agent is for, shown to recipients. Capped by the carriers, not by us.
          description: nil,
          # The name the agent shows in the messaging client.
          display_name: nil,
          entity_type: nil,
          help_message: nil,
          # Publicly reachable logo. It has to be fetchable without authentication at review
          # time, so a URL behind a login passes this call and fails the review.
          logo_url: nil,
          # The registered address of the company behind the agent.
          official_address: nil,
          # How recipients opt in, in prose. The carriers read this one.
          opt_in_process_description: nil,
          # A screenshot of the opt-in, as a publicly fetchable URL.
          opt_in_screenshot_url: nil,
          # Required by US carriers. Must be an absolute http(s) URL they can fetch.
          privacy_policy_url: nil,
          # Examples of what the agent will send, for the review.
          sample_messages: nil,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          start_message: nil,
          stop_message: nil,
          terms_and_conditions_url: nil,
          # The brand's own site.
          website_url: nil,
          idempotency_key: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              agent_use_case:
                Sentdm::Channels::RcCreateParams::AgentUseCase::OrSymbol,
              banner_url: String,
              brand_color: String,
              brand_email: String,
              brand_name: String,
              brand_phone_number: String,
              brief_company_description: String,
              company_ein: String,
              contact_name_and_title: String,
              customer_support_email: String,
              customer_support_phone_number: String,
              description: String,
              display_name: String,
              entity_type: String,
              help_message: String,
              logo_url: String,
              official_address: Sentdm::Channels::RcsAddress,
              opt_in_process_description: String,
              opt_in_screenshot_url: T.nilable(String),
              privacy_policy_url: String,
              sample_messages: T::Array[String],
              sandbox: T::Boolean,
              start_message: String,
              stop_message: String,
              terms_and_conditions_url: String,
              website_url: String,
              idempotency_key: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Which kind of traffic the agent carries. One of the accepted use cases; the
        # error names the set.
        module AgentUseCase
          extend Sentdm::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Sentdm::Channels::RcCreateParams::AgentUseCase)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # One-time passcodes and identity checks. Expects no reply, and is held to the strictest delivery review.
          VERIFICATION =
            T.let(
              :VERIFICATION,
              Sentdm::Channels::RcCreateParams::AgentUseCase::TaggedSymbol
            )

          # Transactional updates the recipient asked for — orders, deliveries, appointments, account activity.
          NOTIFICATIONS =
            T.let(
              :NOTIFICATIONS,
              Sentdm::Channels::RcCreateParams::AgentUseCase::TaggedSymbol
            )

          # Promotional content. Requires the clearest opt-in evidence of the four, because the carriers review consent hardest here.
          MARKETING =
            T.let(
              :MARKETING,
              Sentdm::Channels::RcCreateParams::AgentUseCase::TaggedSymbol
            )

          # More than one of the above from a single agent. Vetted against the strictest use case it covers, so declare it only if you genuinely need one agent to do several jobs.
          MULTI_USE =
            T.let(
              :MULTI_USE,
              Sentdm::Channels::RcCreateParams::AgentUseCase::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Sentdm::Channels::RcCreateParams::AgentUseCase::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
