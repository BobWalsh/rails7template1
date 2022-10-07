class HomeController < ApplicationController
  require 'net/http'
  def index
    url = "https://api.weatherstack.com/current?access_key=438b623c8e56f25eaee02d77471cfc76&query=New%20York"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @data = JSON.parse(res.body)
    puts JSON.pretty_generate(res.body)
  end
end
