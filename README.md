# JSON to CSV Converter API

A simple Sinatra-based API for converting JSON data to CSV format.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Features

- Basic JSON to CSV conversion
- Input validation
- Authorization
- Error handling
- Environmental variable handling
- Logging
- Test suite

## Requirements

- Ruby >= 2.7
- Bundler

## Installation

1. Clone this repository:
  git clone https://github.com/TamasKerdo/json_to_csv_converter.git
  cd json_csv_converter_api

2. Install dependencies:
  bundle install


3. Configure environment variables in a `.env` file:
  cp .env.example .env


4. Run the application:
  bundle exec rackup

## Usage

1. Make a POST request to the `/convert` endpoint with the JSON data you want to convert to CSV:
Here is a sample README file for your Sinatra-based JSON to CSV converter API project. Modify it according to your specific project requirements.

# JSON to CSV Converter API

A simple Sinatra-based API for converting JSON data to CSV format.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Features

- Basic JSON to CSV conversion
- Input validation
- Authorization
- Error handling
- Environmental variable handling
- Logging
- Test suite

## Requirements

- Ruby >= 2.7
- Bundler

## Installation

1. Clone this repository:

  git clone https://github.com/yourusername/json_csv_converter_api.git
  cd json_csv_converter_api

2. Install dependencies:

  bundle install

3. Configure environment variables in a `.env` file:

  cp .env.example .env

4. Run the application:

  bundle exec rackup

## Usage

1. Make a POST request to the `/convert` endpoint with the JSON data you want to convert to CSV:

  curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer <your_access_token>" -d '{"data": [{"field1": "value1", "field2": "value2"}, {"field1": "value3", "field2": "value4"}]}' http://localhost:9292/convert


  Replace `<your_access_token>` with a valid access token.

2. If the request is successful, the API will return the converted CSV data.

## Testing

  To run the test suite, execute the following command:

  bundle exec rspec

## Contributing

1. Fork the repository on GitHub.
2. Create a branch for your changes.
3. Make your changes and add tests.
4. Run tests and ensure they pass.
5. Submit a pull request to the main repository.

## License

This project is released under the [MIT License](https://opensource.org/licenses/MIT).
