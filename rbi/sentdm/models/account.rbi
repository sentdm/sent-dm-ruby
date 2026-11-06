# typed: strong

module Sentdm
  module Models
    class Account < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::Account, Sentdm::Internal::AnyHash) }

      # Customer ID (organization, account, or profile)
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Messaging channel configuration. All three channels are always present. Each
      # channel has a "configured" flag; configured channels expose additional details.
      sig { returns(T.nilable(Sentdm::AccountChannels)) }
      attr_reader :channels

      sig { params(channels: Sentdm::AccountChannels::OrHash).void }
      attr_writer :channels

      # When the account was created
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Account description
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Contact email address
      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # Whether this account may mark a template for automatic creation on its sender
      # profiles. Granted by Sent per account and off by default, so it is what a
      # template-create form reads to decide whether to offer the option at all —
      # marking a template without it does nothing.
      #
      # Top-level rather than inside settings, which is written for type: "profile" only
      # and so would never carry it to the account type that can act on it.
      #
      # This is the capability, not the stored flag: a profile reports false whatever
      # its own row holds. A sender profile owns no sender profiles, so a template it
      # marked would have nothing to be created on and the fan-out would never read the
      # flag. The admin GET /customers/{id} reports the stored value instead, because
      # that is the one an operator granted.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_template_auto_creation_for_sp

      sig { params(enable_template_auto_creation_for_sp: T::Boolean).void }
      attr_writer :enable_template_auto_creation_for_sp

      # Account icon URL
      sig { returns(T.nilable(String)) }
      attr_accessor :icon

      # Account name
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Organization ID (only for profile type — the parent organization)
      sig { returns(T.nilable(String)) }
      attr_accessor :organization_id

      # List of profiles (populated for organization type, empty for user and profile
      # types)
      sig { returns(T.nilable(T::Array[Sentdm::AccountProfile])) }
      attr_reader :profiles

      sig { params(profiles: T::Array[Sentdm::AccountProfile::OrHash]).void }
      attr_writer :profiles

      # The SMS sender this account sends from in the United States, in E.164 form. Null
      # when the account has no US SMS sender.
      #
      # The same value as channels.sms.phone_number, published under both names on
      # purpose: sending_phone_number is what this value is already called on GET
      # /v3/profiles, so the same key answers the same question whichever of the two
      # endpoints you ask. Neither name is preferred over the other and neither is
      # deprecated.
      #
      # The same value, not the same presence: this key is always written, including as
      # null, whereas channels.sms.phone_number is left out entirely when there is no
      # sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number

      # The account that holds sending_phone_number in number inventory: normally this
      # account itself, and a different account when the number is held elsewhere. Null
      # when there is no US sender, or when the sender is not a number drawn from
      # inventory — an alphanumeric sender ID or a short code.
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number_profile_id

      # Profile configuration settings
      sig { returns(T.nilable(Sentdm::ProfileSettings)) }
      attr_reader :settings

      sig { params(settings: T.nilable(Sentdm::ProfileSettings::OrHash)).void }
      attr_writer :settings

      # Short name / abbreviation (only for profile type)
      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # Profile status (only for profile type): incomplete, pending_review, approved,
      # etc.
      sig { returns(T.nilable(String)) }
      attr_accessor :status

      # Account type: "organization" (has profiles), "user" (no profiles), or "profile"
      # (child of an organization)
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # Account response for GET /v3/me endpoint. Returns organization (with profiles),
      # user (standalone), or profile (child of an organization) data depending on the
      # API key type. Always includes messaging channel configuration.
      sig do
        params(
          id: String,
          channels: Sentdm::AccountChannels::OrHash,
          created_at: Time,
          description: T.nilable(String),
          email: T.nilable(String),
          enable_template_auto_creation_for_sp: T::Boolean,
          icon: T.nilable(String),
          name: String,
          organization_id: T.nilable(String),
          profiles: T::Array[Sentdm::AccountProfile::OrHash],
          sending_phone_number: T.nilable(String),
          sending_phone_number_profile_id: T.nilable(String),
          settings: T.nilable(Sentdm::ProfileSettings::OrHash),
          short_name: T.nilable(String),
          status: T.nilable(String),
          type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Customer ID (organization, account, or profile)
        id: nil,
        # Messaging channel configuration. All three channels are always present. Each
        # channel has a "configured" flag; configured channels expose additional details.
        channels: nil,
        # When the account was created
        created_at: nil,
        # Account description
        description: nil,
        # Contact email address
        email: nil,
        # Whether this account may mark a template for automatic creation on its sender
        # profiles. Granted by Sent per account and off by default, so it is what a
        # template-create form reads to decide whether to offer the option at all —
        # marking a template without it does nothing.
        #
        # Top-level rather than inside settings, which is written for type: "profile" only
        # and so would never carry it to the account type that can act on it.
        #
        # This is the capability, not the stored flag: a profile reports false whatever
        # its own row holds. A sender profile owns no sender profiles, so a template it
        # marked would have nothing to be created on and the fan-out would never read the
        # flag. The admin GET /customers/{id} reports the stored value instead, because
        # that is the one an operator granted.
        enable_template_auto_creation_for_sp: nil,
        # Account icon URL
        icon: nil,
        # Account name
        name: nil,
        # Organization ID (only for profile type — the parent organization)
        organization_id: nil,
        # List of profiles (populated for organization type, empty for user and profile
        # types)
        profiles: nil,
        # The SMS sender this account sends from in the United States, in E.164 form. Null
        # when the account has no US SMS sender.
        #
        # The same value as channels.sms.phone_number, published under both names on
        # purpose: sending_phone_number is what this value is already called on GET
        # /v3/profiles, so the same key answers the same question whichever of the two
        # endpoints you ask. Neither name is preferred over the other and neither is
        # deprecated.
        #
        # The same value, not the same presence: this key is always written, including as
        # null, whereas channels.sms.phone_number is left out entirely when there is no
        # sender.
        sending_phone_number: nil,
        # The account that holds sending_phone_number in number inventory: normally this
        # account itself, and a different account when the number is held elsewhere. Null
        # when there is no US sender, or when the sender is not a number drawn from
        # inventory — an alphanumeric sender ID or a short code.
        sending_phone_number_profile_id: nil,
        # Profile configuration settings
        settings: nil,
        # Short name / abbreviation (only for profile type)
        short_name: nil,
        # Profile status (only for profile type): incomplete, pending_review, approved,
        # etc.
        status: nil,
        # Account type: "organization" (has profiles), "user" (no profiles), or "profile"
        # (child of an organization)
        type: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            channels: Sentdm::AccountChannels,
            created_at: Time,
            description: T.nilable(String),
            email: T.nilable(String),
            enable_template_auto_creation_for_sp: T::Boolean,
            icon: T.nilable(String),
            name: String,
            organization_id: T.nilable(String),
            profiles: T::Array[Sentdm::AccountProfile],
            sending_phone_number: T.nilable(String),
            sending_phone_number_profile_id: T.nilable(String),
            settings: T.nilable(Sentdm::ProfileSettings),
            short_name: T.nilable(String),
            status: T.nilable(String),
            type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
