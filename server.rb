#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra/base'

class SleepServer < Sinatra::Base
  configure do
    enable :logging
    set :server, 'thin'
    set :threaded, true
    set :server_settings, :timeout => 600
  end

  configure :dev do
    set :logging, Logger::DEBUG
  end

  get '/sleep/:wait' do
    wait = params['wait']&.to_i || 1
    sleep(wait)
    "slept #{wait} seconds\n"
  end

  get '/healthz' do
    'ok'
  end

  not_found do
    '404 not found'
  end

  run! if app_file == $PROGRAM_NAME
end
