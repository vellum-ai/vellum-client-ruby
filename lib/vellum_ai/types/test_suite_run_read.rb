# frozen_string_literal: true

require "date"
require_relative "test_suite_run_test_suite"
require_relative "test_suite_run_state"
require_relative "test_suite_run_exec_config"
require "json"

module Vellum
  class TestSuiteRunRead
    attr_reader :id, :created, :test_suite, :state, :exec_config, :additional_properties

    # @param id [String]
    # @param created [DateTime]
    # @param test_suite [TestSuiteRunTestSuite]
    # @param state [TEST_SUITE_RUN_STATE] The current state of this run
    #   - `QUEUED` - Queued
    #   - `RUNNING` - Running
    #   - `COMPLETE` - Complete
    #   - `FAILED` - Failed
    #   - `CANCELLED` - Cancelled
    # @param exec_config [TestSuiteRunExecConfig] Configuration that defines how the Test Suite should be run
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunRead]
    def initialize(id:, created:, test_suite:, state: nil, exec_config: nil, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [DateTime]
      @created = created
      # @type [TestSuiteRunTestSuite]
      @test_suite = test_suite
      # @type [TEST_SUITE_RUN_STATE] The current state of this run
      #   - `QUEUED` - Queued
      #   - `RUNNING` - Running
      #   - `COMPLETE` - Complete
      #   - `FAILED` - Failed
      #   - `CANCELLED` - Cancelled
      @state = state
      # @type [TestSuiteRunExecConfig] Configuration that defines how the Test Suite should be run
      @exec_config = exec_config
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunRead
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      created = DateTime.parse(parsed_json["created"])
      if parsed_json["test_suite"].nil?
        test_suite = nil
      else
        test_suite = parsed_json["test_suite"].to_json
        test_suite = TestSuiteRunTestSuite.from_json(json_object: test_suite)
      end
      state = TEST_SUITE_RUN_STATE.key(parsed_json["state"]) || parsed_json["state"]
      if parsed_json["exec_config"].nil?
        exec_config = nil
      else
        exec_config = parsed_json["exec_config"].to_json
        exec_config = TestSuiteRunExecConfig.from_json(json_object: exec_config)
      end
      new(id: id, created: created, test_suite: test_suite, state: state, exec_config: exec_config,
          additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunRead to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "created": @created,
        "test_suite": @test_suite,
        "state": TEST_SUITE_RUN_STATE[@state] || @state,
        "exec_config": @exec_config
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      TestSuiteRunTestSuite.validate_raw(obj: obj.test_suite)
      obj.state&.is_a?(TEST_SUITE_RUN_STATE) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.exec_config.nil? || TestSuiteRunExecConfig.validate_raw(obj: obj.exec_config)
    end
  end
end
