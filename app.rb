require "sinatra"
require "json"

class ReflectorApp < Sinatra::Base
  get '/' do
    JSON.pretty_generate(params)
  end
end
