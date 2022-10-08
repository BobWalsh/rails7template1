class HomeController < ApplicationController
  require 'net/http'
  def index
    if current_user && current_user.zipcode.length >= 5

      @no_zipcode = ""
      zipcode = current_user.zipcode
      q ="https://api.weatherstack.com/current?access_key=438b623c8e56f25eaee02d77471cfc76&units=f&query=" + zipcode.to_s

      uri = URI(q)
      res = Net::HTTP.get_response(uri)
      @data = JSON.parse(res.body)
      @yest = (Date.today - 1.day).strftime
      @hist = "historical_date="+ @yest
      # @xxx = "https://api.weatherstack.com/historical?access_key=438b623c8e56f25eaee02d77471cfc76&units=f&query=94903&historical_date=2022-10-06"

      @qh = "https://api.weatherstack.com/historical?access_key=438b623c8e56f25eaee02d77471cfc76&units=f&query="+ zipcode.to_s + "&" + @hist
      @temp1 = @qh
      url3 = @qh
      uri3 = URI(url3)
      res3 = Net::HTTP.get_response(uri3)
      @data3 = JSON.parse(res3.body)
      # raise
    else
      @no_zipcode = "in Cupertino, CA"
      url = "https://api.weatherstack.com/current?access_key=438b623c8e56f25eaee02d77471cfc76&units=f&query=94903"
      uri = URI(url)
      res = Net::HTTP.get_response(uri)
      @data = JSON.parse(res.body)
      @hist = "historical_date="+ Date.yesterday.strftime
      @yest = Date.yesterday.strftime
      @temp1 = "https://api.weatherstack.com/historical?access_key=438b623c8e56f25eaee02d77471cfc76&units=f&query=Cupertino&" + @hist
      url3 = @temp1
      uri3 = URI(url3)
      res3 = Net::HTTP.get_response(uri3)
      @data3 = JSON.parse(res3.body)
      # raise
    end
  end
end
