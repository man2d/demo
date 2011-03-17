$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rspec'
require 'rspec/autorun'
require 'prawn'
require 'howrah'
require 'kmandrup-colorist'        
require 'nokogiri'
require 'html_css_decorator'

Rspec.configure do |c|
  c.mock_with :mocha
end