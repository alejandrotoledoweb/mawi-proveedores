class AppointmentsController < ApplicationController

  def create
    @appointment = Appointment.new(appointment_params)
    check = []
    @appointments_all = Appointment.all.select{|ap| ap.date.to_s(:time) == @appointment.date}.map do |ap|
      if ap.start_time = @appointment.start_time && ap.end_time >=  @appointment.end_time && ap.start_time < @appointment.start_time 
        chec.push(false)
      else
        check.push(true)
      end
      check
    end
    if !check.include?(false)
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
    if @appoitnment.date != params[:date] && @appoitnment.start_time.to_s(:time) != params[:hour] &&  @appoitnment.start_time.to_s(:time) > params[:hour] && @appoitnment.end_time.to_s(:time) <= params[:hour]
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
    @allAppointments = {}
    new_hash = {}

    @appointments_all.select{|ap| ap.proveedor_id.to_s == params[:id]}.map do |app|
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
    @appointmentsInOrder = Appointment.all.order(id: :desc)

    temp_array = []
    @appointmentsInOrder.select{|ap| ap[:date].to_s[0..6].eql?(params[:date][0..6]) && ap.proveedor_id.to_s == params[:id]}.map do |p|
      temp_array.push(
        (p.end_time  - p.start_time)/3600
      )
      temp_array.sort!
    end

    totalOfHours = temp_array.reduce(:+)
    date_calculated = params[:date][0..6]

    total = { 
      "total_hours" => totalOfHours,
      "month" => date_calculated
     }

    if !temp_array.empty?
      render json: total, status: :ok
    else
      render json: {hours: "not found any information"}, status: :ok
    end
    
  end
  
  private

  def appointment_params
    params.permit(:trabajo_id, :proveedor_id, :date, :start_time, :end_time)
  end
end
