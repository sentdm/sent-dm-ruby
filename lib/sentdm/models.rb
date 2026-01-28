# frozen_string_literal: true

module Sentdm
  [Sentdm::Internal::Type::BaseModel, *Sentdm::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Sentdm::Internal::AnyHash) } }
  end

  Sentdm::Internal::Util.walk_namespaces(Sentdm::Models).each do |mod|
    case mod
    in Sentdm::Internal::Type::Enum | Sentdm::Internal::Type::Union
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

  Sentdm::Internal::Util.walk_namespaces(Sentdm::Models)
                        .lazy
                        .grep(Sentdm::Internal::Type::Union)
                        .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  ContactListItem = Sentdm::Models::ContactListItem

  ContactListParams = Sentdm::Models::ContactListParams

  ContactRetrieveByPhoneParams = Sentdm::Models::ContactRetrieveByPhoneParams

  ContactRetrieveIDParams = Sentdm::Models::ContactRetrieveIDParams

  MessageRetrieveParams = Sentdm::Models::MessageRetrieveParams

  MessageSendQuickMessageParams = Sentdm::Models::MessageSendQuickMessageParams

  MessageSendToContactParams = Sentdm::Models::MessageSendToContactParams

  MessageSendToPhoneParams = Sentdm::Models::MessageSendToPhoneParams

  NumberLookupRetrieveParams = Sentdm::Models::NumberLookupRetrieveParams

  OrganizationListParams = Sentdm::Models::OrganizationListParams

  OrganizationRetrieveProfilesParams = Sentdm::Models::OrganizationRetrieveProfilesParams

  Organizations = Sentdm::Models::Organizations

  ProfileSummary = Sentdm::Models::ProfileSummary

  TemplateBodyContent = Sentdm::Models::TemplateBodyContent

  TemplateCreateParams = Sentdm::Models::TemplateCreateParams

  TemplateDefinition = Sentdm::Models::TemplateDefinition

  TemplateDeleteParams = Sentdm::Models::TemplateDeleteParams

  TemplateListParams = Sentdm::Models::TemplateListParams

  TemplateResponse = Sentdm::Models::TemplateResponse

  TemplateRetrieveParams = Sentdm::Models::TemplateRetrieveParams

  TemplateVariable = Sentdm::Models::TemplateVariable
end
