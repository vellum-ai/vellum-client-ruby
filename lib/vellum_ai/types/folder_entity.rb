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


# Deserialize a JSON object to an instance of FolderEntity
    #
    # @param json_object [String] 
    # @return [Vellum::FolderEntity]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::FolderEntityFolder.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FolderEntityFolder.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FolderEntityPromptSandbox.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FolderEntityPromptSandbox.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FolderEntityWorkflowSandbox.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FolderEntityWorkflowSandbox.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FolderEntityDocumentIndex.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FolderEntityDocumentIndex.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FolderEntityTestSuite.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FolderEntityTestSuite.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FolderEntityDataset.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FolderEntityDataset.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vellum::FolderEntityFolder.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FolderEntityPromptSandbox.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FolderEntityWorkflowSandbox.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FolderEntityDocumentIndex.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FolderEntityTestSuite.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FolderEntityDataset.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end