
module DE2
  class Product

    USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8)
    AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.75
    Safari/535.7"

    attr_reader :url, :star

    def initialize( url )
      @url = url
      @body = Nokogiri::HTML( open( self.url,"User-Agent" => USER_AGENT ) )
      @star = _get_star
    end

    def similar_products
      products = @body.xpath( '//*[@class="acc-product"]' )
      puts "products.size: #{products.size}"
      if products.size >= 1
        ary = []
        products.each do |product|
          ary << _get_url( product )
        end
        ary
      else
        []
      end
    end

    private

    def _get_url( product )
      a = product.xpath( 'a' ).first
      url = a.xpath( '@href' ).first.value
      title = a.xpath( '@title' ).first.value
      { :title => title, :url => url, :star => 0.0 }
    end

    def _get_sim_products

    end

    def _get_star
      res = @body.xpath( '//div[@class="gry txtnormal acrRating"]' )
      if res.size == 1
        match = res.first.inner_text.match( ' ' )
        match !=nil ? match.post_match.to_f : nil
      else
        nil
      end
    end

  end
end
