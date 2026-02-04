# frozen_string_literal: true
require_relative "ml_model_hosting_interface"
require "ostruct"
require "json"

module Vellum
  class WorkflowModelProviderDependency
  # @return [String] 
    attr_reader :type
  # @return [Vellum::MlModelHostingInterface] 
    attr_reader :name
  # @return [String] 
    attr_reader :label
  # @return [String] 
    attr_reader :model_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param name [Vellum::MlModelHostingInterface] 
    # @param label [String] 
    # @param model_name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowModelProviderDependency]
    def initialize(type:, name:, label: OMIT, model_name:, additional_properties: nil)
      @type = type
      @name = name
      @label = label if label != OMIT
      @model_name = model_name
      @additional_properties = additional_properties
      @_field_set = { "type": type, "name": name, "label": label, "model_name": model_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowModelProviderDependency
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowModelProviderDependency]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      name = parsed_json["name"]
      label = parsed_json["label"]
      model_name = parsed_json["model_name"]
      new(
        type: type,
        name: name,
        label: label,
        model_name: model_name,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowModelProviderDependency to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.name.is_a?(Vellum::MlModelHostingInterface) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.model_name.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
    end
  end
end