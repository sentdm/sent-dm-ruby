# frozen_string_literal: true

# Standard libraries.
# rubocop:disable Lint/RedundantRequireStatement
require "English"
require "base64"
require "cgi"
require "date"
require "erb"
require "etc"
require "json"
require "net/http"
require "openssl"
require "pathname"
require "rbconfig"
require "securerandom"
require "set"
require "stringio"
require "time"
require "uri"
# rubocop:enable Lint/RedundantRequireStatement

# We already ship the preferred sorbet manifests in the package itself.
# `tapioca` currently does not offer us a way to opt out of unnecessary compilation.
if Object.const_defined?(:Tapioca) &&
   caller.chain([$PROGRAM_NAME]).chain(ARGV).any?(/tapioca/) &&
   ARGV.none?(/dsl/)
  return
end

# Gems.
require "connection_pool"

# Package files.
require_relative "sentdm/version"
require_relative "sentdm/internal/util"
require_relative "sentdm/internal/type/converter"
require_relative "sentdm/internal/type/unknown"
require_relative "sentdm/internal/type/boolean"
require_relative "sentdm/internal/type/file_input"
require_relative "sentdm/internal/type/enum"
require_relative "sentdm/internal/type/union"
require_relative "sentdm/internal/type/array_of"
require_relative "sentdm/internal/type/hash_of"
require_relative "sentdm/internal/type/base_model"
require_relative "sentdm/internal/type/base_page"
require_relative "sentdm/internal/type/request_parameters"
require_relative "sentdm/internal"
require_relative "sentdm/request_options"
require_relative "sentdm/file_part"
require_relative "sentdm/errors"
require_relative "sentdm/internal/transport/base_client"
require_relative "sentdm/internal/transport/pooled_net_requester"
require_relative "sentdm/client"
require_relative "sentdm/models/contact_list_item"
require_relative "sentdm/models/contact_list_params"
require_relative "sentdm/models/contact_list_response"
require_relative "sentdm/models/contact_retrieve_by_phone_params"
require_relative "sentdm/models/contact_retrieve_id_params"
require_relative "sentdm/models/message_retrieve_params"
require_relative "sentdm/models/message_retrieve_response"
require_relative "sentdm/models/message_send_quick_message_params"
require_relative "sentdm/models/message_send_to_contact_params"
require_relative "sentdm/models/message_send_to_phone_params"
require_relative "sentdm/models/number_lookup_retrieve_params"
require_relative "sentdm/models/number_lookup_retrieve_response"
require_relative "sentdm/models/template_body_content"
require_relative "sentdm/models/template_create_params"
require_relative "sentdm/models/template_definition"
require_relative "sentdm/models/template_delete_params"
require_relative "sentdm/models/template_list_params"
require_relative "sentdm/models/template_list_response"
require_relative "sentdm/models/template_response"
require_relative "sentdm/models/template_retrieve_params"
require_relative "sentdm/models/template_variable"
require_relative "sentdm/models"
require_relative "sentdm/resources/contacts"
require_relative "sentdm/resources/messages"
require_relative "sentdm/resources/number_lookup"
require_relative "sentdm/resources/organizations"
require_relative "sentdm/resources/organizations/users"
require_relative "sentdm/resources/templates"
