# frozen_string_literal: true

require_relative "vellum_ai/deployments/types/deployments_list_request_status"
require_relative "vellum_ai/document_indexes/types/document_indexes_list_request_status"
require_relative "vellum_ai/workflow_deployments/types/workflow_deployments_list_request_status"
require_relative "vellum_ai/types/api_node_result"
require_relative "vellum_ai/types/api_node_result_data"
require_relative "vellum_ai/types/array_chat_message_content"
require_relative "vellum_ai/types/array_chat_message_content_item"
require_relative "vellum_ai/types/array_chat_message_content_item_request"
require_relative "vellum_ai/types/array_chat_message_content_request"
require_relative "vellum_ai/types/array_enum"
require_relative "vellum_ai/types/array_variable_value_item"
require_relative "vellum_ai/types/block_type_enum"
require_relative "vellum_ai/types/chat_history_enum"
require_relative "vellum_ai/types/chat_history_input_request"
require_relative "vellum_ai/types/chat_history_variable_value"
require_relative "vellum_ai/types/chat_message"
require_relative "vellum_ai/types/chat_message_content"
require_relative "vellum_ai/types/chat_message_content_request"
require_relative "vellum_ai/types/chat_message_request"
require_relative "vellum_ai/types/chat_message_role"
require_relative "vellum_ai/types/code_execution_node_chat_history_result"
require_relative "vellum_ai/types/code_execution_node_error_result"
require_relative "vellum_ai/types/code_execution_node_json_result"
require_relative "vellum_ai/types/code_execution_node_number_result"
require_relative "vellum_ai/types/code_execution_node_result"
require_relative "vellum_ai/types/code_execution_node_result_data"
require_relative "vellum_ai/types/code_execution_node_result_output"
require_relative "vellum_ai/types/code_execution_node_search_results_result"
require_relative "vellum_ai/types/code_execution_node_string_result"
require_relative "vellum_ai/types/conditional_node_result"
require_relative "vellum_ai/types/conditional_node_result_data"
require_relative "vellum_ai/types/deployment_provider_payload_response"
require_relative "vellum_ai/types/deployment_read"
require_relative "vellum_ai/types/document_document_to_document_index"
require_relative "vellum_ai/types/document_index_read"
require_relative "vellum_ai/types/document_read"
require_relative "vellum_ai/types/document_status"
require_relative "vellum_ai/types/enriched_normalized_completion"
require_relative "vellum_ai/types/entity_status"
require_relative "vellum_ai/types/environment_enum"
require_relative "vellum_ai/types/error_enum"
require_relative "vellum_ai/types/error_variable_value"
require_relative "vellum_ai/types/execute_prompt_api_error_response"
require_relative "vellum_ai/types/execute_prompt_event"
require_relative "vellum_ai/types/execute_prompt_response"
require_relative "vellum_ai/types/execute_workflow_error_response"
require_relative "vellum_ai/types/execute_workflow_response"
require_relative "vellum_ai/types/execute_workflow_stream_error_response"
require_relative "vellum_ai/types/execute_workflow_workflow_result_event"
require_relative "vellum_ai/types/finish_reason_enum"
require_relative "vellum_ai/types/fulfilled_enum"
require_relative "vellum_ai/types/fulfilled_execute_prompt_event"
require_relative "vellum_ai/types/fulfilled_execute_prompt_response"
require_relative "vellum_ai/types/fulfilled_execute_workflow_workflow_result_event"
require_relative "vellum_ai/types/fulfilled_function_call"
require_relative "vellum_ai/types/fulfilled_prompt_execution_meta"
require_relative "vellum_ai/types/fulfilled_workflow_node_result_event"
require_relative "vellum_ai/types/function_call"
require_relative "vellum_ai/types/function_call_chat_message_content"
require_relative "vellum_ai/types/function_call_chat_message_content_request"
require_relative "vellum_ai/types/function_call_chat_message_content_value"
require_relative "vellum_ai/types/function_call_chat_message_content_value_request"
require_relative "vellum_ai/types/function_call_enum"
require_relative "vellum_ai/types/function_call_variable_value"
require_relative "vellum_ai/types/generate_error_response"
require_relative "vellum_ai/types/generate_options_request"
require_relative "vellum_ai/types/generate_request"
require_relative "vellum_ai/types/generate_response"
require_relative "vellum_ai/types/generate_result"
require_relative "vellum_ai/types/generate_result_data"
require_relative "vellum_ai/types/generate_result_error"
require_relative "vellum_ai/types/generate_stream_response"
require_relative "vellum_ai/types/generate_stream_result"
require_relative "vellum_ai/types/generate_stream_result_data"
require_relative "vellum_ai/types/image_chat_message_content"
require_relative "vellum_ai/types/image_chat_message_content_request"
require_relative "vellum_ai/types/image_enum"
require_relative "vellum_ai/types/indexing_state_enum"
require_relative "vellum_ai/types/initiated_enum"
require_relative "vellum_ai/types/initiated_execute_prompt_event"
require_relative "vellum_ai/types/initiated_prompt_execution_meta"
require_relative "vellum_ai/types/initiated_workflow_node_result_event"
require_relative "vellum_ai/types/json_input_request"
require_relative "vellum_ai/types/json_enum"
require_relative "vellum_ai/types/json_variable_value"
require_relative "vellum_ai/types/logical_operator"
require_relative "vellum_ai/types/logprobs_enum"
require_relative "vellum_ai/types/metadata_filter_config_request"
require_relative "vellum_ai/types/metadata_filter_rule_combinator"
require_relative "vellum_ai/types/metadata_filter_rule_request"
require_relative "vellum_ai/types/model_version_build_config"
require_relative "vellum_ai/types/model_version_exec_config"
require_relative "vellum_ai/types/model_version_exec_config_parameters"
require_relative "vellum_ai/types/model_version_read"
require_relative "vellum_ai/types/model_version_read_status_enum"
require_relative "vellum_ai/types/model_version_sandbox_snapshot"
require_relative "vellum_ai/types/named_test_case_chat_history_variable_value_request"
require_relative "vellum_ai/types/named_test_case_error_variable_value_request"
require_relative "vellum_ai/types/named_test_case_json_variable_value_request"
require_relative "vellum_ai/types/named_test_case_number_variable_value_request"
require_relative "vellum_ai/types/named_test_case_search_results_variable_value_request"
require_relative "vellum_ai/types/named_test_case_string_variable_value_request"
require_relative "vellum_ai/types/named_test_case_variable_value_request"
require_relative "vellum_ai/types/node_input_compiled_array_value"
require_relative "vellum_ai/types/node_input_compiled_chat_history_value"
require_relative "vellum_ai/types/node_input_compiled_error_value"
require_relative "vellum_ai/types/node_input_compiled_json_value"
require_relative "vellum_ai/types/node_input_compiled_number_value"
require_relative "vellum_ai/types/node_input_compiled_search_results_value"
require_relative "vellum_ai/types/node_input_compiled_string_value"
require_relative "vellum_ai/types/node_input_variable_compiled_value"
require_relative "vellum_ai/types/node_output_compiled_array_value"
require_relative "vellum_ai/types/node_output_compiled_chat_history_value"
require_relative "vellum_ai/types/node_output_compiled_error_value"
require_relative "vellum_ai/types/node_output_compiled_function_value"
require_relative "vellum_ai/types/node_output_compiled_json_value"
require_relative "vellum_ai/types/node_output_compiled_number_value"
require_relative "vellum_ai/types/node_output_compiled_search_results_value"
require_relative "vellum_ai/types/node_output_compiled_string_value"
require_relative "vellum_ai/types/node_output_compiled_value"
require_relative "vellum_ai/types/normalized_log_probs"
require_relative "vellum_ai/types/normalized_token_log_probs"
require_relative "vellum_ai/types/number_enum"
require_relative "vellum_ai/types/number_variable_value"
require_relative "vellum_ai/types/paginated_document_index_read_list"
require_relative "vellum_ai/types/paginated_slim_deployment_read_list"
require_relative "vellum_ai/types/paginated_slim_document_list"
require_relative "vellum_ai/types/paginated_slim_workflow_deployment_list"
require_relative "vellum_ai/types/processing_failure_reason_enum"
require_relative "vellum_ai/types/processing_state_enum"
require_relative "vellum_ai/types/prompt_deployment_expand_meta_request_request"
require_relative "vellum_ai/types/prompt_deployment_input_request"
require_relative "vellum_ai/types/prompt_execution_meta"
require_relative "vellum_ai/types/prompt_node_result"
require_relative "vellum_ai/types/prompt_node_result_data"
require_relative "vellum_ai/types/prompt_output"
require_relative "vellum_ai/types/prompt_template_block"
require_relative "vellum_ai/types/prompt_template_block_data"
require_relative "vellum_ai/types/prompt_template_block_data_request"
require_relative "vellum_ai/types/prompt_template_block_properties"
require_relative "vellum_ai/types/prompt_template_block_properties_request"
require_relative "vellum_ai/types/prompt_template_block_request"
require_relative "vellum_ai/types/provider_enum"
require_relative "vellum_ai/types/raw_prompt_execution_overrides_request"
require_relative "vellum_ai/types/register_prompt_error_response"
require_relative "vellum_ai/types/register_prompt_model_parameters_request"
require_relative "vellum_ai/types/register_prompt_prompt"
require_relative "vellum_ai/types/register_prompt_prompt_info_request"
require_relative "vellum_ai/types/register_prompt_response"
require_relative "vellum_ai/types/registered_prompt_deployment"
require_relative "vellum_ai/types/registered_prompt_input_variable_request"
require_relative "vellum_ai/types/registered_prompt_model_version"
require_relative "vellum_ai/types/registered_prompt_sandbox"
require_relative "vellum_ai/types/registered_prompt_sandbox_snapshot"
require_relative "vellum_ai/types/rejected_enum"
require_relative "vellum_ai/types/rejected_execute_prompt_event"
require_relative "vellum_ai/types/rejected_execute_prompt_response"
require_relative "vellum_ai/types/rejected_execute_workflow_workflow_result_event"
require_relative "vellum_ai/types/rejected_function_call"
require_relative "vellum_ai/types/rejected_prompt_execution_meta"
require_relative "vellum_ai/types/rejected_workflow_node_result_event"
require_relative "vellum_ai/types/sandbox_scenario"
require_relative "vellum_ai/types/scenario_input"
require_relative "vellum_ai/types/scenario_input_request"
require_relative "vellum_ai/types/scenario_input_type_enum"
require_relative "vellum_ai/types/search_error_response"
require_relative "vellum_ai/types/search_filters_request"
require_relative "vellum_ai/types/search_node_result"
require_relative "vellum_ai/types/search_node_result_data"
require_relative "vellum_ai/types/search_request_options_request"
require_relative "vellum_ai/types/search_response"
require_relative "vellum_ai/types/search_result"
require_relative "vellum_ai/types/search_result_document"
require_relative "vellum_ai/types/search_result_document_request"
require_relative "vellum_ai/types/search_result_merging_request"
require_relative "vellum_ai/types/search_result_request"
require_relative "vellum_ai/types/search_results_enum"
require_relative "vellum_ai/types/search_results_variable_value"
require_relative "vellum_ai/types/search_weights_request"
require_relative "vellum_ai/types/slim_deployment_read"
require_relative "vellum_ai/types/slim_document"
require_relative "vellum_ai/types/slim_workflow_deployment"
require_relative "vellum_ai/types/streaming_enum"
require_relative "vellum_ai/types/streaming_execute_prompt_event"
require_relative "vellum_ai/types/streaming_prompt_execution_meta"
require_relative "vellum_ai/types/streaming_workflow_node_result_event"
require_relative "vellum_ai/types/string_chat_message_content"
require_relative "vellum_ai/types/string_chat_message_content_request"
require_relative "vellum_ai/types/string_enum"
require_relative "vellum_ai/types/string_input_request"
require_relative "vellum_ai/types/string_variable_value"
require_relative "vellum_ai/types/submit_completion_actual_request"
require_relative "vellum_ai/types/submit_completion_actuals_error_response"
require_relative "vellum_ai/types/submit_workflow_execution_actual_request"
require_relative "vellum_ai/types/subworkflow_enum"
require_relative "vellum_ai/types/subworkflow_node_result"
require_relative "vellum_ai/types/templating_node_chat_history_result"
require_relative "vellum_ai/types/templating_node_error_result"
require_relative "vellum_ai/types/templating_node_json_result"
require_relative "vellum_ai/types/templating_node_number_result"
require_relative "vellum_ai/types/templating_node_result"
require_relative "vellum_ai/types/templating_node_result_data"
require_relative "vellum_ai/types/templating_node_result_output"
require_relative "vellum_ai/types/templating_node_search_results_result"
require_relative "vellum_ai/types/templating_node_string_result"
require_relative "vellum_ai/types/terminal_node_array_result"
require_relative "vellum_ai/types/terminal_node_chat_history_result"
require_relative "vellum_ai/types/terminal_node_error_result"
require_relative "vellum_ai/types/terminal_node_function_call_result"
require_relative "vellum_ai/types/terminal_node_json_result"
require_relative "vellum_ai/types/terminal_node_number_result"
require_relative "vellum_ai/types/terminal_node_result"
require_relative "vellum_ai/types/terminal_node_result_data"
require_relative "vellum_ai/types/terminal_node_result_output"
require_relative "vellum_ai/types/terminal_node_search_results_result"
require_relative "vellum_ai/types/terminal_node_string_result"
require_relative "vellum_ai/types/test_case_chat_history_variable_value"
require_relative "vellum_ai/types/test_case_error_variable_value"
require_relative "vellum_ai/types/test_case_json_variable_value"
require_relative "vellum_ai/types/test_case_number_variable_value"
require_relative "vellum_ai/types/test_case_search_results_variable_value"
require_relative "vellum_ai/types/test_case_string_variable_value"
require_relative "vellum_ai/types/test_case_variable_value"
require_relative "vellum_ai/types/test_suite_test_case"
require_relative "vellum_ai/types/upload_document_error_response"
require_relative "vellum_ai/types/upload_document_response"
require_relative "vellum_ai/types/vellum_error"
require_relative "vellum_ai/types/vellum_error_code_enum"
require_relative "vellum_ai/types/vellum_error_request"
require_relative "vellum_ai/types/vellum_image"
require_relative "vellum_ai/types/vellum_image_request"
require_relative "vellum_ai/types/vellum_variable"
require_relative "vellum_ai/types/vellum_variable_type"
require_relative "vellum_ai/types/workflow_deployment_read"
require_relative "vellum_ai/types/workflow_event_error"
require_relative "vellum_ai/types/workflow_execution_actual_chat_history_request"
require_relative "vellum_ai/types/workflow_execution_actual_json_request"
require_relative "vellum_ai/types/workflow_execution_actual_string_request"
require_relative "vellum_ai/types/workflow_execution_event_error_code"
require_relative "vellum_ai/types/workflow_execution_event_type"
require_relative "vellum_ai/types/workflow_execution_node_result_event"
require_relative "vellum_ai/types/workflow_execution_workflow_result_event"
require_relative "vellum_ai/types/workflow_node_result_data"
require_relative "vellum_ai/types/workflow_node_result_event"
require_relative "vellum_ai/types/workflow_node_result_event_state"
require_relative "vellum_ai/types/workflow_output"
require_relative "vellum_ai/types/workflow_output_array"
require_relative "vellum_ai/types/workflow_output_chat_history"
require_relative "vellum_ai/types/workflow_output_error"
require_relative "vellum_ai/types/workflow_output_function_call"
require_relative "vellum_ai/types/workflow_output_image"
require_relative "vellum_ai/types/workflow_output_json"
require_relative "vellum_ai/types/workflow_output_number"
require_relative "vellum_ai/types/workflow_output_search_results"
require_relative "vellum_ai/types/workflow_output_string"
require_relative "vellum_ai/types/workflow_request_chat_history_input_request"
require_relative "vellum_ai/types/workflow_request_input_request"
require_relative "vellum_ai/types/workflow_request_json_input_request"
require_relative "vellum_ai/types/workflow_request_number_input_request"
require_relative "vellum_ai/types/workflow_request_string_input_request"
require_relative "vellum_ai/types/workflow_result_event"
require_relative "vellum_ai/types/workflow_result_event_output_data"
require_relative "vellum_ai/types/workflow_result_event_output_data_array"
require_relative "vellum_ai/types/workflow_result_event_output_data_chat_history"
require_relative "vellum_ai/types/workflow_result_event_output_data_error"
require_relative "vellum_ai/types/workflow_result_event_output_data_function_call"
require_relative "vellum_ai/types/workflow_result_event_output_data_json"
require_relative "vellum_ai/types/workflow_result_event_output_data_number"
require_relative "vellum_ai/types/workflow_result_event_output_data_search_results"
require_relative "vellum_ai/types/workflow_result_event_output_data_string"
require_relative "vellum_ai/types/workflow_stream_event"
