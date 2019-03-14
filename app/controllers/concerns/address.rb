module Address
  extend ActiveSupport::Concern
  included do

    def post_api
      require 'net/http'
      require 'uri'
      require "json"
      main_url = "http://zipcloud.ibsnet.co.jp/api/search?zipcode="
      entry_url = @area.zipcode
      new_url = main_url + entry_url
      res = Net::HTTP.get(URI.parse((new_url)))
      hash = JSON.parse(res)
      @area.zipcode = hash["results"][0]["zipcode"]
      @area.prefcode = hash["results"][0]["prefcode"]
      @area.address1 = hash["results"][0]["address1"]
      @area.address2 = hash["results"][0]["address2"]
      @area.address3 = hash["results"][0]["address3"]
      @area.kana1 = hash["results"][0]["kana1"]
      @area.kana2 = hash["results"][0]["kana2"]
      @area.kana3 = hash["results"][0]["kana3"]
      @area.status = hash["status"]
    end
  end
end