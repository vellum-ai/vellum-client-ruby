# frozen_string_literal: true
require "json"
require_relative "folder_entity_folder"
require_relative "folder_entity_prompt_sandbox"
require_relative "folder_entity_workflow_sandbox"
require_relative "folder_entity_document_index"
require_relative "folder_entity_test_suite"
require_relative "folder_entity_dataset"

module Vellum
  class FolderEntity
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::FolderEntity]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of FolderEntity
    #
    # @param json_object [String] 
    # @return [Vellum::FolderEntity]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "FOLDER"
        member = Vellum::FolderEntityFolder.from_json(json_object: json_object)
      when "PROMPT_SANDBOX"
        member = Vellum::FolderEntityPromptSandbox.from_json(json_object: json_object)
      when "WORKFLOW_SANDBOX"
        member = Vellum::FolderEntityWorkflowSandbox.from_json(json_object: json_object)
      when "DOCUMENT_INDEX"
        member = Vellum::FolderEntityDocumentIndex.from_json(json_object: json_object)
      when "TEST_SUITE"
        member = Vellum::FolderEntityTestSuite.from_json(json_object: json_object)
      when "DATASET"
        member = Vellum::FolderEntityDataset.from_json(json_object: json_object)
      else
        member = Vellum::FolderEntityFolder.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "FOLDER"
        { **@member.to_json, type: @discriminant }.to_json
      when "PROMPT_SANDBOX"
        { **@member.to_json, type: @discriminant }.to_json
      when "WORKFLOW_SANDBOX"
        { **@member.to_json, type: @discriminant }.to_json
      when "DOCUMENT_INDEX"
        { **@member.to_json, type: @discriminant }.to_json
      when "TEST_SUITE"
        { **@member.to_json, type: @discriminant }.to_json
      when "DATASET"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "FOLDER"
        Vellum::FolderEntityFolder.validate_raw(obj: obj)
      when "PROMPT_SANDBOX"
        Vellum::FolderEntityPromptSandbox.validate_raw(obj: obj)
      when "WORKFLOW_SANDBOX"
        Vellum::FolderEntityWorkflowSandbox.validate_raw(obj: obj)
      when "DOCUMENT_INDEX"
        Vellum::FolderEntityDocumentIndex.validate_raw(obj: obj)
      when "TEST_SUITE"
        Vellum::FolderEntityTestSuite.validate_raw(obj: obj)
      when "DATASET"
        Vellum::FolderEntityDataset.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Vellum::FolderEntityFolder] 
    # @return [Vellum::FolderEntity]
    def self.folder(member:)
      new(member: member, discriminant: "FOLDER")
    end
    # @param member [Vellum::FolderEntityPromptSandbox] 
    # @return [Vellum::FolderEntity]
    def self.prompt_sandbox(member:)
      new(member: member, discriminant: "PROMPT_SANDBOX")
    end
    # @param member [Vellum::FolderEntityWorkflowSandbox] 
    # @return [Vellum::FolderEntity]
    def self.workflow_sandbox(member:)
      new(member: member, discriminant: "WORKFLOW_SANDBOX")
    end
    # @param member [Vellum::FolderEntityDocumentIndex] 
    # @return [Vellum::FolderEntity]
    def self.document_index(member:)
      new(member: member, discriminant: "DOCUMENT_INDEX")
    end
    # @param member [Vellum::FolderEntityTestSuite] 
    # @return [Vellum::FolderEntity]
    def self.test_suite(member:)
      new(member: member, discriminant: "TEST_SUITE")
    end
    # @param member [Vellum::FolderEntityDataset] 
    # @return [Vellum::FolderEntity]
    def self.dataset(member:)
      new(member: member, discriminant: "DATASET")
    end
  end
end