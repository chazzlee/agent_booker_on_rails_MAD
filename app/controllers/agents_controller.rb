class AgentsController < ApplicationController
  def index
    agents = Agent.preload(:timezone).all
    render :index, {locals: {agents:}}
  end

  def show
    agent = Agent.preload(:timezone, :availabilities).find_by(id: params[:id])
    render :show, {locals: {agent:}}
  end
end
