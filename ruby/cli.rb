require_relative 'config'
require 'optparse'
require 'ostruct'
require 'json'

class Cli
  REQUIRED_PARAMS = {
    cancel: %i(import_id),
    create: %i(),
    get_by_id: %i(import_id),
    get_page: %i(),
  }.freeze

  def initialize(options)
    @options = options
    @method = options[:method]&.to_sym
  end

  def run
    validate
    call_api
  end

  private

  attr_reader :options, :method

  def validate
    raise(ArgumentError, 'Please, provide method to call with -m or --method') unless method
    missing_params = REQUIRED_PARAMS[method] - options.to_h.keys
    raise(ArgumentError,"Please, provide missing params #{missing_params} for the method. Use help (-h) if you need.")if missing_params.any?
  end

  def call_api
    client = Hubspot::Client.new(access_token: access_token)
    api = client.crm.imports.core_api
    api.public_send(method, params)
  end

  def params
    request = {}
    request[:files]= file
    request[:import_request] = import_request if method == :create
    request
  end

  def import_request
    {
      "name": "test_import",
      "files": [
        {
          "fileName": options[:csv_filename],
          "fileImportPage": {
            "hasHeader": true,
            "columnMappings": options[:column_mapping]
          }
        }
      ]
    }.to_json
  end

  def file
    File.open(options[:csv_filename])
  end
end

options = OpenStruct.new
OptionParser.new do |opt|
  opt.on('-m', '--method METHOD', 'Method to run') { |o| options.method = o }
  opt.on('-i', '--id ID', 'The id of import') { |o| options.import_id = o }
  opt.on('-f', '--file FILE', 'CSV filename') { |o| options.csv_filename = o }
  opt.on('-c', '--column COLUMN', 'Column mapping config') { |o| options.column_mapping = JSON.parse(o) }
  opt.on('-o', '--options OPTIONS', 'Options to pass') { |o| options.opts = JSON.parse(o) }
end.parse!

p Cli.new(options).run
