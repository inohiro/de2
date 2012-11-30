# -*- coding: utf-8 -*-

$:.unshift File.join( File.dirname( __FILE__ ), './lib' )

require 'de2'
require 'pp'

def main

  url = 'http://www.amazon.co.jp/dp/B0067PGV1O/'

  product = DE2::Product.new( url )
  star = product.star
  products = product.similar_products

  tmp = products.dup
  products.each do |p|
    puts p[:title]
    np = DE2::Product.new( p[:url] )
    np_star = np.star
    p[:star] = np_star if np_star

    hoge = np.similar_products
    hoge.each do |h|
      nh = DE2::Product.new( h[:url] )
      nh_star = nh.star
      h[:star] = nh.star if nh_star
    end

    tmp << hoge
    tmp.flatten!
  end

  p '**********************************'
  pp tmp.sort_by { |e| e[:star] }.reverse.uniq.slice(0..5)
  puts tmp.size
end

main
