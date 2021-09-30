class AppointmentsController < ApplicationController

  def index
    @appointments = Appointments.all
    render json: @appointments
  end

  def create
    @appointment = Appointment.create(appointment_params)
    return json_response(@appointment, :created) if @appointment.valid?

    error_message
  end

  private

  def appointment_params
    params.permit(:trabajo_id, :proveedor_id, :date, :start_time, :end_time)
  end
end
