# typed: strong

module Sentdm
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

  MessageRetrieveActivitiesParams =
    Sentdm::Models::MessageRetrieveActivitiesParams

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
