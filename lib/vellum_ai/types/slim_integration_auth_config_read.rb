# frozen_string_literal: true
require_relative "integration_auth_config_integration_credential"
require_relative "integration_credential_access_type"
require "ostruct"
require "json"

module Vellum
# A slim representation of an Integration Auth Config.
  class SlimIntegrationAuthConfigRead
  # @return [String] 
    attr_reader :id
  # @return [Array<Vellum::IntegrationAuthConfigIntegrationCredential>] 
    attr_reader :integration_credentials
  # @return [Vellum::IntegrationCredentialAccessType] 
    attr_reader :default_access_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param integration_credentials [Array<Vellum::IntegrationAuthConfigIntegrationCredential>] 
    # @param default_access_type [Vellum::IntegrationCredentialAccessType] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SlimIntegrationAuthConfigRead]
    def initialize(id: OMIT, integration_credentials: OMIT, default_access_type: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @integration_credentials = integration_credentials if integration_credentials != OMIT
      @default_access_type = default_access_type if default_access_type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "integration_credentials": integration_credentials, "default_access_type": default_access_type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SlimIntegrationAuthConfigRead
    #
    # @param json_object [String] 
    # @return [Vellum::SlimIntegrationAuthConfigRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      integration_credentials = parsed_json["integration_credentials"]&.map do | item |
  item = item.to_json
  Vellum::IntegrationAuthConfigIntegrationCredential.from_json(json_object: item)
end
      default_access_type = parsed_json["default_access_type"]
      new(
        id: id,
        integration_credentials: integration_credentials,
        default_access_type: default_access_type,
        additional_properties: struct
      )
    end
# Serialize an instance of SlimIntegrationAuthConfigRead to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.integration_credentials&.is_a?(Array) != false || raise("Passed value for field obj.integration_credentials is not the expected type, validation failed.")
      obj.default_access_type&.is_a?(Vellum::IntegrationCredentialAccessType) != false || raise("Passed value for field obj.default_access_type is not the expected type, validation failed.")
    end
  end
end