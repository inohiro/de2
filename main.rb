# -*- coding: utf-8 -*-

$:.unshift File.join( File.dirname( __FILE__ ), './lib' )

require 'de2'
require 'pp'

def main
  id  = 'B009C6W1PA'
#  url = 'http://www.amazon.co.jp/dp/B007G3SW86/'
  url = 'http://www.amazon.co.jp/dp/B009C6W1PA'

  product = DE2::Product.new( url )
  star = product.star

  pp star


end

main
