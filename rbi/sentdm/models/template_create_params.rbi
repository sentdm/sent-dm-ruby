# typed: strong

module Sentdm
  module Models
    class TemplateCreateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateCreateParams, Sentdm::Internal::AnyHash)
        end

      # Template category: MARKETING, UTILITY, AUTHENTICATION (optional, auto-detected
      # if not provided)
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # Source of template creation (default: from-api)
      sig { returns(T.nilable(String)) }
      attr_accessor :creation_source

      # Complete definition of a message template including header, body, footer, and
      # buttons
      sig { returns(T.nilable(Sentdm::TemplateCreateParams::Definition)) }
      attr_reader :definition

      sig do
        params(
          definition: Sentdm::TemplateCreateParams::Definition::OrHash
        ).void
      end
      attr_writer :definition

      # Template language code (e.g., en_US) (optional, auto-detected if not provided)
      sig { returns(T.nilable(String)) }
      attr_accessor :language

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      # Whether to submit the template for review after creation (default: false)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :submit_for_review

      sig { params(submit_for_review: T::Boolean).void }
      attr_writer :submit_for_review

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
          category: T.nilable(String),
          creation_source: T.nilable(String),
          definition: Sentdm::TemplateCreateParams::Definition::OrHash,
          language: T.nilable(String),
          sandbox: T::Boolean,
          submit_for_review: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Template category: MARKETING, UTILITY, AUTHENTICATION (optional, auto-detected
        # if not provided)
        category: nil,
        # Source of template creation (default: from-api)
        creation_source: nil,
        # Complete definition of a message template including header, body, footer, and
        # buttons
        definition: nil,
        # Template language code (e.g., en_US) (optional, auto-detected if not provided)
        language: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        # Whether to submit the template for review after creation (default: false)
        submit_for_review: nil,
        idempotency_key: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            category: T.nilable(String),
            creation_source: T.nilable(String),
            definition: Sentdm::TemplateCreateParams::Definition,
            language: T.nilable(String),
            sandbox: T::Boolean,
            submit_for_review: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Definition < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::TemplateCreateParams::Definition,
              Sentdm::Internal::AnyHash
            )
          end

        # Body section of a message template with channel-specific content
        sig { returns(Sentdm::TemplateCreateParams::Definition::Body) }
        attr_reader :body

        sig do
          params(
            body: Sentdm::TemplateCreateParams::Definition::Body::OrHash
          ).void
        end
        attr_writer :body

        # Configuration for AUTHENTICATION category templates
        sig do
          returns(
            T.nilable(
              Sentdm::TemplateCreateParams::Definition::AuthenticationConfig
            )
          )
        end
        attr_reader :authentication_config

        sig do
          params(
            authentication_config:
              T.nilable(
                Sentdm::TemplateCreateParams::Definition::AuthenticationConfig::OrHash
              )
          ).void
        end
        attr_writer :authentication_config

        # Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::TemplateCreateParams::Definition::Button]
            )
          )
        end
        attr_accessor :buttons

        # The version of the template definition format
        sig { returns(T.nilable(String)) }
        attr_accessor :definition_version

        # Footer section of a message template
        sig do
          returns(T.nilable(Sentdm::TemplateCreateParams::Definition::Footer))
        end
        attr_reader :footer

        sig do
          params(
            footer:
              T.nilable(
                Sentdm::TemplateCreateParams::Definition::Footer::OrHash
              )
          ).void
        end
        attr_writer :footer

        # Header section of a message template
        sig do
          returns(T.nilable(Sentdm::TemplateCreateParams::Definition::Header))
        end
        attr_reader :header

        sig do
          params(
            header:
              T.nilable(
                Sentdm::TemplateCreateParams::Definition::Header::OrHash
              )
          ).void
        end
        attr_writer :header

        # Complete definition of a message template including header, body, footer, and
        # buttons
        sig do
          params(
            body: Sentdm::TemplateCreateParams::Definition::Body::OrHash,
            authentication_config:
              T.nilable(
                Sentdm::TemplateCreateParams::Definition::AuthenticationConfig::OrHash
              ),
            buttons:
              T.nilable(
                T::Array[
                  Sentdm::TemplateCreateParams::Definition::Button::OrHash
                ]
              ),
            definition_version: T.nilable(String),
            footer:
              T.nilable(
                Sentdm::TemplateCreateParams::Definition::Footer::OrHash
              ),
            header:
              T.nilable(
                Sentdm::TemplateCreateParams::Definition::Header::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Body section of a message template with channel-specific content
          body:,
          # Configuration for AUTHENTICATION category templates
          authentication_config: nil,
          # Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
          buttons: nil,
          # The version of the template definition format
          definition_version: nil,
          # Footer section of a message template
          footer: nil,
          # Header section of a message template
          header: nil
        )
        end

        sig do
          override.returns(
            {
              body: Sentdm::TemplateCreateParams::Definition::Body,
              authentication_config:
                T.nilable(
                  Sentdm::TemplateCreateParams::Definition::AuthenticationConfig
                ),
              buttons:
                T.nilable(
                  T::Array[Sentdm::TemplateCreateParams::Definition::Button]
                ),
              definition_version: T.nilable(String),
              footer:
                T.nilable(Sentdm::TemplateCreateParams::Definition::Footer),
              header:
                T.nilable(Sentdm::TemplateCreateParams::Definition::Header)
            }
          )
        end
        def to_hash
        end

        class Body < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::TemplateCreateParams::Definition::Body,
                Sentdm::Internal::AnyHash
              )
            end

          # Content that will be used for all channels (SMS and WhatsApp) unless
          # channel-specific content is provided
          sig do
            returns(
              T.nilable(
                Sentdm::TemplateCreateParams::Definition::Body::MultiChannel
              )
            )
          end
          attr_reader :multi_channel

          sig do
            params(
              multi_channel:
                T.nilable(
                  Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::OrHash
                )
            ).void
          end
          attr_writer :multi_channel

          # RCS-specific content that overrides multi-channel content for RCS messages
          sig do
            returns(
              T.nilable(Sentdm::TemplateCreateParams::Definition::Body::Rcs)
            )
          end
          attr_reader :rcs

          sig do
            params(
              rcs:
                T.nilable(
                  Sentdm::TemplateCreateParams::Definition::Body::Rcs::OrHash
                )
            ).void
          end
          attr_writer :rcs

          # SMS-specific content that overrides multi-channel content for SMS messages
          sig do
            returns(
              T.nilable(Sentdm::TemplateCreateParams::Definition::Body::SMS)
            )
          end
          attr_reader :sms

          sig do
            params(
              sms:
                T.nilable(
                  Sentdm::TemplateCreateParams::Definition::Body::SMS::OrHash
                )
            ).void
          end
          attr_writer :sms

          # WhatsApp-specific content that overrides multi-channel content for WhatsApp
          # messages
          sig do
            returns(
              T.nilable(
                Sentdm::TemplateCreateParams::Definition::Body::Whatsapp
              )
            )
          end
          attr_reader :whatsapp

          sig do
            params(
              whatsapp:
                T.nilable(
                  Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::OrHash
                )
            ).void
          end
          attr_writer :whatsapp

          # Body section of a message template with channel-specific content
          sig do
            params(
              multi_channel:
                T.nilable(
                  Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::OrHash
                ),
              rcs:
                T.nilable(
                  Sentdm::TemplateCreateParams::Definition::Body::Rcs::OrHash
                ),
              sms:
                T.nilable(
                  Sentdm::TemplateCreateParams::Definition::Body::SMS::OrHash
                ),
              whatsapp:
                T.nilable(
                  Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Content that will be used for all channels (SMS and WhatsApp) unless
            # channel-specific content is provided
            multi_channel: nil,
            # RCS-specific content that overrides multi-channel content for RCS messages
            rcs: nil,
            # SMS-specific content that overrides multi-channel content for SMS messages
            sms: nil,
            # WhatsApp-specific content that overrides multi-channel content for WhatsApp
            # messages
            whatsapp: nil
          )
          end

          sig do
            override.returns(
              {
                multi_channel:
                  T.nilable(
                    Sentdm::TemplateCreateParams::Definition::Body::MultiChannel
                  ),
                rcs:
                  T.nilable(
                    Sentdm::TemplateCreateParams::Definition::Body::Rcs
                  ),
                sms:
                  T.nilable(
                    Sentdm::TemplateCreateParams::Definition::Body::SMS
                  ),
                whatsapp:
                  T.nilable(
                    Sentdm::TemplateCreateParams::Definition::Body::Whatsapp
                  )
              }
            )
          end
          def to_hash
          end

          class MultiChannel < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::TemplateCreateParams::Definition::Body::MultiChannel,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :template

            sig { returns(T.nilable(String)) }
            attr_accessor :type

            sig do
              returns(
                T.nilable(
                  T::Array[
                    Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::Variable
                  ]
                )
              )
            end
            attr_accessor :variables

            # Content that will be used for all channels (SMS and WhatsApp) unless
            # channel-specific content is provided
            sig do
              params(
                template: String,
                type: T.nilable(String),
                variables:
                  T.nilable(
                    T::Array[
                      Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::Variable::OrHash
                    ]
                  )
              ).returns(T.attached_class)
            end
            def self.new(template:, type: nil, variables: nil)
            end

            sig do
              override.returns(
                {
                  template: String,
                  type: T.nilable(String),
                  variables:
                    T.nilable(
                      T::Array[
                        Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::Variable
                      ]
                    )
                }
              )
            end
            def to_hash
            end

            class Variable < Sentdm::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::Variable,
                    Sentdm::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :name

              sig do
                returns(
                  Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::Variable::Props
                )
              end
              attr_reader :props

              sig do
                params(
                  props:
                    Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::Variable::Props::OrHash
                ).void
              end
              attr_writer :props

              sig { returns(String) }
              attr_accessor :type

              sig { returns(T.nilable(Integer)) }
              attr_reader :id

              sig { params(id: Integer).void }
              attr_writer :id

              sig do
                params(
                  name: String,
                  props:
                    Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::Variable::Props::OrHash,
                  type: String,
                  id: Integer
                ).returns(T.attached_class)
              end
              def self.new(name:, props:, type:, id: nil)
              end

              sig do
                override.returns(
                  {
                    name: String,
                    props:
                      Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::Variable::Props,
                    type: String,
                    id: Integer
                  }
                )
              end
              def to_hash
              end

              class Props < Sentdm::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Sentdm::TemplateCreateParams::Definition::Body::MultiChannel::Variable::Props,
                      Sentdm::Internal::AnyHash
                    )
                  end

                sig { returns(String) }
                attr_accessor :media_type

                sig { returns(String) }
                attr_accessor :sample

                sig { returns(String) }
                attr_accessor :url

                sig { returns(String) }
                attr_accessor :variable_type

                sig { returns(T.nilable(String)) }
                attr_accessor :alt

                sig { returns(T.nilable(String)) }
                attr_accessor :regex

                sig { returns(T.nilable(String)) }
                attr_accessor :short_url

                sig do
                  params(
                    media_type: String,
                    sample: String,
                    url: String,
                    variable_type: String,
                    alt: T.nilable(String),
                    regex: T.nilable(String),
                    short_url: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  media_type:,
                  sample:,
                  url:,
                  variable_type:,
                  alt: nil,
                  regex: nil,
                  short_url: nil
                )
                end

                sig do
                  override.returns(
                    {
                      media_type: String,
                      sample: String,
                      url: String,
                      variable_type: String,
                      alt: T.nilable(String),
                      regex: T.nilable(String),
                      short_url: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end
              end
            end
          end

          class Rcs < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::TemplateCreateParams::Definition::Body::Rcs,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :template

            sig { returns(T.nilable(String)) }
            attr_accessor :type

            sig do
              returns(
                T.nilable(
                  T::Array[
                    Sentdm::TemplateCreateParams::Definition::Body::Rcs::Variable
                  ]
                )
              )
            end
            attr_accessor :variables

            # RCS-specific content that overrides multi-channel content for RCS messages
            sig do
              params(
                template: String,
                type: T.nilable(String),
                variables:
                  T.nilable(
                    T::Array[
                      Sentdm::TemplateCreateParams::Definition::Body::Rcs::Variable::OrHash
                    ]
                  )
              ).returns(T.attached_class)
            end
            def self.new(template:, type: nil, variables: nil)
            end

            sig do
              override.returns(
                {
                  template: String,
                  type: T.nilable(String),
                  variables:
                    T.nilable(
                      T::Array[
                        Sentdm::TemplateCreateParams::Definition::Body::Rcs::Variable
                      ]
                    )
                }
              )
            end
            def to_hash
            end

            class Variable < Sentdm::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Sentdm::TemplateCreateParams::Definition::Body::Rcs::Variable,
                    Sentdm::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :name

              sig do
                returns(
                  Sentdm::TemplateCreateParams::Definition::Body::Rcs::Variable::Props
                )
              end
              attr_reader :props

              sig do
                params(
                  props:
                    Sentdm::TemplateCreateParams::Definition::Body::Rcs::Variable::Props::OrHash
                ).void
              end
              attr_writer :props

              sig { returns(String) }
              attr_accessor :type

              sig { returns(T.nilable(Integer)) }
              attr_reader :id

              sig { params(id: Integer).void }
              attr_writer :id

              sig do
                params(
                  name: String,
                  props:
                    Sentdm::TemplateCreateParams::Definition::Body::Rcs::Variable::Props::OrHash,
                  type: String,
                  id: Integer
                ).returns(T.attached_class)
              end
              def self.new(name:, props:, type:, id: nil)
              end

              sig do
                override.returns(
                  {
                    name: String,
                    props:
                      Sentdm::TemplateCreateParams::Definition::Body::Rcs::Variable::Props,
                    type: String,
                    id: Integer
                  }
                )
              end
              def to_hash
              end

              class Props < Sentdm::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Sentdm::TemplateCreateParams::Definition::Body::Rcs::Variable::Props,
                      Sentdm::Internal::AnyHash
                    )
                  end

                sig { returns(String) }
                attr_accessor :media_type

                sig { returns(String) }
                attr_accessor :sample

                sig { returns(String) }
                attr_accessor :url

                sig { returns(String) }
                attr_accessor :variable_type

                sig { returns(T.nilable(String)) }
                attr_accessor :alt

                sig { returns(T.nilable(String)) }
                attr_accessor :regex

                sig { returns(T.nilable(String)) }
                attr_accessor :short_url

                sig do
                  params(
                    media_type: String,
                    sample: String,
                    url: String,
                    variable_type: String,
                    alt: T.nilable(String),
                    regex: T.nilable(String),
                    short_url: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  media_type:,
                  sample:,
                  url:,
                  variable_type:,
                  alt: nil,
                  regex: nil,
                  short_url: nil
                )
                end

                sig do
                  override.returns(
                    {
                      media_type: String,
                      sample: String,
                      url: String,
                      variable_type: String,
                      alt: T.nilable(String),
                      regex: T.nilable(String),
                      short_url: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end
              end
            end
          end

          class SMS < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::TemplateCreateParams::Definition::Body::SMS,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :template

            sig { returns(T.nilable(String)) }
            attr_accessor :type

            sig do
              returns(
                T.nilable(
                  T::Array[
                    Sentdm::TemplateCreateParams::Definition::Body::SMS::Variable
                  ]
                )
              )
            end
            attr_accessor :variables

            # SMS-specific content that overrides multi-channel content for SMS messages
            sig do
              params(
                template: String,
                type: T.nilable(String),
                variables:
                  T.nilable(
                    T::Array[
                      Sentdm::TemplateCreateParams::Definition::Body::SMS::Variable::OrHash
                    ]
                  )
              ).returns(T.attached_class)
            end
            def self.new(template:, type: nil, variables: nil)
            end

            sig do
              override.returns(
                {
                  template: String,
                  type: T.nilable(String),
                  variables:
                    T.nilable(
                      T::Array[
                        Sentdm::TemplateCreateParams::Definition::Body::SMS::Variable
                      ]
                    )
                }
              )
            end
            def to_hash
            end

            class Variable < Sentdm::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Sentdm::TemplateCreateParams::Definition::Body::SMS::Variable,
                    Sentdm::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :name

              sig do
                returns(
                  Sentdm::TemplateCreateParams::Definition::Body::SMS::Variable::Props
                )
              end
              attr_reader :props

              sig do
                params(
                  props:
                    Sentdm::TemplateCreateParams::Definition::Body::SMS::Variable::Props::OrHash
                ).void
              end
              attr_writer :props

              sig { returns(String) }
              attr_accessor :type

              sig { returns(T.nilable(Integer)) }
              attr_reader :id

              sig { params(id: Integer).void }
              attr_writer :id

              sig do
                params(
                  name: String,
                  props:
                    Sentdm::TemplateCreateParams::Definition::Body::SMS::Variable::Props::OrHash,
                  type: String,
                  id: Integer
                ).returns(T.attached_class)
              end
              def self.new(name:, props:, type:, id: nil)
              end

              sig do
                override.returns(
                  {
                    name: String,
                    props:
                      Sentdm::TemplateCreateParams::Definition::Body::SMS::Variable::Props,
                    type: String,
                    id: Integer
                  }
                )
              end
              def to_hash
              end

              class Props < Sentdm::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Sentdm::TemplateCreateParams::Definition::Body::SMS::Variable::Props,
                      Sentdm::Internal::AnyHash
                    )
                  end

                sig { returns(String) }
                attr_accessor :media_type

                sig { returns(String) }
                attr_accessor :sample

                sig { returns(String) }
                attr_accessor :url

                sig { returns(String) }
                attr_accessor :variable_type

                sig { returns(T.nilable(String)) }
                attr_accessor :alt

                sig { returns(T.nilable(String)) }
                attr_accessor :regex

                sig { returns(T.nilable(String)) }
                attr_accessor :short_url

                sig do
                  params(
                    media_type: String,
                    sample: String,
                    url: String,
                    variable_type: String,
                    alt: T.nilable(String),
                    regex: T.nilable(String),
                    short_url: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  media_type:,
                  sample:,
                  url:,
                  variable_type:,
                  alt: nil,
                  regex: nil,
                  short_url: nil
                )
                end

                sig do
                  override.returns(
                    {
                      media_type: String,
                      sample: String,
                      url: String,
                      variable_type: String,
                      alt: T.nilable(String),
                      regex: T.nilable(String),
                      short_url: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end
              end
            end
          end

          class Whatsapp < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::TemplateCreateParams::Definition::Body::Whatsapp,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :template

            sig { returns(T.nilable(String)) }
            attr_accessor :type

            sig do
              returns(
                T.nilable(
                  T::Array[
                    Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::Variable
                  ]
                )
              )
            end
            attr_accessor :variables

            # WhatsApp-specific content that overrides multi-channel content for WhatsApp
            # messages
            sig do
              params(
                template: String,
                type: T.nilable(String),
                variables:
                  T.nilable(
                    T::Array[
                      Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::Variable::OrHash
                    ]
                  )
              ).returns(T.attached_class)
            end
            def self.new(template:, type: nil, variables: nil)
            end

            sig do
              override.returns(
                {
                  template: String,
                  type: T.nilable(String),
                  variables:
                    T.nilable(
                      T::Array[
                        Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::Variable
                      ]
                    )
                }
              )
            end
            def to_hash
            end

            class Variable < Sentdm::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::Variable,
                    Sentdm::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :name

              sig do
                returns(
                  Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::Variable::Props
                )
              end
              attr_reader :props

              sig do
                params(
                  props:
                    Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::Variable::Props::OrHash
                ).void
              end
              attr_writer :props

              sig { returns(String) }
              attr_accessor :type

              sig { returns(T.nilable(Integer)) }
              attr_reader :id

              sig { params(id: Integer).void }
              attr_writer :id

              sig do
                params(
                  name: String,
                  props:
                    Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::Variable::Props::OrHash,
                  type: String,
                  id: Integer
                ).returns(T.attached_class)
              end
              def self.new(name:, props:, type:, id: nil)
              end

              sig do
                override.returns(
                  {
                    name: String,
                    props:
                      Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::Variable::Props,
                    type: String,
                    id: Integer
                  }
                )
              end
              def to_hash
              end

              class Props < Sentdm::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Sentdm::TemplateCreateParams::Definition::Body::Whatsapp::Variable::Props,
                      Sentdm::Internal::AnyHash
                    )
                  end

                sig { returns(String) }
                attr_accessor :media_type

                sig { returns(String) }
                attr_accessor :sample

                sig { returns(String) }
                attr_accessor :url

                sig { returns(String) }
                attr_accessor :variable_type

                sig { returns(T.nilable(String)) }
                attr_accessor :alt

                sig { returns(T.nilable(String)) }
                attr_accessor :regex

                sig { returns(T.nilable(String)) }
                attr_accessor :short_url

                sig do
                  params(
                    media_type: String,
                    sample: String,
                    url: String,
                    variable_type: String,
                    alt: T.nilable(String),
                    regex: T.nilable(String),
                    short_url: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  media_type:,
                  sample:,
                  url:,
                  variable_type:,
                  alt: nil,
                  regex: nil,
                  short_url: nil
                )
                end

                sig do
                  override.returns(
                    {
                      media_type: String,
                      sample: String,
                      url: String,
                      variable_type: String,
                      alt: T.nilable(String),
                      regex: T.nilable(String),
                      short_url: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end
              end
            end
          end
        end

        class AuthenticationConfig < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::TemplateCreateParams::Definition::AuthenticationConfig,
                Sentdm::Internal::AnyHash
              )
            end

          # Whether to add the security recommendation text: "For your security, do not
          # share this code."
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :add_security_recommendation

          sig { params(add_security_recommendation: T::Boolean).void }
          attr_writer :add_security_recommendation

          # Code expiration time in minutes (1-90). If set, adds footer: "This code expires
          # in X minutes."
          sig { returns(T.nilable(Integer)) }
          attr_accessor :code_expiration_minutes

          # Configuration for AUTHENTICATION category templates
          sig do
            params(
              add_security_recommendation: T::Boolean,
              code_expiration_minutes: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether to add the security recommendation text: "For your security, do not
            # share this code."
            add_security_recommendation: nil,
            # Code expiration time in minutes (1-90). If set, adds footer: "This code expires
            # in X minutes."
            code_expiration_minutes: nil
          )
          end

          sig do
            override.returns(
              {
                add_security_recommendation: T::Boolean,
                code_expiration_minutes: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end
        end

        class Button < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::TemplateCreateParams::Definition::Button,
                Sentdm::Internal::AnyHash
              )
            end

          # Properties specific to the button type
          sig do
            returns(Sentdm::TemplateCreateParams::Definition::Button::Props)
          end
          attr_reader :props

          sig do
            params(
              props:
                Sentdm::TemplateCreateParams::Definition::Button::Props::OrHash
            ).void
          end
          attr_writer :props

          # The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
          sig { returns(String) }
          attr_accessor :type

          # The unique identifier of the button (1-based index)
          sig { returns(T.nilable(Integer)) }
          attr_reader :id

          sig { params(id: Integer).void }
          attr_writer :id

          # Interactive button in a message template
          sig do
            params(
              props:
                Sentdm::TemplateCreateParams::Definition::Button::Props::OrHash,
              type: String,
              id: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Properties specific to the button type
            props:,
            # The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
            type:,
            # The unique identifier of the button (1-based index)
            id: nil
          )
          end

          sig do
            override.returns(
              {
                props: Sentdm::TemplateCreateParams::Definition::Button::Props,
                type: String,
                id: Integer
              }
            )
          end
          def to_hash
          end

          class Props < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::TemplateCreateParams::Definition::Button::Props,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(Integer) }
            attr_accessor :active_for

            sig { returns(String) }
            attr_accessor :country_code

            sig { returns(String) }
            attr_accessor :offer_code

            sig { returns(String) }
            attr_accessor :phone_number

            sig { returns(String) }
            attr_accessor :quick_reply_type

            sig { returns(String) }
            attr_accessor :text

            sig { returns(String) }
            attr_accessor :url

            sig { returns(String) }
            attr_accessor :url_type

            sig { returns(T.nilable(String)) }
            attr_accessor :autofill_text

            sig { returns(T.nilable(String)) }
            attr_accessor :otp_type

            sig { returns(T.nilable(String)) }
            attr_accessor :package_name

            sig { returns(T.nilable(String)) }
            attr_accessor :signature_hash

            # Properties specific to the button type
            sig do
              params(
                active_for: Integer,
                country_code: String,
                offer_code: String,
                phone_number: String,
                quick_reply_type: String,
                text: String,
                url: String,
                url_type: String,
                autofill_text: T.nilable(String),
                otp_type: T.nilable(String),
                package_name: T.nilable(String),
                signature_hash: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              active_for:,
              country_code:,
              offer_code:,
              phone_number:,
              quick_reply_type:,
              text:,
              url:,
              url_type:,
              autofill_text: nil,
              otp_type: nil,
              package_name: nil,
              signature_hash: nil
            )
            end

            sig do
              override.returns(
                {
                  active_for: Integer,
                  country_code: String,
                  offer_code: String,
                  phone_number: String,
                  quick_reply_type: String,
                  text: String,
                  url: String,
                  url_type: String,
                  autofill_text: T.nilable(String),
                  otp_type: T.nilable(String),
                  package_name: T.nilable(String),
                  signature_hash: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end

        class Footer < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::TemplateCreateParams::Definition::Footer,
                Sentdm::Internal::AnyHash
              )
            end

          # The footer template text with optional variable placeholders
          sig { returns(String) }
          attr_accessor :template

          # The type of footer (typically "text")
          sig { returns(T.nilable(String)) }
          attr_accessor :type

          # List of variables used in the footer template
          sig do
            returns(
              T.nilable(
                T::Array[
                  Sentdm::TemplateCreateParams::Definition::Footer::Variable
                ]
              )
            )
          end
          attr_accessor :variables

          # Footer section of a message template
          sig do
            params(
              template: String,
              type: T.nilable(String),
              variables:
                T.nilable(
                  T::Array[
                    Sentdm::TemplateCreateParams::Definition::Footer::Variable::OrHash
                  ]
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The footer template text with optional variable placeholders
            template:,
            # The type of footer (typically "text")
            type: nil,
            # List of variables used in the footer template
            variables: nil
          )
          end

          sig do
            override.returns(
              {
                template: String,
                type: T.nilable(String),
                variables:
                  T.nilable(
                    T::Array[
                      Sentdm::TemplateCreateParams::Definition::Footer::Variable
                    ]
                  )
              }
            )
          end
          def to_hash
          end

          class Variable < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::TemplateCreateParams::Definition::Footer::Variable,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :name

            sig do
              returns(
                Sentdm::TemplateCreateParams::Definition::Footer::Variable::Props
              )
            end
            attr_reader :props

            sig do
              params(
                props:
                  Sentdm::TemplateCreateParams::Definition::Footer::Variable::Props::OrHash
              ).void
            end
            attr_writer :props

            sig { returns(String) }
            attr_accessor :type

            sig { returns(T.nilable(Integer)) }
            attr_reader :id

            sig { params(id: Integer).void }
            attr_writer :id

            sig do
              params(
                name: String,
                props:
                  Sentdm::TemplateCreateParams::Definition::Footer::Variable::Props::OrHash,
                type: String,
                id: Integer
              ).returns(T.attached_class)
            end
            def self.new(name:, props:, type:, id: nil)
            end

            sig do
              override.returns(
                {
                  name: String,
                  props:
                    Sentdm::TemplateCreateParams::Definition::Footer::Variable::Props,
                  type: String,
                  id: Integer
                }
              )
            end
            def to_hash
            end

            class Props < Sentdm::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Sentdm::TemplateCreateParams::Definition::Footer::Variable::Props,
                    Sentdm::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :media_type

              sig { returns(String) }
              attr_accessor :sample

              sig { returns(String) }
              attr_accessor :url

              sig { returns(String) }
              attr_accessor :variable_type

              sig { returns(T.nilable(String)) }
              attr_accessor :alt

              sig { returns(T.nilable(String)) }
              attr_accessor :regex

              sig { returns(T.nilable(String)) }
              attr_accessor :short_url

              sig do
                params(
                  media_type: String,
                  sample: String,
                  url: String,
                  variable_type: String,
                  alt: T.nilable(String),
                  regex: T.nilable(String),
                  short_url: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                media_type:,
                sample:,
                url:,
                variable_type:,
                alt: nil,
                regex: nil,
                short_url: nil
              )
              end

              sig do
                override.returns(
                  {
                    media_type: String,
                    sample: String,
                    url: String,
                    variable_type: String,
                    alt: T.nilable(String),
                    regex: T.nilable(String),
                    short_url: T.nilable(String)
                  }
                )
              end
              def to_hash
              end
            end
          end
        end

        class Header < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::TemplateCreateParams::Definition::Header,
                Sentdm::Internal::AnyHash
              )
            end

          # The header template text with optional variable placeholders (e.g., "Welcome to
          # {{0:variable}}")
          sig { returns(String) }
          attr_accessor :template

          # The type of header (e.g., "text", "image", "video", "document")
          sig { returns(T.nilable(String)) }
          attr_accessor :type

          # List of variables used in the header template
          sig do
            returns(
              T.nilable(
                T::Array[
                  Sentdm::TemplateCreateParams::Definition::Header::Variable
                ]
              )
            )
          end
          attr_accessor :variables

          # Header section of a message template
          sig do
            params(
              template: String,
              type: T.nilable(String),
              variables:
                T.nilable(
                  T::Array[
                    Sentdm::TemplateCreateParams::Definition::Header::Variable::OrHash
                  ]
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The header template text with optional variable placeholders (e.g., "Welcome to
            # {{0:variable}}")
            template:,
            # The type of header (e.g., "text", "image", "video", "document")
            type: nil,
            # List of variables used in the header template
            variables: nil
          )
          end

          sig do
            override.returns(
              {
                template: String,
                type: T.nilable(String),
                variables:
                  T.nilable(
                    T::Array[
                      Sentdm::TemplateCreateParams::Definition::Header::Variable
                    ]
                  )
              }
            )
          end
          def to_hash
          end

          class Variable < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::TemplateCreateParams::Definition::Header::Variable,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :name

            sig do
              returns(
                Sentdm::TemplateCreateParams::Definition::Header::Variable::Props
              )
            end
            attr_reader :props

            sig do
              params(
                props:
                  Sentdm::TemplateCreateParams::Definition::Header::Variable::Props::OrHash
              ).void
            end
            attr_writer :props

            sig { returns(String) }
            attr_accessor :type

            sig { returns(T.nilable(Integer)) }
            attr_reader :id

            sig { params(id: Integer).void }
            attr_writer :id

            sig do
              params(
                name: String,
                props:
                  Sentdm::TemplateCreateParams::Definition::Header::Variable::Props::OrHash,
                type: String,
                id: Integer
              ).returns(T.attached_class)
            end
            def self.new(name:, props:, type:, id: nil)
            end

            sig do
              override.returns(
                {
                  name: String,
                  props:
                    Sentdm::TemplateCreateParams::Definition::Header::Variable::Props,
                  type: String,
                  id: Integer
                }
              )
            end
            def to_hash
            end

            class Props < Sentdm::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Sentdm::TemplateCreateParams::Definition::Header::Variable::Props,
                    Sentdm::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :media_type

              sig { returns(String) }
              attr_accessor :sample

              sig { returns(String) }
              attr_accessor :url

              sig { returns(String) }
              attr_accessor :variable_type

              sig { returns(T.nilable(String)) }
              attr_accessor :alt

              sig { returns(T.nilable(String)) }
              attr_accessor :regex

              sig { returns(T.nilable(String)) }
              attr_accessor :short_url

              sig do
                params(
                  media_type: String,
                  sample: String,
                  url: String,
                  variable_type: String,
                  alt: T.nilable(String),
                  regex: T.nilable(String),
                  short_url: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                media_type:,
                sample:,
                url:,
                variable_type:,
                alt: nil,
                regex: nil,
                short_url: nil
              )
              end

              sig do
                override.returns(
                  {
                    media_type: String,
                    sample: String,
                    url: String,
                    variable_type: String,
                    alt: T.nilable(String),
                    regex: T.nilable(String),
                    short_url: T.nilable(String)
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
  end
end
