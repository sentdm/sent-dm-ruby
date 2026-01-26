# frozen_string_literal: true

module SentDm
  [SentDm::Internal::Type::BaseModel, *SentDm::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, SentDm::Internal::AnyHash) } }
  end

  SentDm::Internal::Util.walk_namespaces(SentDm::Models).each do |mod|
    case mod
    in SentDm::Internal::Type::Enum | SentDm::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  SentDm::Internal::Util.walk_namespaces(SentDm::Models)
                        .lazy
                        .grep(SentDm::Internal::Type::Union)
                        .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  ContactListItem = SentDm::Models::ContactListItem

  ContactListParams = SentDm::Models::ContactListParams

  ContactRetrieveByPhoneParams = SentDm::Models::ContactRetrieveByPhoneParams

  ContactRetrieveIDParams = SentDm::Models::ContactRetrieveIDParams

  MessageRetrieveParams = SentDm::Models::MessageRetrieveParams

  MessageSendQuickMessageParams = SentDm::Models::MessageSendQuickMessageParams

  MessageSendToContactParams = SentDm::Models::MessageSendToContactParams

  MessageSendToPhoneParams = SentDm::Models::MessageSendToPhoneParams

  NumberLookupRetrieveParams = SentDm::Models::NumberLookupRetrieveParams

  OrganizationListParams = SentDm::Models::OrganizationListParams

  OrganizationRetrieveProfilesParams = SentDm::Models::OrganizationRetrieveProfilesParams

  Organizations = SentDm::Models::Organizations

  ProfileSummary = SentDm::Models::ProfileSummary

  TemplateBodyContent = SentDm::Models::TemplateBodyContent

  TemplateCreateParams = SentDm::Models::TemplateCreateParams

  TemplateDefinition = SentDm::Models::TemplateDefinition

  TemplateDeleteParams = SentDm::Models::TemplateDeleteParams

  TemplateListParams = SentDm::Models::TemplateListParams

  TemplateResponse = SentDm::Models::TemplateResponse

  TemplateRetrieveParams = SentDm::Models::TemplateRetrieveParams

  TemplateVariable = SentDm::Models::TemplateVariable
end
