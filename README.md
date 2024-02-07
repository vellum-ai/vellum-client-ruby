# Vellum Ruby Library

[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-SDK%20generated%20by%20Fern-brightgreen)](https://github.com/fern-api/fern)


The Vellum Ruby Library provides access to the Vellum API from Ruby.


## API Docs
You can find Vellum's complete API docs at [docs.vellum.ai](https://docs.vellum.ai).

## Installation

Install the gem and add to the application's Gemfile by executing:

```sh
bundle add vellum_ai
```

If bundler is not being used to manage dependencies, install the gem by executing:

```sh
gem install vellum_ai
```

## Usage

```ruby
require "vellum_ai"


client = Vellum::Client.new(api_key: "YOUR_API_KEY")

result = client.generate(
    deployment_name: "my-deployment",
    requests=[{
        input_values: [{"question": "Can I get a refund?"}]
    }]
)

puts result.text
```

## Async Client

```ruby
require "vellum_ai"


client = Vellum::AsyncClient.new(api_key: "YOUR_API_KEY")

result = client.generate(
    deployment_name: "my-deployment",
    requests=[{
        input_values: {"question": "Can I get a refund?"}
    }]
)

puts result.wait.text
```

## Uploading documents

Documents can be uploaded to Vellum via either the UI or this API. Once uploaded and indexed, Vellum's Search allows you to perform semantic searches against them. Not that the SDK allows you to pass in a path to the file, or a File object.

```ruby
require "vellum_ai"


client = Vellum::Client.new(api_key: "YOUR_API_KEY")
result = client.documents.upload(
    # File to upload
    contents: "/path/to/your/file.txt",
    # Document label
    label: "Human-friendly label for your document",
    # The names of indexes that you'd like this document to be added to.
    add_to_index_names: ["<your-index-name>"],
    # Optionally include a unique ID from your system to this document later.
    #   Useful if you want to perform updates later
    external_id: "<your-index-name>",
    # Optionally include keywords to associate with the document that can be used in hybrid search
    keywords: [],
)

puts result
```

## Beta status

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore, we recommend pinning the package version to a specific version in your pyproject.toml file. This way, you can install the same version each time without breaking changes unless you are intentionally looking for the latest version.

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically. Additions made directly to this library would have to be moved over to our generation code, otherwise they would be overwritten upon the next generated release. Feel free to open a PR as a proof of concept, but know that we will not be able to merge it as-is. We suggest opening an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
