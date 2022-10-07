class HomeController < ApplicationController
  require 'net/http'
  def index
    # url = "https://api.weatherstack.com/current?access_key=438b623c8e56f25eaee02d77471cfc76&query=New%20York"
    url = "https://api.weatherstack.com/current?access_key=438b623c8e56f25eaee02d77471cfc76&units=f&query=94903"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @data = JSON.parse(res.body)
    # puts JSON.pretty_generate(res.body)


    url2 = "https://api.weatherstack.com/historical?access_key=438b623c8e56f25eaee02d77471cfc76&units=94903&"
    uri2 = URI(url2)
    res2 = Net::HTTP.get_response(uri2)
    @data2 = JSON.parse(res2.body)

    @hist = "historical_date="+ Date.yesterday.strftime
    @yest = Date.yesterday.strftime
    @temp1 = "https://api.weatherstack.com/historical?access_key=438b623c8e56f25eaee02d77471cfc76&units=f&query=Quebec&" + @hist
    url3 = @temp1
    # url3 = "https://api.weatherstack.com/historical?access_key=438b623c8e56f25eaee02d77471cfc76&units=f&query=Quebec&" + hist
    uri3 = URI(url3)
    res3 = Net::HTTP.get_response(uri3)
    @data3 = JSON.parse(res3.body)
    # raise
    # puts JSON.pretty_generate(res3.body)
  end
end
