# frozen_string_literal: true

begin
  require 'pry'
rescue LoadError
  nil
end

require 'true-conf'
require 'webmock/rspec'

RSpec.configure do |config|
  config.order = :random
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.around(:each) do |example|
    stub_request(:any, //)
    example.run
  end
end
