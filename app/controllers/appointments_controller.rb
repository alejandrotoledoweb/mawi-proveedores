class AppointmentsController < ApplicationController

  def index
    @appointments = Appointments.all
    render json: @appointments
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.start_time < @appointment.end_time
      @appointment.save
      return render json: @appointment, status: :created
    else
      return render json: @appointment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.permit(:trabajo_id, :proveedor_id, :date, :start_time, :end_time)
  end
end
