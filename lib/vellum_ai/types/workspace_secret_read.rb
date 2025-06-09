# frozen_string_literal: true
require "date"
require_relative "secret_type_enum"
require "ostruct"
require "json"

module Vellum
  class WorkspaceSecretRead
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :modified
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :label
  # @return [Vellum::SecretTypeEnum] 
    attr_reader :secret_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param modified [DateTime] 
    # @param name [String] 
    # @param label [String] 
    # @param secret_type [Vellum::SecretTypeEnum] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkspaceSecretRead]
    def initialize(id: OMIT, modified: OMIT, name:, label:, secret_type:, additional_properties: nil)
      @id = id if id != OMIT
      @modified = modified if modified != OMIT
      @name = name
      @label = label
      @secret_type = secret_type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "modified": modified, "name": name, "label": label, "secret_type": secret_type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkspaceSecretRead
    #
    # @param json_object [String] 
    # @return [Vellum::WorkspaceSecretRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      modified = unless parsed_json["modified"].nil?
  DateTime.parse(parsed_json["modified"])
else
  nil
end
      name = parsed_json["name"]
      label = parsed_json["label"]
      secret_type = parsed_json["secret_type"]
      new(
        id: id,
        modified: modified,
        name: name,
        label: label,
        secret_type: secret_type,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkspaceSecretRead to a JSON object
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
      obj.modified&.is_a?(DateTime) != false || raise("Passed value for field obj.modified is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.secret_type.is_a?(Vellum::SecretTypeEnum) != false || raise("Passed value for field obj.secret_type is not the expected type, validation failed.")
    end
  end
end