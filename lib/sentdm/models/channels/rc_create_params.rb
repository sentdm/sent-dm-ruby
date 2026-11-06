# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::Rcs#create
      class RcCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute agent_use_case
        #   Which kind of traffic the agent carries. One of the accepted use cases; the
        #   error names the set.
        #
        #   @return [Symbol, Sentdm::Models::Channels::RcCreateParams::AgentUseCase, nil]
        optional :agent_use_case, enum: -> { Sentdm::Channels::RcCreateParams::AgentUseCase }

        # @!attribute banner_url
        #
        #   @return [String, nil]
        optional :banner_url, String

        # @!attribute brand_color
        #   Primary brand colour, as #RRGGBB. Three-digit shorthand is refused: the value is
        #   submitted verbatim, so two spellings of one colour is only a way for the stored
        #   value to disagree with the form.
        #
        #   @return [String, nil]
        optional :brand_color, String

        # @!attribute brand_email
        #
        #   @return [String, nil]
        optional :brand_email, String

        # @!attribute brand_name
        #   The brand this agent presents over RCS.
        #
        #   Not taken from your compliance.brand: a business may present a different brand
        #   on RCS than the one its 10DLC registration is filed against, and the carriers
        #   vet this one.
        #
        #   @return [String, nil]
        optional :brand_name, String

        # @!attribute brand_phone_number
        #   The brand's own number. Also becomes the agent's canonical sending number for
        #   routing, which is why it is normalised to E.164 rather than stored as sent.
        #
        #   @return [String, nil]
        optional :brand_phone_number, String

        # @!attribute brief_company_description
        #
        #   @return [String, nil]
        optional :brief_company_description, String

        # @!attribute company_ein
        #
        #   @return [String, nil]
        optional :company_ein, String

        # @!attribute contact_name_and_title
        #
        #   @return [String, nil]
        optional :contact_name_and_title, String

        # @!attribute customer_support_email
        #
        #   @return [String, nil]
        optional :customer_support_email, String

        # @!attribute customer_support_phone_number
        #
        #   @return [String, nil]
        optional :customer_support_phone_number, String

        # @!attribute description
        #   What the agent is for, shown to recipients. Capped by the carriers, not by us.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute display_name
        #   The name the agent shows in the messaging client.
        #
        #   @return [String, nil]
        optional :display_name, String

        # @!attribute entity_type
        #
        #   @return [String, nil]
        optional :entity_type, String

        # @!attribute help_message
        #
        #   @return [String, nil]
        optional :help_message, String

        # @!attribute logo_url
        #   Publicly reachable logo. It has to be fetchable without authentication at review
        #   time, so a URL behind a login passes this call and fails the review.
        #
        #   @return [String, nil]
        optional :logo_url, String

        # @!attribute official_address
        #   The registered address of the company behind the agent.
        #
        #   @return [Sentdm::Models::Channels::RcsAddress, nil]
        optional :official_address, -> { Sentdm::Channels::RcsAddress }

        # @!attribute opt_in_process_description
        #   How recipients opt in, in prose. The carriers read this one.
        #
        #   @return [String, nil]
        optional :opt_in_process_description, String

        # @!attribute opt_in_screenshot_url
        #   A screenshot of the opt-in, as a publicly fetchable URL.
        #
        #   @return [String, nil]
        optional :opt_in_screenshot_url, String, nil?: true

        # @!attribute privacy_policy_url
        #   Required by US carriers. Must be an absolute http(s) URL they can fetch.
        #
        #   @return [String, nil]
        optional :privacy_policy_url, String

        # @!attribute sample_messages
        #   Examples of what the agent will send, for the review.
        #
        #   @return [Array<String>, nil]
        optional :sample_messages, Sentdm::Internal::Type::ArrayOf[String]

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute start_message
        #
        #   @return [String, nil]
        optional :start_message, String

        # @!attribute stop_message
        #
        #   @return [String, nil]
        optional :stop_message, String

        # @!attribute terms_and_conditions_url
        #
        #   @return [String, nil]
        optional :terms_and_conditions_url, String

        # @!attribute website_url
        #   The brand's own site.
        #
        #   @return [String, nil]
        optional :website_url, String

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(agent_use_case: nil, banner_url: nil, brand_color: nil, brand_email: nil, brand_name: nil, brand_phone_number: nil, brief_company_description: nil, company_ein: nil, contact_name_and_title: nil, customer_support_email: nil, customer_support_phone_number: nil, description: nil, display_name: nil, entity_type: nil, help_message: nil, logo_url: nil, official_address: nil, opt_in_process_description: nil, opt_in_screenshot_url: nil, privacy_policy_url: nil, sample_messages: nil, sandbox: nil, start_message: nil, stop_message: nil, terms_and_conditions_url: nil, website_url: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::RcCreateParams} for more details.
        #
        #   @param agent_use_case [Symbol, Sentdm::Models::Channels::RcCreateParams::AgentUseCase] Which kind of traffic the agent carries. One of the accepted use cases; the erro
        #
        #   @param banner_url [String]
        #
        #   @param brand_color [String] Primary brand colour, as #RRGGBB. Three-digit shorthand is refused: the value is
        #
        #   @param brand_email [String]
        #
        #   @param brand_name [String] The brand this agent presents over RCS.
        #
        #   @param brand_phone_number [String] The brand's own number. Also becomes the agent's canonical sending number for ro
        #
        #   @param brief_company_description [String]
        #
        #   @param company_ein [String]
        #
        #   @param contact_name_and_title [String]
        #
        #   @param customer_support_email [String]
        #
        #   @param customer_support_phone_number [String]
        #
        #   @param description [String] What the agent is for, shown to recipients. Capped by the carriers, not by us.
        #
        #   @param display_name [String] The name the agent shows in the messaging client.
        #
        #   @param entity_type [String]
        #
        #   @param help_message [String]
        #
        #   @param logo_url [String] Publicly reachable logo. It has to be fetchable without authentication at review
        #
        #   @param official_address [Sentdm::Models::Channels::RcsAddress] The registered address of the company behind the agent.
        #
        #   @param opt_in_process_description [String] How recipients opt in, in prose. The carriers read this one.
        #
        #   @param opt_in_screenshot_url [String, nil] A screenshot of the opt-in, as a publicly fetchable URL.
        #
        #   @param privacy_policy_url [String] Required by US carriers. Must be an absolute http(s) URL they can fetch.
        #
        #   @param sample_messages [Array<String>] Examples of what the agent will send, for the review.
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
        #
        #   @param start_message [String]
        #
        #   @param stop_message [String]
        #
        #   @param terms_and_conditions_url [String]
        #
        #   @param website_url [String] The brand's own site.
        #
        #   @param idempotency_key [String]
        #
        #   @param x_profile_id [String]
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

        # Which kind of traffic the agent carries. One of the accepted use cases; the
        # error names the set.
        module AgentUseCase
          extend Sentdm::Internal::Type::Enum

          # One-time passcodes and identity checks. Expects no reply, and is held to the strictest delivery review.
          VERIFICATION = :VERIFICATION

          # Transactional updates the recipient asked for — orders, deliveries, appointments, account activity.
          NOTIFICATIONS = :NOTIFICATIONS

          # Promotional content. Requires the clearest opt-in evidence of the four, because the carriers review consent hardest here.
          MARKETING = :MARKETING

          # More than one of the above from a single agent. Vetted against the strictest use case it covers, so declare it only if you genuinely need one agent to do several jobs.
          MULTI_USE = :MULTI_USE

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
