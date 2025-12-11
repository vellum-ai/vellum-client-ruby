# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/paginated_container_image_read_list"
require_relative "../types/code_execution_package_request"
require_relative "../types/container_image_read"
require_relative "../types/docker_service_token"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class ContainerImagesClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::ContainerImagesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve a list of container images for the organization.
    #
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedContainerImageReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.list
    def list(limit: nil, offset: nil, ordering: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images"
end
      Vellum::PaginatedContainerImageReadList.from_json(json_object: response.body)
    end
# Create a new Container Image.
    #
    # @param name [String] 
    # @param packages [Array<Hash>] Request of type Array<Vellum::CodeExecutionPackageRequest>, as a Hash
    #   * :version (String) 
    #   * :name (String) 
    #   * :repository (String) 
    # @param tag [String] 
    # @param user_script [String] 
    # @param is_hotswappable [Boolean] 
    # @param server_version [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ContainerImageRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.create_container_image(
#    name: "x",
#    packages: [{ version: "x", name: "x" }, { version: "x", name: "x" }],
#    tag: "x"
#  )
    def create_container_image(name:, packages:, tag:, user_script: nil, is_hotswappable: nil, server_version: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, packages: packages, tag: tag, user_script: user_script, is_hotswappable: is_hotswappable, server_version: server_version }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images"
end
      Vellum::ContainerImageRead.from_json(json_object: response.body)
    end
# Retrieve a Container Image by its ID or name.
    #
    # @param id [String] Either the Container Image's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ContainerImageRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.retrieve(id: "id")
    def retrieve(id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images/#{id}"
end
      Vellum::ContainerImageRead.from_json(json_object: response.body)
    end
# Update an existing Container Image.
    #
    # @param id [String] A UUID string identifying this container image.
    # @param packages [Array<Hash>] Request of type Array<Vellum::CodeExecutionPackageRequest>, as a Hash
    #   * :version (String) 
    #   * :name (String) 
    #   * :repository (String) 
    # @param tag [String] 
    # @param user_script [String] 
    # @param is_hotswappable [Boolean] 
    # @param server_version [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ContainerImageRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.update_container_image(
#    id: "id",
#    packages: [{ version: "x", name: "x" }, { version: "x", name: "x" }],
#    tag: "x"
#  )
    def update_container_image(id:, packages:, tag:, user_script: nil, is_hotswappable: nil, server_version: nil, request_options: nil)
      response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), packages: packages, tag: tag, user_script: user_script, is_hotswappable: is_hotswappable, server_version: server_version }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images/#{id}"
end
      Vellum::ContainerImageRead.from_json(json_object: response.body)
    end
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DockerServiceToken]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.docker_service_token
    def docker_service_token(request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images/docker-service-token"
end
      Vellum::DockerServiceToken.from_json(json_object: response.body)
    end
    # @param name [String] 
    # @param sha [String] 
    # @param tags [Array<String>] 
    # @param force [Boolean] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ContainerImageRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.push_container_image(
#    name: "x",
#    sha: "x",
#    tags: ["tags", "tags"]
#  )
    def push_container_image(name:, sha:, tags:, force: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, sha: sha, tags: tags, force: force }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images/push"
end
      Vellum::ContainerImageRead.from_json(json_object: response.body)
    end
  end
  class AsyncContainerImagesClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncContainerImagesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve a list of container images for the organization.
    #
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedContainerImageReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.list
    def list(limit: nil, offset: nil, ordering: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images"
end
        Vellum::PaginatedContainerImageReadList.from_json(json_object: response.body)
      end
    end
# Create a new Container Image.
    #
    # @param name [String] 
    # @param packages [Array<Hash>] Request of type Array<Vellum::CodeExecutionPackageRequest>, as a Hash
    #   * :version (String) 
    #   * :name (String) 
    #   * :repository (String) 
    # @param tag [String] 
    # @param user_script [String] 
    # @param is_hotswappable [Boolean] 
    # @param server_version [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ContainerImageRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.create_container_image(
#    name: "x",
#    packages: [{ version: "x", name: "x" }, { version: "x", name: "x" }],
#    tag: "x"
#  )
    def create_container_image(name:, packages:, tag:, user_script: nil, is_hotswappable: nil, server_version: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, packages: packages, tag: tag, user_script: user_script, is_hotswappable: is_hotswappable, server_version: server_version }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images"
end
        Vellum::ContainerImageRead.from_json(json_object: response.body)
      end
    end
# Retrieve a Container Image by its ID or name.
    #
    # @param id [String] Either the Container Image's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ContainerImageRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.retrieve(id: "id")
    def retrieve(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images/#{id}"
end
        Vellum::ContainerImageRead.from_json(json_object: response.body)
      end
    end
# Update an existing Container Image.
    #
    # @param id [String] A UUID string identifying this container image.
    # @param packages [Array<Hash>] Request of type Array<Vellum::CodeExecutionPackageRequest>, as a Hash
    #   * :version (String) 
    #   * :name (String) 
    #   * :repository (String) 
    # @param tag [String] 
    # @param user_script [String] 
    # @param is_hotswappable [Boolean] 
    # @param server_version [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ContainerImageRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.update_container_image(
#    id: "id",
#    packages: [{ version: "x", name: "x" }, { version: "x", name: "x" }],
#    tag: "x"
#  )
    def update_container_image(id:, packages:, tag:, user_script: nil, is_hotswappable: nil, server_version: nil, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), packages: packages, tag: tag, user_script: user_script, is_hotswappable: is_hotswappable, server_version: server_version }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images/#{id}"
end
        Vellum::ContainerImageRead.from_json(json_object: response.body)
      end
    end
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DockerServiceToken]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.docker_service_token
    def docker_service_token(request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images/docker-service-token"
end
        Vellum::DockerServiceToken.from_json(json_object: response.body)
      end
    end
    # @param name [String] 
    # @param sha [String] 
    # @param tags [Array<String>] 
    # @param force [Boolean] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ContainerImageRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.container_images.push_container_image(
#    name: "x",
#    sha: "x",
#    tags: ["tags", "tags"]
#  )
    def push_container_image(name:, sha:, tags:, force: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, sha: sha, tags: tags, force: force }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/container-images/push"
end
        Vellum::ContainerImageRead.from_json(json_object: response.body)
      end
    end
  end
end