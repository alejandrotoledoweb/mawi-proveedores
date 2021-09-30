class TrabajosController < ApplicationController

  def create
    @trabajo = Trabajo.new(trabajo_params)
    if @trabajo.save
      render json: {trabajo: @trabajo.attributes}, status: :created
    else
      render json: {created: false, error_message: @trabajo.erros.full_messages}, status: :not_aceptable
    end
    
  end

  def index
    @trabajos = Proveedor.all
    render json: @trabajo, status: :ok
  end

  private


  def trabajo_params
    params.permit(:description)
  end
  
end
