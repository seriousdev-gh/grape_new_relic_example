require 'newrelic_rpm'
require 'grape'

class LongProcess
  include ::NewRelic::Agent::MethodTracer

  def sleep_1
    sleep 1
  end

  def sleep_2
    sleep 2
  end

  add_method_tracer :sleep_1, 'Custom/LongProcess/1'
  add_method_tracer :sleep_2, 'Custom/LongProcess/2'
end

class Main < Grape::API
  get '/test' do
    LongProcess.new.sleep_1
    LongProcess.new.sleep_2
    'ok'
  end
end

run Main
