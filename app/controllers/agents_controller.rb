class AgentsController < ApplicationController
  def index
    agents = Agent.preload(:timezone).all
    render :index, {locals: {agents:}}
  end

  def show
    agent = Agent.preload(:timezone, :availabilities).find_by(id: params[:id])
    # availabilities = group_availabilities(agent.availabilities)
    render :show, {locals: {agent:}}
  end

  private

  def group_availabilities(availabilities)
    availabilities.each_with_object({}) do |av, obj|
      if obj[av.day_of_week].present?
        obj[av.day_of_week].concat([av])
      else
        obj[av.day_of_week] = [av]
      end
    end
  end
end
