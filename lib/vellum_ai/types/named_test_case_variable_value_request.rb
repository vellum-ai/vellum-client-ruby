# frozen_string_literal: true
require "json"
require_relative "named_test_case_string_variable_value_request"
require_relative "named_test_case_number_variable_value_request"
require_relative "named_test_case_json_variable_value_request"
require_relative "named_test_case_chat_history_variable_value_request"
require_relative "named_test_case_search_results_variable_value_request"
require_relative "named_test_case_error_variable_value_request"
require_relative "named_test_case_function_call_variable_value_request"
require_relative "named_test_case_array_variable_value_request"
require_relative "named_test_case_audio_variable_value_request"
require_relative "named_test_case_video_variable_value_request"
require_relative "named_test_case_image_variable_value_request"
require_relative "named_test_case_document_variable_value_request"

module Vellum
  class NamedTestCaseVariableValueRequest


# Deserialize a JSON object to an instance of NamedTestCaseVariableValueRequest
    #
    # @param json_object [String] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::NamedTestCaseStringVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseStringVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseNumberVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseNumberVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseJsonVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseJsonVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseChatHistoryVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseChatHistoryVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseSearchResultsVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseSearchResultsVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseErrorVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseErrorVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseFunctionCallVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseFunctionCallVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseArrayVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseArrayVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseAudioVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseAudioVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseVideoVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseVideoVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseImageVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseImageVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseDocumentVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseDocumentVariableValueRequest.from_json(json_object: struct)
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
        return Vellum::NamedTestCaseStringVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseNumberVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseJsonVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseChatHistoryVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseSearchResultsVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseErrorVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseFunctionCallVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseArrayVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseAudioVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseVideoVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseImageVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseDocumentVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end