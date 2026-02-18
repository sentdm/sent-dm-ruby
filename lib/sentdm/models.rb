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

  APIError = Sentdm::Models::APIError

  APIMeta = Sentdm::Models::APIMeta

  APIResponseBrandWithKYC = Sentdm::Models::APIResponseBrandWithKYC

  APIResponseContact = Sentdm::Models::APIResponseContact

  APIResponseOfProfileDetail = Sentdm::Models::APIResponseOfProfileDetail

  APIResponseOfUser = Sentdm::Models::APIResponseOfUser

  APIResponseTemplate = Sentdm::Models::APIResponseTemplate

  APIResponseWebhook = Sentdm::Models::APIResponseWebhook

  BrandCreateParams = Sentdm::Models::BrandCreateParams

  BrandData = Sentdm::Models::BrandData

  BrandDeleteParams = Sentdm::Models::BrandDeleteParams

  BrandListParams = Sentdm::Models::BrandListParams

  Brands = Sentdm::Models::Brands

  BrandUpdateParams = Sentdm::Models::BrandUpdateParams

  BrandWithKYC = Sentdm::Models::BrandWithKYC

  Contact = Sentdm::Models::Contact

  ContactCreateParams = Sentdm::Models::ContactCreateParams

  ContactDeleteParams = Sentdm::Models::ContactDeleteParams

  ContactListParams = Sentdm::Models::ContactListParams

  ContactRetrieveParams = Sentdm::Models::ContactRetrieveParams

  ContactUpdateParams = Sentdm::Models::ContactUpdateParams

  DestinationCountry = Sentdm::Models::DestinationCountry

  LookupRetrievePhoneInfoParams = Sentdm::Models::LookupRetrievePhoneInfoParams

  MeRetrieveParams = Sentdm::Models::MeRetrieveParams

  MessageRetrieveActivitiesParams = Sentdm::Models::MessageRetrieveActivitiesParams

  MessageRetrieveStatusParams = Sentdm::Models::MessageRetrieveStatusParams

  MessageSendParams = Sentdm::Models::MessageSendParams

  MutationRequest = Sentdm::Models::MutationRequest

  PaginationMeta = Sentdm::Models::PaginationMeta

  ProfileCompleteParams = Sentdm::Models::ProfileCompleteParams

  ProfileCreateParams = Sentdm::Models::ProfileCreateParams

  ProfileDeleteParams = Sentdm::Models::ProfileDeleteParams

  ProfileDetail = Sentdm::Models::ProfileDetail

  ProfileListParams = Sentdm::Models::ProfileListParams

  ProfileRetrieveParams = Sentdm::Models::ProfileRetrieveParams

  ProfileSettings = Sentdm::Models::ProfileSettings

  ProfileUpdateParams = Sentdm::Models::ProfileUpdateParams

  SentDmServicesCommonContractsPocOsAuthenticationConfig =
    Sentdm::Models::SentDmServicesCommonContractsPocOsAuthenticationConfig

  SentDmServicesCommonContractsPocOsTemplateBody =
    Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateBody

  SentDmServicesCommonContractsPocOsTemplateButton =
    Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateButton

  SentDmServicesCommonContractsPocOsTemplateButtonProps =
    Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateButtonProps

  SentDmServicesCommonContractsPocOsTemplateFooter =
    Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateFooter

  SentDmServicesCommonContractsPocOsTemplateHeader =
    Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateHeader

  TcrBrandRelationship = Sentdm::Models::TcrBrandRelationship

  TcrVertical = Sentdm::Models::TcrVertical

  Template = Sentdm::Models::Template

  TemplateBodyContent = Sentdm::Models::TemplateBodyContent

  TemplateCreateParams = Sentdm::Models::TemplateCreateParams

  TemplateDefinition = Sentdm::Models::TemplateDefinition

  TemplateDeleteParams = Sentdm::Models::TemplateDeleteParams

  TemplateListParams = Sentdm::Models::TemplateListParams

  TemplateRetrieveParams = Sentdm::Models::TemplateRetrieveParams

  TemplateUpdateParams = Sentdm::Models::TemplateUpdateParams

  TemplateVariable = Sentdm::Models::TemplateVariable

  UserInviteParams = Sentdm::Models::UserInviteParams

  UserListParams = Sentdm::Models::UserListParams

  UserRemoveParams = Sentdm::Models::UserRemoveParams

  UserResponse = Sentdm::Models::UserResponse

  UserRetrieveParams = Sentdm::Models::UserRetrieveParams

  UserUpdateRoleParams = Sentdm::Models::UserUpdateRoleParams

  WebhookCreateParams = Sentdm::Models::WebhookCreateParams

  WebhookDeleteParams = Sentdm::Models::WebhookDeleteParams

  WebhookListEventsParams = Sentdm::Models::WebhookListEventsParams

  WebhookListEventTypesParams = Sentdm::Models::WebhookListEventTypesParams

  WebhookListParams = Sentdm::Models::WebhookListParams

  WebhookResponse = Sentdm::Models::WebhookResponse

  WebhookRetrieveParams = Sentdm::Models::WebhookRetrieveParams

  WebhookRotateSecretParams = Sentdm::Models::WebhookRotateSecretParams

  WebhookTestParams = Sentdm::Models::WebhookTestParams

  WebhookToggleStatusParams = Sentdm::Models::WebhookToggleStatusParams

  WebhookUpdateParams = Sentdm::Models::WebhookUpdateParams
end
