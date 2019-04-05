require_relative 'advice'
require_relative 'bluize.rb'
require 'erb'
require 'pry'

class App < Bluize
  def advice
    Advice.new.generate
  end

  def random_number
    rand(100) + 1
  end

  def call(env)
    case env['REQUEST_PATH']
    when '/' then response(200, {'Content-Type' => 'text/html'}) { erb :index }
    when '/advice' then response(200, {'Content-Type' => 'text/html'}) { erb :advice, {message: advice} }
    when '/whoops' then response(200, {'Content-Type' => 'text/html'}, "404 Not Found")
    when '/favicon.ico' then response(200, {'Content-Type' => 'text/html'}, "no fav")
    end
  end
end