# frozen_string_literal: true
require "json"
require_relative "string_input"
require_relative "json_input"
require_relative "chat_history_input"
require_relative "number_input"
require_relative "search_results_input"
require_relative "error_input"
require_relative "array_input"
require_relative "function_call_input"
require_relative "code_executor_secret_input"

module Vellum
  class CodeExecutorInput


# Deserialize a JSON object to an instance of CodeExecutorInput
    #
    # @param json_object [String] 
    # @return [Vellum::CodeExecutorInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::StringInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::StringInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::JsonInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::JsonInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ChatHistoryInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ChatHistoryInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NumberInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NumberInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::SearchResultsInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::SearchResultsInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ErrorInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ErrorInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ArrayInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ArrayInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FunctionCallInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FunctionCallInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::CodeExecutorSecretInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::CodeExecutorSecretInput.from_json(json_object: struct)
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
        return Vellum::StringInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::JsonInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ChatHistoryInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NumberInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::SearchResultsInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ErrorInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ArrayInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FunctionCallInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::CodeExecutorSecretInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end