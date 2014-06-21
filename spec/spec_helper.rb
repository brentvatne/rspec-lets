require 'pry'
require 'rspec'

require_relative '../lib/rspec-lets/helper'

RSpec.configure do |c|
  c.extend RSpecLets::Helper
end
