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

  def espacio
    @appoitnment = Appointment.find_by(proveedor_id: params[:id])
    if @appoitnment.date != params[:date] && @appoitnment.start_time.to_s(:time) != params[:hour] && @appoitnment.end_time < params[:hour]
      render json: {available: false}, status: :ok
    else
      render json: {available: true}, status: :ok
    end
  end

  def disponibles
    @appointments = Appointment.all
    @free_proveedors = Appointment.all.filter do |p|
      p.date.to_s != params[:date]
      
    end
    if @free_proveedors.any?
      render json: @free_proveedors, status: :ok
    else
      render json: {avaliable_proveedors: none}, status: :ok
    end
  end
  
  
  private

  def appointment_params
    params.permit(:trabajo_id, :proveedor_id, :date, :start_time, :end_time)
  end
end
