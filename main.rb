require 'rest-client'
require 'nokogiri'

def main
  url = 'http://www.amazon.co.jp/dp/B008O0WZL0/'
  response = RestClient.get( url )
  require 'pp'
  pp response
end

main
