class AppointmentsController < ApplicationController
  def create
    user = User.find_or_create_by!(user_params)
    agent = Agent.find_by(id: params[:agent_id].to_i)
    availability = Availability.find_by(id: params[:availability_id].to_i)

    if user.appointments.create(agent:, availability:)
      availability.update!(reserved: true)

      redirect_to appointment_success_url, notice: helpers.success_notification(
        agent_name: agent.name,
        day_of_week: availability.day_of_week,
        from: helpers.local_time(availability.start_at, agent.timezone.offset.to_i),
        to: helpers.local_time(availability.end_until, agent.timezone.offset.to_i)
      )
    else
      render agent_path(agent), status: :unprocessable_entity
    end
  end

  def show
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
