# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class DockerServiceToken
  # @return [String] 
    attr_reader :access_token
  # @return [String] 
    attr_reader :organization_id
  # @return [String] 
    attr_reader :repository
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param access_token [String] 
    # @param organization_id [String] 
    # @param repository [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DockerServiceToken]
    def initialize(access_token:, organization_id:, repository:, additional_properties: nil)
      @access_token = access_token
      @organization_id = organization_id
      @repository = repository
      @additional_properties = additional_properties
      @_field_set = { "access_token": access_token, "organization_id": organization_id, "repository": repository }
    end
# Deserialize a JSON object to an instance of DockerServiceToken
    #
    # @param json_object [String] 
    # @return [Vellum::DockerServiceToken]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      access_token = parsed_json["access_token"]
      organization_id = parsed_json["organization_id"]
      repository = parsed_json["repository"]
      new(
        access_token: access_token,
        organization_id: organization_id,
        repository: repository,
        additional_properties: struct
      )
    end
# Serialize an instance of DockerServiceToken to a JSON object
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
      obj.access_token.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
      obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
      obj.repository.is_a?(String) != false || raise("Passed value for field obj.repository is not the expected type, validation failed.")
    end
  end
end