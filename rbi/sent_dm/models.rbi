# typed: strong

module SentDm
  APIError = SentDm::Models::APIError

  APIMeta = SentDm::Models::APIMeta

  APIResponseBrandWithKYC = SentDm::Models::APIResponseBrandWithKYC

  APIResponseContact = SentDm::Models::APIResponseContact

  APIResponseOfProfileDetail = SentDm::Models::APIResponseOfProfileDetail

  APIResponseOfUser = SentDm::Models::APIResponseOfUser

  APIResponseTemplate = SentDm::Models::APIResponseTemplate

  APIResponseWebhook = SentDm::Models::APIResponseWebhook

  BrandCreateParams = SentDm::Models::BrandCreateParams

  BrandData = SentDm::Models::BrandData

  BrandDeleteParams = SentDm::Models::BrandDeleteParams

  BrandListParams = SentDm::Models::BrandListParams

  Brands = SentDm::Models::Brands

  BrandUpdateParams = SentDm::Models::BrandUpdateParams

  BrandWithKYC = SentDm::Models::BrandWithKYC

  Contact = SentDm::Models::Contact

  ContactCreateParams = SentDm::Models::ContactCreateParams

  ContactDeleteParams = SentDm::Models::ContactDeleteParams

  ContactListParams = SentDm::Models::ContactListParams

  ContactRetrieveParams = SentDm::Models::ContactRetrieveParams

  ContactUpdateParams = SentDm::Models::ContactUpdateParams

  DestinationCountry = SentDm::Models::DestinationCountry

  LookupRetrievePhoneInfoParams = SentDm::Models::LookupRetrievePhoneInfoParams

  MeRetrieveParams = SentDm::Models::MeRetrieveParams

  MessageRetrieveActivitiesParams =
    SentDm::Models::MessageRetrieveActivitiesParams

  MessageRetrieveStatusParams = SentDm::Models::MessageRetrieveStatusParams

  MessageSendParams = SentDm::Models::MessageSendParams

  MutationRequest = SentDm::Models::MutationRequest

  PaginationMeta = SentDm::Models::PaginationMeta

  ProfileCompleteParams = SentDm::Models::ProfileCompleteParams

  ProfileCreateParams = SentDm::Models::ProfileCreateParams

  ProfileDeleteParams = SentDm::Models::ProfileDeleteParams

  ProfileDetail = SentDm::Models::ProfileDetail

  ProfileListParams = SentDm::Models::ProfileListParams

  ProfileRetrieveParams = SentDm::Models::ProfileRetrieveParams

  ProfileSettings = SentDm::Models::ProfileSettings

  ProfileUpdateParams = SentDm::Models::ProfileUpdateParams

  TcrBrandRelationship = SentDm::Models::TcrBrandRelationship

  TcrVertical = SentDm::Models::TcrVertical

  Template = SentDm::Models::Template

  TemplateBodyContent = SentDm::Models::TemplateBodyContent

  TemplateCreateParams = SentDm::Models::TemplateCreateParams

  TemplateDefinition = SentDm::Models::TemplateDefinition

  TemplateDeleteParams = SentDm::Models::TemplateDeleteParams

  TemplateListParams = SentDm::Models::TemplateListParams

  TemplateRetrieveParams = SentDm::Models::TemplateRetrieveParams

  TemplateUpdateParams = SentDm::Models::TemplateUpdateParams

  TemplateVariable = SentDm::Models::TemplateVariable

  UserInviteParams = SentDm::Models::UserInviteParams

  UserListParams = SentDm::Models::UserListParams

  UserRemoveParams = SentDm::Models::UserRemoveParams

  UserResponse = SentDm::Models::UserResponse

  UserRetrieveParams = SentDm::Models::UserRetrieveParams

  UserUpdateRoleParams = SentDm::Models::UserUpdateRoleParams

  WebhookCreateParams = SentDm::Models::WebhookCreateParams

  WebhookDeleteParams = SentDm::Models::WebhookDeleteParams

  WebhookListEventsParams = SentDm::Models::WebhookListEventsParams

  WebhookListEventTypesParams = SentDm::Models::WebhookListEventTypesParams

  WebhookListParams = SentDm::Models::WebhookListParams

  WebhookResponse = SentDm::Models::WebhookResponse

  WebhookRetrieveParams = SentDm::Models::WebhookRetrieveParams

  WebhookRotateSecretParams = SentDm::Models::WebhookRotateSecretParams

  WebhookTestParams = SentDm::Models::WebhookTestParams

  WebhookToggleStatusParams = SentDm::Models::WebhookToggleStatusParams

  WebhookUpdateParams = SentDm::Models::WebhookUpdateParams
end
