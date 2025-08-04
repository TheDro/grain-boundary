class DelayController < ApplicationController

  def index
    sleep_time
    run_time

    current_port = ENV["PORT"]

    render json: { 
      current_port: current_port,
      status: "ok" 
    }.merge(ENV.to_h)
    # TODO: never run this in production
  end

  def sleep_time
    time = params[:sleep_time].to_f

    if time > 0
      sleep(time)
    end
  end

  def run_time
    time = params[:run_time].to_f

    if time > 0
      raise "Not implemented yet"
    end
  end
end