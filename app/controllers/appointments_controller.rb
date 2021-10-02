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
    render json: @appointments, status: :ok
  end

  def espacio
    @appoitnment = Appointment.find_by(proveedor_id: params[:id])
    if @appoitnment.date != params[:date] && @appoitnment.start_time.to_s(:time) != params[:hour] && @appoitnment.end_time.to_s(:time) < params[:hour]
      render json: {available: true}, status: :ok
    else
      render json: {available: false}, status: :ok
    end
  end

  def disponibles
    @free_proveedors = Appointment.all.order(proveedor_id: :desc)
    new_p_hash = {}

    temp_array = []
    @free_proveedors.select{|ap| ap[:date].to_s.include?(params[:date].to_s)}.map do |p|
      temp_array.push(
        p.proveedor_id
      )
      temp_array.uniq!
      temp_array.sort!
    end

    @prov_all = Proveedor.all.order(id: :asc)

    @prov_all.map do |pr|
      if !temp_array.include?(pr.id)
        new_p_hash[:avaliable_proveedores] ||= [] 
        new_p_hash[:avaliable_proveedores].push(
          { 
          proveedor_id: pr.id,
          proveedor: pr.name,
        }
        )
        new_p_hash
      end
    end



    if @free_proveedors.any?
      render json: new_p_hash, status: :ok
    else
      render json: {avaliable_proveedors: "none"}, status: :ok
    end
  end

  def allAppointments
    @appointments_all = Appointment.all.order(date: :desc)
    @supporteById = @appointments_all.filter do |p|
      p.proveedor_id = params[:id]
    end
    @allAppointments = {}
    new_hash = {}
    @supporteById.each do |app|
      temp = app.date
      new_hash[temp] ||= []
      new_hash[temp].push(
        {
          trabajo_id: app.trabajo_id,
          proveedor_id: app.proveedor_id,
          date: app.date,
          start_time: app.start_time,
          end_time: app.end_time
        }
      )
      new_hash[temp].sort_by! {|ap| ap[:start_time]}
      @allAppointments[temp] = new_hash[temp]
      @allAppointments
    end

      render json: @allAppointments, status: :ok
    
  end

  def hours
    @appointmentsInOrder = Appointment.all.order(date: :desc)
    @filted_app = @appointmentsInOrder.filter do |a|
      a.proveedor_id = params[:id]
      a.date = params[:date]
    end


    render json: @appointmentsInOrder, status: :ok
    
  end
  
  private

  def appointment_params
    params.permit(:trabajo_id, :proveedor_id, :date, :start_time, :end_time)
  end
end
