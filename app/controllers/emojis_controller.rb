require 'net/http'

class EmojisController < ActionController::Base
  def index
    uri = URI('https://api.github.com/emojis')
    res = Net::HTTP.get_response(uri)
    @json = JSON.parse(res.body)
  end
end
