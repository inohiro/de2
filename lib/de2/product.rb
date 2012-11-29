
module DE2
  class Product

    attr_reader :url

    def initialize( url )
      @url = url
      @body = Nokogiri::HTML( open( self.url ) )
    end

    def star
      _get_star
    end

    private

    def _get_star
      res = @body.xpath( '//div[@class="gry txtnormal acrRating"]' )
      if res.length == 1
        match = res.first.inner_text.match( ' ' )
        match !=nil ? match.post_match.to_f : nil
      else
        nil
      end
    end

  end
end
