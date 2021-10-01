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
    @free_proveedors = Appointment.all.filter do |p|
      p.date.to_s != params[:date]
    end

    if @free_proveedors.any?
      render json: @free_proveedors, status: :ok
    else
      render json: {avaliable_proveedors: none}, status: :ok
    end
  end

  def allAppointments
    # @appointments = Appointment.find_by(proveedor_id: params[:id])
    @appointments = Appointment.all.order(date: :desc)
    @supporteById = @appointments.filter do |p|
      p.proveedor_id = params[:id]
    end
    @allAppArray = []
    @allAppointments = {}
    @supporteById.each do |app|
      @allAppointments[app.date] << {
        trabajo_id: app.trabajo_id,
        proveedor_id: app.proveedor_id,
        date: app.date,
        start_time: app.start_time,
        end_time: app.end_time
      }
      @allAppArray << @allAppointments[app.date]
      @allAppArray
    end


    
    # new_hash = {}
    # current_hash.each do |value_array|
    #   new_hash[key] ||= {}
    
    #   # value_array.each do |values|
    #   #   new_values = values.dup
    #   #   new_values.delete(:id)
    
    #     new_values.each do |attribute_name, attribute_value|
    #       new_hash[date] ||= []
    #       new_hash[key][attribute_name] << attribute_value
    #     end
    #   end
    # end


      render json: @allAppointments, status: :ok
    
  end
  
  
  
  private

  def appointment_params
    params.permit(:trabajo_id, :proveedor_id, :date, :start_time, :end_time)
  end
end
