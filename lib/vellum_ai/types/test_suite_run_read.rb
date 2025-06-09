# frozen_string_literal: true
require "date"
require_relative "test_suite_run_test_suite"
require_relative "test_suite_run_state"
require_relative "test_suite_run_exec_config"
require_relative "test_suite_run_progress"
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunRead
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created
  # @return [Vellum::TestSuiteRunTestSuite] 
    attr_reader :test_suite
  # @return [Vellum::TestSuiteRunState] The current state of this run
#  * `QUEUED` - Queued
#  * `RUNNING` - Running
#  * `COMPLETE` - Complete
#  * `FAILED` - Failed
#  * `CANCELLED` - Cancelled
    attr_reader :state
  # @return [Vellum::TestSuiteRunExecConfig] Configuration that defines how the Test Suite should be run
    attr_reader :exec_config
  # @return [Vellum::TestSuiteRunProgress] 
    attr_reader :progress
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created [DateTime] 
    # @param test_suite [Vellum::TestSuiteRunTestSuite] 
    # @param state [Vellum::TestSuiteRunState] The current state of this run
#  * `QUEUED` - Queued
#  * `RUNNING` - Running
#  * `COMPLETE` - Complete
#  * `FAILED` - Failed
#  * `CANCELLED` - Cancelled
    # @param exec_config [Vellum::TestSuiteRunExecConfig] Configuration that defines how the Test Suite should be run
    # @param progress [Vellum::TestSuiteRunProgress] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunRead]
    def initialize(id: OMIT, created: OMIT, test_suite:, state:, exec_config: OMIT, progress: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @created = created if created != OMIT
      @test_suite = test_suite
      @state = state
      @exec_config = exec_config if exec_config != OMIT
      @progress = progress if progress != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created": created, "test_suite": test_suite, "state": state, "exec_config": exec_config, "progress": progress }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TestSuiteRunRead
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created = unless parsed_json["created"].nil?
  DateTime.parse(parsed_json["created"])
else
  nil
end
      unless parsed_json["test_suite"].nil?
        test_suite = parsed_json["test_suite"].to_json
        test_suite = Vellum::TestSuiteRunTestSuite.from_json(json_object: test_suite)
      else
        test_suite = nil
      end
      state = parsed_json["state"]
      unless parsed_json["exec_config"].nil?
        exec_config = parsed_json["exec_config"].to_json
        exec_config = Vellum::TestSuiteRunExecConfig.from_json(json_object: exec_config)
      else
        exec_config = nil
      end
      unless parsed_json["progress"].nil?
        progress = parsed_json["progress"].to_json
        progress = Vellum::TestSuiteRunProgress.from_json(json_object: progress)
      else
        progress = nil
      end
      new(
        id: id,
        created: created,
        test_suite: test_suite,
        state: state,
        exec_config: exec_config,
        progress: progress,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunRead to a JSON object
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
      obj.created&.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      Vellum::TestSuiteRunTestSuite.validate_raw(obj: obj.test_suite)
      obj.state.is_a?(Vellum::TestSuiteRunState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.exec_config.nil? || Vellum::TestSuiteRunExecConfig.validate_raw(obj: obj.exec_config)
      obj.progress.nil? || Vellum::TestSuiteRunProgress.validate_raw(obj: obj.progress)
    end
  end
end