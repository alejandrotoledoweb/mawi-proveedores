class AppointmentsController < ApplicationController

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.start_time < @appointment.end_time
      @appointment.save
      return render json: @appointment, status: :created
    else
      return render json: @appointment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    @appointments = Appointment.all
    @providers = Proveedor.all
    render json: @providers, status: :ok
  end
  
  private

  def appointment_params
    params.permit(:trabajo_id, :proveedor_id, :date, :start_time, :end_time)
  end
end
