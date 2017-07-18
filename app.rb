require "sinatra"
require "rack/contrib"
require "json"
require "pry"

class ReflectorApp < Sinatra::Base
  get '/' do
    set_response_headers
    print_request_data
  end

  post "/" do
    set_response_headers
    print_request_data
  end

  private

  def set_response_headers
    headers "Access-Control-Allow-Origin" => "*"
    headers "Content-Type" => "application/json"
  end

  def print_request_data
    JSON.pretty_generate({
      method: request.env["REQUEST_METHOD"],
      response_headers: headers,
      params: params,
      env: request.env
    })
  end
end
