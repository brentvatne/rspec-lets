require 'pry'
require 'rspec'

require_relative '../lib/rspec_lets_helper'

RSpec.configure do |c|
  c.extend RSpecLetsHelper
end
