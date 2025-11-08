# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class UpdateActiveWorkspaceResponse
  # @return [String] The id of the workspace that the user should update to, or null if no workspace
#  change needed.
    attr_reader :update_active_workspace_id
  # @return [String] The id of the environment that the user should update to, or null if no
#  environment change needed.
    attr_reader :update_active_environment_id
  # @return [Boolean] Whether or not the user is a staff member of Vellum.
    attr_reader :is_staff
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param update_active_workspace_id [String] The id of the workspace that the user should update to, or null if no workspace
#  change needed.
    # @param update_active_environment_id [String] The id of the environment that the user should update to, or null if no
#  environment change needed.
    # @param is_staff [Boolean] Whether or not the user is a staff member of Vellum.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::UpdateActiveWorkspaceResponse]
    def initialize(update_active_workspace_id: OMIT, update_active_environment_id: OMIT, is_staff: OMIT, additional_properties: nil)
      @update_active_workspace_id = update_active_workspace_id if update_active_workspace_id != OMIT
      @update_active_environment_id = update_active_environment_id if update_active_environment_id != OMIT
      @is_staff = is_staff if is_staff != OMIT
      @additional_properties = additional_properties
      @_field_set = { "update_active_workspace_id": update_active_workspace_id, "update_active_environment_id": update_active_environment_id, "is_staff": is_staff }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateActiveWorkspaceResponse
    #
    # @param json_object [String] 
    # @return [Vellum::UpdateActiveWorkspaceResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      update_active_workspace_id = parsed_json["update_active_workspace_id"]
      update_active_environment_id = parsed_json["update_active_environment_id"]
      is_staff = parsed_json["is_staff"]
      new(
        update_active_workspace_id: update_active_workspace_id,
        update_active_environment_id: update_active_environment_id,
        is_staff: is_staff,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateActiveWorkspaceResponse to a JSON object
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
      obj.update_active_workspace_id&.is_a?(String) != false || raise("Passed value for field obj.update_active_workspace_id is not the expected type, validation failed.")
      obj.update_active_environment_id&.is_a?(String) != false || raise("Passed value for field obj.update_active_environment_id is not the expected type, validation failed.")
      obj.is_staff&.is_a?(Boolean) != false || raise("Passed value for field obj.is_staff is not the expected type, validation failed.")
    end
  end
end