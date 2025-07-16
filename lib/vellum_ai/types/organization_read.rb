# frozen_string_literal: true
require_relative "new_member_join_behavior_enum"
require_relative "organization_limit_config"
require "ostruct"
require "json"

module Vellum
  class OrganizationRead
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :name
  # @return [Boolean] 
    attr_reader :allow_staff_access
  # @return [Vellum::NewMemberJoinBehaviorEnum] 
    attr_reader :new_member_join_behavior
  # @return [Vellum::OrganizationLimitConfig] 
    attr_reader :limit_config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param name [String] 
    # @param allow_staff_access [Boolean] 
    # @param new_member_join_behavior [Vellum::NewMemberJoinBehaviorEnum] 
    # @param limit_config [Vellum::OrganizationLimitConfig] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::OrganizationRead]
    def initialize(id:, name:, allow_staff_access: OMIT, new_member_join_behavior:, limit_config:, additional_properties: nil)
      @id = id
      @name = name
      @allow_staff_access = allow_staff_access if allow_staff_access != OMIT
      @new_member_join_behavior = new_member_join_behavior
      @limit_config = limit_config
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "allow_staff_access": allow_staff_access, "new_member_join_behavior": new_member_join_behavior, "limit_config": limit_config }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrganizationRead
    #
    # @param json_object [String] 
    # @return [Vellum::OrganizationRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      allow_staff_access = parsed_json["allow_staff_access"]
      new_member_join_behavior = parsed_json["new_member_join_behavior"]
      unless parsed_json["limit_config"].nil?
        limit_config = parsed_json["limit_config"].to_json
        limit_config = Vellum::OrganizationLimitConfig.from_json(json_object: limit_config)
      else
        limit_config = nil
      end
      new(
        id: id,
        name: name,
        allow_staff_access: allow_staff_access,
        new_member_join_behavior: new_member_join_behavior,
        limit_config: limit_config,
        additional_properties: struct
      )
    end
# Serialize an instance of OrganizationRead to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.allow_staff_access&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_staff_access is not the expected type, validation failed.")
      obj.new_member_join_behavior.is_a?(Vellum::NewMemberJoinBehaviorEnum) != false || raise("Passed value for field obj.new_member_join_behavior is not the expected type, validation failed.")
      Vellum::OrganizationLimitConfig.validate_raw(obj: obj.limit_config)
    end
  end
end