class TrabajosController < ApplicationController

  def create
    @trabajo = Trabajo.create(trabajo_params)
    # if @trabajo.save
    #   render json: {trabajo: @trabajo.attributes}, status: :created
    # else
    #   render json: {created: false, error_message: @trabajo.errors.full_messages}, status: :not_aceptable
    # end
    
  end

  def index
    @trabajos = Trabajo.all
    render json: @trabajos, status: :ok
  end

  private


  def trabajo_params
    params.permit(:description)
  end
  
end
