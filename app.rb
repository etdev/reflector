require "sinatra"
require "rack/contrib"
require "json"
require "pry"

class ReflectorApp < Sinatra::Base
  get '/' do
    set_headers
    print_request_data
  end

  post "/" do
    set_headers
    print_request_data
  end

  private

  def set_headers
    headers "Access-Control-Allow-Origin" => "*"
  end

  def print_request_data
    <<~BODY
      Method: #{request.env["REQUEST_METHOD"]}

      --

      Headers: #{JSON.pretty_generate(headers)}

      --

      Params: #{JSON.pretty_generate(params)}
    BODY
  end
end
