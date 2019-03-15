module Address

  def post_api
    require 'net/http'
    require 'uri'
    require "json"
    main_url = "http://zipcloud.ibsnet.co.jp/api/search?zipcode="
    entry_url = @area.zipcode
    new_url = main_url + entry_url
    begin
      res = Net::HTTP.get(URI.parse(new_url))
      if JSON.parse(res)["status"] == 400
        flash.now[:alert] = JSON.parse(res)["message"]
        @area.zipcode = nil
        render :new
      else
        hash = JSON.parse(res)
        @area.zipcode = hash["results"][0]["zipcode"]
        @area.prefcode = hash["results"][0]["prefcode"]
        @area.address1 = hash["results"][0]["address1"]
        @area.address2 = hash["results"][0]["address2"]
        @area.address3 = hash["results"][0]["address3"]
        @area.kana1 = hash["results"][0]["kana1"]
        @area.kana2 = hash["results"][0]["kana2"]
        @area.kana3 = hash["results"][0]["kana3"]     
        render action: :edit
      end
    rescue => e
      flash.now[:alert] = "パラメーターが不正です。"
      @area.zipcode = nil
      render :new
    end
  end
end