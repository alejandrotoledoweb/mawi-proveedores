class ProveedorsController < ApplicationController

  def create
    @proveedor = Proveedor.new(proveedor_params)
    if @proveedor.save
      render json: {proveedor: @proveedor.attributes}, status: :created
    else
      render json: {created: false, error_message: @proveedor.errors.full_messages}, status: :not_aceptable
    end
    
  end

  def index
    @proveedors = Proveedor.all
    render json: @proveedors, status: :ok
  end
  
  def libre_por_fecha(fecha)
    @proveedors = Proveedor.all
    @libres_por_fecha = @proveedors.select {|p| p.appointment.date != fecha}
    render json: @libres_por_fecha, status: :ok
  end
  

  private

  def proveedor_params
    params.permit(:name)
  end
  

end
