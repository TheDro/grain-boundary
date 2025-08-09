class ConnectionsController < ApplicationController
  @connections = []

  def self.connections
    @connections
  end
  
  def index
    render json: { 
      status: "ok",
      connections: self.class.connections
    }
  end

  def create
    connection = {
      id: self.class.connections.size + 1,
      url: params[:url],
      started_at: Time.now,
      response_code: nil,
      finished_at: nil,
      thread: nil
    }

    thread = Thread.new do
      connection[:thread] = Thread.current
      response = Faraday.get(params[:url])
      connection[:finished_at] = Time.now
      connection[:response_code] = response.status
    end

    connection[:thread] = thread

    self.class.connections << connection

    render json: { 
      status: "ok",
    }
  end

  def destroy
    self.class.connections.each do |connection|
      connection[:thread].kill
    end
    self.class.connections.clear
    render json: { 
      status: "ok",
    }
  end
end