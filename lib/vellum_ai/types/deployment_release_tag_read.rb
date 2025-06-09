# frozen_string_literal: true
require_relative "release_tag_source"
require_relative "deployment_release_tag_deployment_history_item"
require_relative "release_tag_release"
require "ostruct"
require "json"

module Vellum
  class DeploymentReleaseTagRead
  # @return [String] The name of the Release Tag
    attr_reader :name
  # @return [Vellum::ReleaseTagSource] The source of how the Release Tag was originally created
#  * `SYSTEM` - System
#  * `USER` - User
    attr_reader :source
  # @return [Vellum::DeploymentReleaseTagDeploymentHistoryItem] Deprecated. Reference the `release` field instead.
    attr_reader :history_item
  # @return [Vellum::ReleaseTagRelease] The Release that this Release Tag points to.
    attr_reader :release
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the Release Tag
    # @param source [Vellum::ReleaseTagSource] The source of how the Release Tag was originally created
#  * `SYSTEM` - System
#  * `USER` - User
    # @param history_item [Vellum::DeploymentReleaseTagDeploymentHistoryItem] Deprecated. Reference the `release` field instead.
    # @param release [Vellum::ReleaseTagRelease] The Release that this Release Tag points to.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DeploymentReleaseTagRead]
    def initialize(name:, source:, history_item:, release:, additional_properties: nil)
      @name = name
      @source = source
      @history_item = history_item
      @release = release
      @additional_properties = additional_properties
      @_field_set = { "name": name, "source": source, "history_item": history_item, "release": release }
    end
# Deserialize a JSON object to an instance of DeploymentReleaseTagRead
    #
    # @param json_object [String] 
    # @return [Vellum::DeploymentReleaseTagRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      source = parsed_json["source"]
      unless parsed_json["history_item"].nil?
        history_item = parsed_json["history_item"].to_json
        history_item = Vellum::DeploymentReleaseTagDeploymentHistoryItem.from_json(json_object: history_item)
      else
        history_item = nil
      end
      unless parsed_json["release"].nil?
        release = parsed_json["release"].to_json
        release = Vellum::ReleaseTagRelease.from_json(json_object: release)
      else
        release = nil
      end
      new(
        name: name,
        source: source,
        history_item: history_item,
        release: release,
        additional_properties: struct
      )
    end
# Serialize an instance of DeploymentReleaseTagRead to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.source.is_a?(Vellum::ReleaseTagSource) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
      Vellum::DeploymentReleaseTagDeploymentHistoryItem.validate_raw(obj: obj.history_item)
      Vellum::ReleaseTagRelease.validate_raw(obj: obj.release)
    end
  end
end